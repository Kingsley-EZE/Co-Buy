import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/dio_error_mapper.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/result.dart';
import '../../domain/entities/app_notification.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../datasources/notifications_data_source.dart';
import '../mappers/notification_mapper.dart';

@LazySingleton(as: NotificationsRepository)
class NotificationsRepositoryImpl implements NotificationsRepository {
  NotificationsRepositoryImpl(this._remote);

  final NotificationsDataSource _remote;

  @override
  FutureResult<List<AppNotification>> getNotifications() async {
    try {
      final dto = await _remote.getNotifications();
      return Right(
        dto.data.map((n) => n.toEntity()).toList(),
      );
    } on DioException catch (e) {
      return Left(mapDioException(e));
    } catch (_) {
      return const Left(UnknownFailure());
    }
  }
}
