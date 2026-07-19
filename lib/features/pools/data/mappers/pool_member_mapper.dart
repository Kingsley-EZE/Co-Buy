import 'package:co_buy/features/pools/data/dtos/pool_member_dto.dart';
import 'package:co_buy/features/pools/domain/entities/pool_member.dart';

extension PoolMemberDtoX on PoolMemberDto {
  PoolMember toEntity() {
    final user = this.user;
    final name = user == null
        ? ''
        : '${user.firstName} ${user.lastName}'.trim();

    return PoolMember(
      id: id,
      userId: userId,
      name: name,
      // Anything the server doesn't explicitly call PAID renders as unpaid.
      state: state.toUpperCase() == 'PAID'
          ? PoolMemberState.paid
          : PoolMemberState.pending,
      joinedAt: DateTime.parse(joinedAt),
      avatarUrl: user?.avatar,
    );
  }
}
