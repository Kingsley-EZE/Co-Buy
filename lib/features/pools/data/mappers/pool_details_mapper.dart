import 'package:co_buy/features/home/data/mappers/pool_category_mapper.dart';
import 'package:co_buy/features/home/domain/entities/pool.dart';
import 'package:co_buy/features/pools/data/dtos/pool_details_dto.dart';
import 'package:co_buy/features/pools/domain/entities/pool_details.dart';

extension PoolDetailsDtoX on PoolDetailsDto {
  PoolDetails toEntity() => PoolDetails(
    id: id,
    name: name,
    description: description,
    leaderId: leaderId,
    category: category?.toEntity(),
    targetAmount: targetAmount,
    amountRaised: amountRaised,
    amountPerSlot: amountPerSlot,
    maxMembers: maxMembers,
    splitEven: splitEven,
    beneficiaryAccountName: beneficiaryAccountName,
    beneficiaryBankName: beneficiaryBankName,
    beneficiaryAccountNumber: beneficiaryAccountNumber,
    shareLink: shareLink,
    deadlineAt: DateTime.parse(deadlineAt),
    status: _statusFromApi(status),
    slotsRemaining: slotsRemaining,
  );

  /// Only an explicit OPEN is joinable. The server calls a fully-subscribed
  /// pool CLOSED; every other lifecycle state — EXPIRED and transitional ones
  /// like REFUNDING/REFUNDED — degrades to a non-open status so the details
  /// page hides the join/pay CTA (see `canJoin`). This deliberately differs
  /// from the home feed, which degrades unknowns to OPEN to keep listing them.
  static PoolStatus _statusFromApi(String raw) => switch (raw.toUpperCase()) {
    'OPEN' => PoolStatus.open,
    'CLOSED' || 'FILLED' => PoolStatus.filled,
    'FUNDED' => PoolStatus.funded,
    _ => PoolStatus.expired,
  };
}
