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

  /// Mirrors the home feed's parsing: the server calls a fully-subscribed
  /// pool CLOSED, and unknown values degrade to open.
  static PoolStatus _statusFromApi(String raw) => switch (raw.toUpperCase()) {
    'CLOSED' || 'FILLED' => PoolStatus.filled,
    'FUNDED' => PoolStatus.funded,
    'EXPIRED' => PoolStatus.expired,
    _ => PoolStatus.open,
  };
}
