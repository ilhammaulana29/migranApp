// lesson.dart
class Materi {
  final int id;
  final String title;
  final String description;
  final int halaman;
  final bool isCompleted;
  final bool isLocked;
  final String? videoUrl;
  final String? pdfUrl;
  final int order;

  Materi({
    required this.id,
    required this.title,
    required this.description,
    required this.halaman,
    this.isCompleted = false,
    this.isLocked = false,
    this.videoUrl,
    this.pdfUrl,
    required this.order,
  });

  // Copy with method
  Materi copyWith({
    int? id,
    String? title,
    String? description,
    int? halaman,
    bool? isCompleted,
    bool? isLocked,
    String? videoUrl,
    String? pdfUrl,
    int? order,
  }) {
    return Materi(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      halaman: halaman ?? this.halaman,
      isCompleted: isCompleted ?? this.isCompleted,
      isLocked: isLocked ?? this.isLocked,
      videoUrl: videoUrl ?? this.videoUrl,
      pdfUrl: pdfUrl ?? this.pdfUrl,
      order: order ?? this.order,
    );
  }
}