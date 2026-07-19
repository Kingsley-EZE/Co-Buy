import 'package:co_buy/features/home/data/dtos/pool_category_dto.dart';
import 'package:co_buy/features/home/domain/entities/pool_category.dart';

extension PoolCategoryDtoX on PoolCategoryDto {
  PoolCategory toEntity() =>
      PoolCategory(id: id, name: name, description: description);
}
