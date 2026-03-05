abstract class HomeEvent {
    final String? city;
    final String? category;
    const HomeEvent({this.city, this.category});
}

// class FindHotel extends HomeEvent{
//     const FindHotel(String city) : super(city: city);
// }

class FetchHotels extends HomeEvent {
    const FetchHotels(String? category) : super(category: category);
}
