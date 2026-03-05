import 'package:another_flushbar/flushbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/features/facilities/domain/entities/hotel/hotels.dart';
import 'package:hotel_booking_app/features/facilities/presentation/bloc/local/;ocal_home_bloc.dart';
import 'package:hotel_booking_app/features/facilities/presentation/bloc/local/local_hotel_state.dart';
import 'package:hotel_booking_app/features/facilities/presentation/bloc/local/ocal_hotel_event.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';

class HotelList extends StatelessWidget {
  final List<HotelEntity> hotels;
  const HotelList({super.key, required this.hotels});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(itemBuilder: (context, index){
               return Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
              child: Container(
                margin: EdgeInsetsGeometry.only(bottom: 10.h),
          height: 250.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          child: Column(
            children: [
              SizedBox(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: hotels[index].image,
                        progressIndicatorBuilder: (context, url, progress) => const CupertinoActivityIndicator(),
                        height: 180.h,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 13.h,
                      right: 12.w,
                      child: BlocConsumer<LocalHotelBloc, LocalHotelState>(
                        listener: (context, state) {
                          if (state is LocalHotelSuccess){
                            Flushbar(
                              message: 'Hotel has been saved',
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.white,

                              flushbarPosition: FlushbarPosition.TOP,
                            ).show(context);

                          }
                        },
                        builder: (context, state) {
                          return IconButton(
                            onPressed: ()
                             {
                              if (!hotels[index].isFavorite)
                              {context.read<LocalHotelBloc>().add(SaveHotel(hotels[index]));
                              }else {
                                context.read<LocalHotelBloc>().add(DeleteHotel(hotels[index]));
                              }
                              },
                            icon: Icon( hotels[index].isFavorite ?
                              Icons.favorite: Icons.favorite_outline,
                              color: AppColours.white,
                              size: 18.sp,
                            ),
                          );
                        }
                      ),
                    ),
                    Positioned(
                      bottom: 14.h,
                      left: 8.w,
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_border_outlined,
                            color: AppColours.white,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            hotels[index].avgRating.toString(),
                            style: TextStyle(
                              color: AppColours.white,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        hotels[index].name,
                        style: TextStyle(
                          wordSpacing: 4.w,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.grey.shade700,),
                        SmallText(text: "${hotels[index].city}, ${hotels[index].country}")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          
        ),)

);
          
            }, itemCount: hotels.length,);
          
  }
}