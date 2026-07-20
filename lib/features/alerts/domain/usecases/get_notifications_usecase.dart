import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/app_notification.dart';
import '../repositories/notifications_repository.dart';

@injectable
class GetNotificationsUseCase
    implements UseCase<List<AppNotification>, NoParams> {
  GetNotificationsUseCase(this._repo);

  final NotificationsRepository _repo;

  @override
  FutureResult<List<AppNotification>> call(NoParams params) =>
      _repo.getNotifications();
}
