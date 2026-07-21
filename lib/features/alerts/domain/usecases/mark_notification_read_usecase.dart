import 'package:injectable/injectable.dart';

import '../../../../core/error/result.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/notifications_repository.dart';

/// Marks a single notification read by id (`PATCH /notifications/{id}/read`).
@injectable
class MarkNotificationReadUseCase implements UseCase<void, String> {
  MarkNotificationReadUseCase(this._repo);

  final NotificationsRepository _repo;

  @override
  FutureResult<void> call(String id) => _repo.markAsRead(id);
}
