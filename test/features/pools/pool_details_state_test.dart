import 'package:co_buy/features/home/domain/entities/pool.dart';
import 'package:co_buy/features/pools/domain/entities/pool_details.dart';
import 'package:co_buy/features/pools/domain/entities/pool_member.dart';
import 'package:co_buy/features/pools/presentation/blocs/pool_details_bloc/pool_details_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

PoolDetails makeDetails({
  PoolStatus status = PoolStatus.open,
  int slotsRemaining = 2,
}) => PoolDetails(
  id: 'p1',
  name: 'Birthday Contribution',
  description: null,
  leaderId: 'u-leader',
  category: null,
  targetAmount: 20000,
  amountRaised: 16000,
  amountPerSlot: 2000,
  maxMembers: 10,
  splitEven: true,
  beneficiaryAccountName: 'Michael Chisom Ozor',
  beneficiaryBankName: 'OPAY 3',
  beneficiaryAccountNumber: '8108816975',
  shareLink: 'https://example.com/join/t1',
  deadlineAt: DateTime(2026, 8, 19),
  status: status,
  slotsRemaining: slotsRemaining,
);

PoolMember makeMember({
  String userId = 'u1',
  PoolMemberState state = PoolMemberState.paid,
}) => PoolMember(
  id: 'm-$userId',
  userId: userId,
  name: 'Ben Thony',
  state: state,
  joinedAt: DateTime(2026, 7, 19),
  avatarUrl: null,
);

void main() {
  group('membersHeader', () {
    test('shows the paid and open-slot tallies while the pool fills', () {
      final state = PoolDetailsState(
        detailsStatus: PoolDetailsRequestStatus.success,
        details: makeDetails(slotsRemaining: 2),
        membersStatus: PoolDetailsRequestStatus.success,
        members: [for (var i = 0; i < 8; i++) makeMember(userId: 'u$i')],
      );

      expect(state.membersHeader, 'MEMBERS – 8 PAID – 2 OPEN SLOTS');
    });

    test('drops the open-slots part when the pool is full but unpaid', () {
      final state = PoolDetailsState(
        detailsStatus: PoolDetailsRequestStatus.success,
        details: makeDetails(slotsRemaining: 0),
        membersStatus: PoolDetailsRequestStatus.success,
        members: [
          for (var i = 0; i < 9; i++) makeMember(userId: 'u$i'),
          makeMember(userId: 'u9', state: PoolMemberState.pending),
        ],
      );

      expect(state.membersHeader, 'MEMBERS – 9 PAID');
    });

    test('reads ALL PAID once the pool is full and settled', () {
      final state = PoolDetailsState(
        detailsStatus: PoolDetailsRequestStatus.success,
        details: makeDetails(slotsRemaining: 0),
        membersStatus: PoolDetailsRequestStatus.success,
        members: [for (var i = 0; i < 10; i++) makeMember(userId: 'u$i')],
      );

      expect(state.membersHeader, 'MEMBERS – ALL PAID');
    });

    test('stays plain MEMBERS until the list has loaded', () {
      final state = PoolDetailsState(
        details: makeDetails(),
        membersStatus: PoolDetailsRequestStatus.loading,
      );

      expect(state.membersHeader, 'MEMBERS');
    });
  });

  group('isMember', () {
    PoolDetailsState loadedState({List<PoolMember> members = const []}) =>
        PoolDetailsState(
          detailsStatus: PoolDetailsRequestStatus.success,
          details: makeDetails(),
          membersStatus: PoolDetailsRequestStatus.success,
          members: members,
        );

    test('is true for a user who holds a slot', () {
      expect(loadedState(members: [makeMember(userId: 'u1')]).isMember('u1'), true);
    });

    test('is true even when the member has not paid', () {
      final state = loadedState(
        members: [makeMember(userId: 'u1', state: PoolMemberState.pending)],
      );

      expect(state.isMember('u1'), true);
    });

    test('is false for a signed-in non-member', () {
      expect(loadedState(members: [makeMember(userId: 'u1')]).isMember('stranger'), false);
    });

    test('is false while members are still loading or without a session', () {
      final loading = PoolDetailsState(
        detailsStatus: PoolDetailsRequestStatus.success,
        details: makeDetails(),
        membersStatus: PoolDetailsRequestStatus.loading,
        members: [makeMember(userId: 'u1')],
      );

      expect(loading.isMember('u1'), false);
      expect(loadedState(members: [makeMember(userId: 'u1')]).isMember(null), false);
    });
  });

  group('canJoin', () {
    PoolDetailsState loadedState({
      PoolStatus status = PoolStatus.open,
      List<PoolMember> members = const [],
    }) => PoolDetailsState(
      detailsStatus: PoolDetailsRequestStatus.success,
      details: makeDetails(status: status),
      membersStatus: PoolDetailsRequestStatus.success,
      members: members,
    );

    test('allows a signed-in non-member while the pool is open', () {
      expect(loadedState().canJoin('stranger'), true);
    });

    test('allows a member who has not paid for their slot', () {
      final state = loadedState(
        members: [makeMember(userId: 'u1', state: PoolMemberState.pending)],
      );

      expect(state.canJoin('u1'), true);
    });

    test('rejects a member who already paid', () {
      final state = loadedState(members: [makeMember(userId: 'u1')]);

      expect(state.canJoin('u1'), false);
    });

    test('rejects everyone when the pool is not open', () {
      expect(loadedState(status: PoolStatus.filled).canJoin('stranger'), false);
    });

    test('rejects while members are still loading or without a session', () {
      final loading = PoolDetailsState(
        detailsStatus: PoolDetailsRequestStatus.success,
        details: makeDetails(),
        membersStatus: PoolDetailsRequestStatus.loading,
      );

      expect(loading.canJoin('stranger'), false);
      expect(loadedState().canJoin(null), false);
    });
  });
}
