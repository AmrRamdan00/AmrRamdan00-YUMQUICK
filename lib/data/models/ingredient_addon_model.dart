class IngredientAddon {
  final String id;
  final String name;
  final double price;

  const IngredientAddon({
    required this.id,
    required this.name,
    required this.price,
  });

  factory IngredientAddon.fromJson(Map<String, dynamic> json) {
    return IngredientAddon(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'price': price};
  }
}
