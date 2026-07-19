import 'package:co_buy/features/home/data/dtos/pool_dto.dart';
import 'package:co_buy/features/home/data/mappers/pool_category_mapper.dart';
import 'package:co_buy/features/home/domain/entities/pool.dart';

extension PoolDtoX on PoolDto {
  Pool toEntity() => Pool(
    id: id,
    name: name,
    description: description,
    leaderFirstName: leader?.firstName,
    leaderLastName: leader?.lastName,
    category: category?.toEntity(),
    targetAmount: targetAmount,
    amountRaised: amountRaised,
    amountPerSlot: amountPerSlot,
    maxMembers: maxMembers,
    splitEven: splitEven,
    beneficiaryAccountName: beneficiaryAccountName,
    beneficiaryBankName: beneficiaryBankName,
    shareLink: shareLink,
    deadlineAt: DateTime.parse(deadlineAt),
    status: _statusFromApi(status),
    slotsRemaining: slotsRemaining,
  );

  /// Unknown values fall back to [PoolStatus.open] so a new server status
  /// degrades to a joinable card instead of dropping the pool from the feed.
  static PoolStatus _statusFromApi(String raw) => switch (raw.toUpperCase()) {
    // The server calls a fully-subscribed pool CLOSED.
    'CLOSED' || 'FILLED' => PoolStatus.filled,
    'FUNDED' => PoolStatus.funded,
    'EXPIRED' => PoolStatus.expired,
    _ => PoolStatus.open,
  };
}

extension PoolStatusApiX on PoolStatus {
  /// The server's wire name for this status, used as the `status` query
  /// parameter on GET /pools. Note the naming mismatch: what the app shows
  /// as "Filled" the server calls CLOSED.
  String toApi() => switch (this) {
    PoolStatus.open => 'OPEN',
    PoolStatus.filled => 'CLOSED',
    PoolStatus.funded => 'FUNDED',
    PoolStatus.expired => 'EXPIRED',
  };
}
