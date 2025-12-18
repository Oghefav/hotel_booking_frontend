class BookingModel {
  String? bookingId;
  String hotelName;
  String roomType;
  DateTime checkInDate;
  DateTime checkOutDate;
  String bookingStatus;
  String roomImage;

  BookingModel({
    this.bookingId,
    required this.hotelName,
    required this.roomType,
    required this.checkInDate,
    required this.checkOutDate,
    required this.bookingStatus,
    required this.roomImage,
  });
}
