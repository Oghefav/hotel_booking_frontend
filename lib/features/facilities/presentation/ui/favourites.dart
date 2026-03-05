import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_app/features/facilities/presentation/bloc/local/;ocal_home_bloc.dart';
import 'package:hotel_booking_app/features/facilities/presentation/bloc/local/local_hotel_state.dart';
import 'package:hotel_booking_app/features/home/presentation/widget/hotel_list.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildHotels()
        ],
      )
    );
  }

  Widget _buildHotels(){
    return BlocBuilder<LocalHotelBloc, LocalHotelState>(
      builder: (context, state){
        if (state is LocalHotelSuccess && state.hotels!.isNotEmpty){
        return HotelList(hotels: state.hotels!);
        }

        return SliverFillRemaining(child: 
        Center(child: SmallText(text: "You don't have any hotel saved")),);
      },
    );
  }
}