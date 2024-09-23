class CategoryModel {
  String url;
  String name;

  CategoryModel({required this.name, required this.url});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }
}
