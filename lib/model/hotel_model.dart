class HotelModel {
  final String name;
  final String city;
  final String country;
  final double price;
  final List<String> features;
  final int guestsMax;
  final double avgRating;
  final String image;

  HotelModel({
    required this.name,
    required this.city,
    required this.country,
    required this.price,
    required this.features,
    required this.guestsMax,
    required this.avgRating,
    required this.image
  });
}
