class Gallery {
  List<String>? images;

  Gallery({this.images});

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        images: List<String>.from(json['images'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        if (images != null) 'images': images,
      };
}
