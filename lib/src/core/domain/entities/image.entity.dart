class ImageEntity {
  final int? id;
  final int? userId;
  final int? eventId;
  final String path;

  ImageEntity({
    this.id, 
    this.userId, 
    this.eventId,
    required this.path,
  });
}
