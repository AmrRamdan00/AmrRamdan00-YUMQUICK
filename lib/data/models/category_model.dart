class CategoryModel {
  final String id;
  final String name;
  final String iconPath;
  final bool isSelected;

  CategoryModel({
    required this.id,
    required this.name,
    required this.iconPath,
    this.isSelected = false,
  });

  CategoryModel copyWith({
    String? id,
    String? name,
    String? iconPath,
    bool? isSelected,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      iconPath: iconPath ?? this.iconPath,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      iconPath: json['iconPath'] ?? '',
      isSelected: json['isSelected'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'iconPath': iconPath,
      'isSelected': isSelected,
    };
  }
}
