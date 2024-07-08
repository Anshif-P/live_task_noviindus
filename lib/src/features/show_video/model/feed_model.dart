class FeedModel {
  FeedModel({
    required this.id,
    required this.description,
    required this.image,
    required this.video,
    required this.likes,
    required this.dislikes,
    required this.bookmarks,
    required this.hide,
    required this.createdAt,
    required this.follow,
    required this.user,
  });

  final int? id;
  final String? description;
  final String? image;
  final String? video;
  final List<int> likes;
  final List<dynamic> dislikes;
  final List<dynamic> bookmarks;
  final List<dynamic> hide;
  final DateTime? createdAt;
  final bool? follow;
  final User? user;

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      id: json["id"],
      description: json["description"],
      image: json["image"],
      video: json["video"],
      likes: json["likes"] == null
          ? []
          : List<int>.from(json["likes"]!.map((x) => x)),
      dislikes: json["dislikes"] == null
          ? []
          : List<dynamic>.from(json["dislikes"]!.map((x) => x)),
      bookmarks: json["bookmarks"] == null
          ? []
          : List<dynamic>.from(json["bookmarks"]!.map((x) => x)),
      hide: json["hide"] == null
          ? []
          : List<dynamic>.from(json["hide"]!.map((x) => x)),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      follow: json["follow"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "image": image,
        "video": video,
        "likes": likes.map((x) => x).toList(),
        "dislikes": dislikes.map((x) => x).toList(),
        "bookmarks": bookmarks.map((x) => x).toList(),
        "hide": hide.map((x) => x).toList(),
        "created_at": createdAt?.toIso8601String(),
        "follow": follow,
        "user": user?.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.image,
  });

  final int? id;
  final String? name;
  final dynamic image;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      name: json["name"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
