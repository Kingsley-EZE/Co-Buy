import 'package:json_annotation/json_annotation.dart';

part 'pool_member_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PoolMembersResponseDto {
  const PoolMembersResponseDto({
    required this.success,
    required this.data,
    this.message,
  });

  final bool success;
  final List<PoolMemberDto> data;
  final String? message;

  factory PoolMembersResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PoolMembersResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolMembersResponseDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PoolMemberDto {
  const PoolMemberDto({
    required this.id,
    required this.poolId,
    required this.userId,
    required this.state,
    required this.joinedAt,
    this.user,
  });

  final String id;
  final String poolId;
  final String userId;
  final String state;
  final String joinedAt;
  final PoolMemberUserDto? user;

  factory PoolMemberDto.fromJson(Map<String, dynamic> json) =>
      _$PoolMemberDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolMemberDtoToJson(this);
}

@JsonSerializable()
class PoolMemberUserDto {
  const PoolMemberUserDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.avatar,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? avatar;

  factory PoolMemberUserDto.fromJson(Map<String, dynamic> json) =>
      _$PoolMemberUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PoolMemberUserDtoToJson(this);
}
