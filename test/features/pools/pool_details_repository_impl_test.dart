import 'package:co_buy/core/error/failures.dart';
import 'package:co_buy/features/home/data/dtos/pool_category_dto.dart';
import 'package:co_buy/features/home/domain/entities/pool.dart';
import 'package:co_buy/features/pools/data/datasources/pool_details_data_source.dart';
import 'package:co_buy/features/pools/data/dtos/pool_details_dto.dart';
import 'package:co_buy/features/pools/data/dtos/pool_member_dto.dart';
import 'package:co_buy/features/pools/data/dtos/pool_transaction_dto.dart';
import 'package:co_buy/features/pools/data/repositories/pool_details_repository_impl.dart';
import 'package:co_buy/features/pools/domain/entities/pool_member.dart';
import 'package:co_buy/features/pools/domain/entities/pool_transaction.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPoolDetailsDataSource extends Mock implements PoolDetailsDataSource {}

void main() {
  late MockPoolDetailsDataSource remote;
  late PoolDetailsRepositoryImpl repo;

  const detailsDto = PoolDetailsDto(
    id: '156d36f4-21f7-4026-86a4-221bd6232ac6',
    leaderId: 'u-leader',
    name: 'Birthday Contribution',
    description: 'To raise some funds for our dearly beloved friend',
    category: PoolCategoryDto(
      id: 'c1',
      name: 'GroupGift',
      description: 'Group gift — birthday, wedding, farewell gifts',
      isActive: true,
    ),
    targetAmount: 20000,
    amountRaised: 20,
    amountPerSlot: 2000,
    maxMembers: 10,
    splitEven: true,
    beneficiaryAccountNumber: '8108816975',
    beneficiaryAccountName: 'Michael Chisom Ozor',
    beneficiaryBankName: 'OPAY 3',
    shareLink: 'https://example.com/join/t1',
    deadlineAt: '2026-08-19T12:36:06.652Z',
    status: 'OPEN',
    slotsRemaining: 9,
  );

  setUp(() {
    remote = MockPoolDetailsDataSource();
    repo = PoolDetailsRepositoryImpl(remote);
  });

  test('getPoolDetails maps the response into a details entity', () async {
    when(() => remote.getPoolDetails(any())).thenAnswer(
      (_) async => const PoolDetailsResponseDto(
        success: true,
        data: detailsDto,
        message: 'Pool retrieved successfully',
      ),
    );

    final result = await repo.getPoolDetails('156d36f4');

    result.fold((f) => fail('expected Right, got $f'), (details) {
      expect(details.id, '156d36f4-21f7-4026-86a4-221bd6232ac6');
      expect(details.shortCode, '156d36f4');
      expect(details.status, PoolStatus.open);
      expect(details.category?.displayName, 'Group Gift');
      expect(details.paidSlots, 1);
      expect(details.isFull, false);
      // 20 raised of 20,000 rounds down to 0%.
      expect(details.fundedPercent, 0);
      // Only the last four digits of the account number are displayable.
      expect(details.maskedAccountNumber, '****6975');
    });
    verify(() => remote.getPoolDetails('156d36f4')).called(1);
  });

  test(
    'getPoolDetails maps a non-open lifecycle status (REFUNDING) to a '
    'non-open status so the join/pay CTA stays hidden',
    () async {
      const refundingDto = PoolDetailsDto(
        id: '156d36f4-21f7-4026-86a4-221bd6232ac6',
        leaderId: 'u-leader',
        name: 'Pepper soup',
        description: null,
        category: null,
        targetAmount: 10000,
        amountRaised: 0,
        amountPerSlot: 5000,
        maxMembers: 2,
        splitEven: true,
        beneficiaryAccountNumber: '0126377889',
        beneficiaryAccountName: 'UGWUTA NWABUEZE KINGSLEY',
        beneficiaryBankName: 'Union bank',
        shareLink: 'https://example.com/join/t2',
        deadlineAt: '2026-07-20T22:40:00.000Z',
        status: 'REFUNDING',
        slotsRemaining: 1,
      );
      when(() => remote.getPoolDetails(any())).thenAnswer(
        (_) async => const PoolDetailsResponseDto(
          success: true,
          data: refundingDto,
          message: 'Pool retrieved successfully',
        ),
      );

      final result = await repo.getPoolDetails('156d36f4');

      result.fold((f) => fail('expected Right, got $f'), (details) {
        expect(details.status, isNot(PoolStatus.open));
        // canJoin only clears for a non-open status; a slot still remains,
        // so this pins the fix that keeps REFUNDING out of the joinable path.
        expect(details.status, PoolStatus.expired);
      });
    },
  );

  test(
    'getPoolMembers maps PAID members and degrades unknown states to pending',
    () async {
      when(() => remote.getPoolMembers(any())).thenAnswer(
        (_) async => const PoolMembersResponseDto(
          success: true,
          data: [
            PoolMemberDto(
              id: 'm1',
              poolId: 'p1',
              userId: 'u-leader',
              state: 'PAID',
              joinedAt: '2026-07-19T14:58:11.820Z',
              user: PoolMemberUserDto(
                id: 'u-leader',
                firstName: 'Michael',
                lastName: 'Ozor',
                email: 'michael@yopmail.com',
              ),
            ),
            PoolMemberDto(
              id: 'm2',
              poolId: 'p1',
              userId: 'u2',
              state: 'AWAITING_SOMETHING',
              joinedAt: '2026-07-19T15:10:00.000Z',
            ),
          ],
        ),
      );

      final result = await repo.getPoolMembers('p1');

      result.fold((f) => fail('expected Right, got $f'), (members) {
        expect(members, hasLength(2));
        expect(members[0].name, 'Michael Ozor');
        expect(members[0].initials, 'MO');
        expect(members[0].state, PoolMemberState.paid);
        expect(members[1].state, PoolMemberState.pending);
        expect(members[1].hasPaid, false);
      });
    },
  );

  test(
    'getPoolTransactions maps PAID and PENDING rows and nested member names',
    () async {
      when(() => remote.getPoolTransactions(any())).thenAnswer(
        (_) async => const PoolTransactionsResponseDto(
          success: true,
          data: PoolTransactionsDataDto(
            transactions: [
              PoolTransactionDto(
                id: 'tx1',
                poolId: 'p1',
                membershipId: 'm1',
                paymentReference: 'CB-ref-1',
                monnifyTransactionReference: 'MNFY|1',
                amountExpected: 9000,
                amountPaid: 9000,
                state: 'PAID',
                paidAt: '2026-07-21T10:29:00.385Z',
                createdAt: '2026-07-21T09:28:36.131Z',
                updatedAt: '2026-07-21T09:29:00.662Z',
                membership: PoolTransactionMembershipDto(
                  id: 'm1',
                  userId: 'u1',
                  state: 'PAID',
                  user: PoolMemberUserDto(
                    id: 'u1',
                    firstName: 'Faith',
                    lastName: 'Shin',
                    email: 'ifeoma@yopmail.com',
                  ),
                ),
              ),
              PoolTransactionDto(
                id: 'tx2',
                poolId: 'p1',
                membershipId: 'm2',
                paymentReference: 'CB-ref-2',
                amountExpected: 9000,
                state: 'PENDING',
                createdAt: '2026-07-21T09:13:34.186Z',
                updatedAt: '2026-07-21T09:13:34.186Z',
                membership: PoolTransactionMembershipDto(
                  id: 'm2',
                  userId: 'u2',
                  state: 'PAID',
                  user: PoolMemberUserDto(
                    id: 'u2',
                    firstName: 'Mary',
                    lastName: 'Supreme',
                    email: 'okon@yopmail.com',
                  ),
                ),
              ),
            ],
          ),
          message: 'Pool transactions retrieved successfully',
        ),
      );

      final result = await repo.getPoolTransactions('p1');

      result.fold((f) => fail('expected Right, got $f'), (transactions) {
        expect(transactions, hasLength(2));
        expect(transactions[0].memberName, 'Faith Shin');
        expect(transactions[0].state, PoolTransactionState.paid);
        expect(transactions[0].displayAmount, 9000);
        expect(transactions[0].paidAt, isNotNull);
        expect(transactions[1].memberName, 'Mary Supreme');
        expect(transactions[1].state, PoolTransactionState.pending);
        expect(transactions[1].amountPaid, isNull);
        expect(transactions[1].displayAmount, 9000);
      });
      verify(() => remote.getPoolTransactions('p1')).called(1);
    },
  );

  test('getPoolDetails maps a network DioException to a Failure', () async {
    final opts = RequestOptions(path: '/pools/p1');
    when(() => remote.getPoolDetails(any())).thenThrow(
      DioException(
        requestOptions: opts,
        type: DioExceptionType.connectionTimeout,
      ),
    );

    final result = await repo.getPoolDetails('p1');

    expect(result.isLeft(), true);
    result.fold((f) => expect(f, isA<Failure>()), (_) => fail('expected Left'));
  });
}
