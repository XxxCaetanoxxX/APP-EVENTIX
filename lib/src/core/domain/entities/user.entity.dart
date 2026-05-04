import 'package:eventix/src/core/domain/entities/image.entity.dart';
import 'package:eventix/src/core/domain/entities/mixins/audit.mixin.dart';
import 'package:eventix/src/core/domain/entities/organizer.entity.dart';

class UserEntity extends OrganizerEntity with AuditMixin {
  final String email;
  final String? cpf;
  final String? phone;
  final String role;
  final ImageEntity? image;

  UserEntity({
    required this.email,
    this.cpf,
    this.phone,
    required this.role,
    this.image,
    required super.id,
    required super.name,
  });
}
