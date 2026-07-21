import 'package:co_buy/features/alerts/data/dtos/notification_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'notifications_data_source.g.dart';

@RestApi()
abstract class NotificationsDataSource {
  factory NotificationsDataSource(Dio dio, {String? baseUrl}) =
      _NotificationsDataSource;

  @GET('/notifications/mine')
  Future<NotificationsResponseDto> getNotifications();
}
