class RestaurantModel {
  final int restaurantID;
  final String restaurantName;
  final String address;
  final String type;
  final bool parkingLot;

  RestaurantModel({
    required this.restaurantID,
    required this.restaurantName,
    required this.address,
    required this.type,
    required this.parkingLot,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      restaurantID: json['restaurantID'] ?? 0,
      restaurantName: json['restaurantName'] ?? '',
      address: json['address'] ?? '',
      type: json['type'] ?? '',
      parkingLot: json['parkingLot'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'restaurantID': restaurantID,
      'restaurantName': restaurantName,
      'address': address,
      'type': type,
      'parkingLot': parkingLot,
    };
  }
}
