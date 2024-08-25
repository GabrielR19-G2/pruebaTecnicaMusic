class Song {
  final int? id;
  final String? name;
  final String? author;
  final String? musicNote;
  final String? pathSong;
  final String? pathVideo;
  final String? pathPdf;
  final int? idStatus;
  final int? idOrganization;
  final int? createdBy;
  final int? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? letter;

  Song({
    this.id,
    this.name,
    this.author,
    this.musicNote,
    this.pathSong,
    this.pathVideo,
    this.pathPdf,
    this.idStatus,
    this.idOrganization,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.letter,
  });

  // Factory method to create a Song from JSON
  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      name: json['name'],
      author: json['author'],
      musicNote: json['music_note'],
      pathSong: json['path_song'],
      pathVideo: json['path_video'],
      pathPdf: json['path_pdf'],
      idStatus: json['id_status'],
      idOrganization: json['id_organization'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      letter: json['letter'],
    );
  }

  // Method to convert a Song to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'author': author,
      'music_note': musicNote,
      'path_song': pathSong,
      'path_video': pathVideo,
      'path_pdf': pathPdf,
      'id_status': idStatus,
      'id_organization': idOrganization,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'letter': letter,
    };
  }
}
