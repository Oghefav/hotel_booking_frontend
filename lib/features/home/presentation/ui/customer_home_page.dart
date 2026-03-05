import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/features/home/presentation/widget/hotel_list.dart';
import 'package:hotel_booking_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:hotel_booking_app/features/home/presentation/bloc/home_event.dart';
import 'package:hotel_booking_app/features/home/presentation/bloc/home_state.dart';
import 'package:hotel_booking_app/features/home/presentation/ui/my_header_delegate.dart';
import 'package:hotel_booking_app/utility/filter_header_delegate.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/custom_divider.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';

class CustomerHomePage extends HookWidget {
  const CustomerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedFilter = useState<String>('all');
    String? category;

    useEffect((){
  
      context.read<HomeBloc>().add(FetchHotels(selectedFilter.value));
      
    },[selectedFilter.value]);
    
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColours.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: FilterHeaderDelegate(child: _appBarSection(), height: 86.h)),
          SliverPersistentHeader(
            pinned: true,
            delegate: MyHeaderDelegate( child: _quickFilterSection(selectedFilter))),
          _hotelSection(context, selectedFilter),

        ],
      )
    );
  }

  Widget _appBarSection() {
    return Column(
      children: [
        
        Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(height: 25.h),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40.h,
                width: 30.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  color: Colors.lightBlue,
                ),
                child: Center(
                  child: Icon(
                    Icons.apartment_outlined,
                    color: Colors.grey.shade200,
                    size: 25.sp,
                  ),
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search, size: 25.sp),
                    ),
                    CircleAvatar(
                      radius: 20.r,
                      foregroundColor: Colors.purple.shade200,
                      backgroundImage: AssetImage('assets/images/male_avatar.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),]
        ),
      ),
      CustomDivider(),
    ]);
  }

  Widget _searchSearch() {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300, width: 1.w),
        borderRadius: BorderRadius.circular(15.r),
      ),
      color: Colors.white,
      margin: EdgeInsets.all(15.h),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _textFieldContainer(
              400.w,
              Icon(Icons.location_on_outlined),
              "where do you want to stay ?",
            ),
            SizedBox(height: 13.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _textFieldContainer(
                  122.w,
                  Icon(Icons.calendar_month_outlined),
                  "Dates",
                ),
                _textFieldContainer(
                  122.w,
                  Icon(Icons.people_alt_outlined),
                  "Guests",
                ),
              ],
            ),
            SizedBox(height: 13.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                color: Colors.lightBlue,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search, color: AppColours.white),
                    SizedBox(width: 6.w),
                    Text(
                      "Find Hotels",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: "montserrat",
                        fontWeight: FontWeight.w700,
                        color: AppColours.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldContainer(double width, Widget prefixIcon, String helpText) {
    return Container(
      width: width,
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: Row(
        children: [
          prefixIcon,
          SizedBox(width: 4.w),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: helpText,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade400,
                ),
              ),
              style: TextStyle(decoration: TextDecoration.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickFilterSection(ValueNotifier selectedFilter) {
    final currentFilter = useValueListenable(selectedFilter);
    return ListView(
          scrollDirection: Axis.horizontal,
          children: [
           _chipBuilder(notifier: selectedFilter, text: "All", color:  selectedFilter.value == 'all' ? Colors.lightBlue : null, current: currentFilter ),
           SizedBox(width: 5.w,),
                   _chipBuilder(notifier: selectedFilter, text: "Popular", color: selectedFilter.value == 'popular' ? Colors.lightBlue : null,  current: currentFilter),
                  SizedBox(width: 5.w,),
                   _chipBuilder(notifier: selectedFilter, text: "Luxury", color: selectedFilter.value == 'luxury' ? Colors.lightBlue : null,  current: currentFilter),
                  SizedBox(width: 5.w,),
                  _chipBuilder(notifier: selectedFilter, text: "Boutique", color: selectedFilter.value == 'boutique' ? Colors.lightBlue : null, current: currentFilter),
                  SizedBox(width: 5.w,),
                  _chipBuilder(notifier: selectedFilter,text: "Budget-Friendly", color: selectedFilter.value == 'budget-friendly' ? Colors.lightBlue : null, current: currentFilter),
          ]);}
  
  Widget _chipBuilder({required ValueNotifier notifier,required String text, Color? color, required String current}) {
    return GestureDetector(
      onTap: () {
        notifier.value = text.toLowerCase();
      },
      child: Chip(
        color: color != null ? WidgetStateProperty.all(color) : WidgetStateProperty.all(Colors.white),
        side: BorderSide(color: current == notifier.value.toString().toLowerCase() ? Colors.grey.shade400: Colors.lightBlue, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r), ),
        label: SmallText(text: text),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, color:  current == notifier.value.toString().toLowerCase()? Colors.white: Colors.black),
        backgroundColor: color,
      ),
    );
  }

    Widget _hotelSection(BuildContext context, ValueNotifier selectedFilter){
      return  BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state){
          if (state is HomeLoading){
            return SliverFillRemaining(child: CupertinoActivityIndicator(),);
          }
          if (state is HomeSuccess && state.hotels!.isNotEmpty){
            final hotels = state.hotels;
            return HotelList(hotels: hotels!);
            }
          if (state is HomeSuccess && state.hotels!.isEmpty){
            return SliverFillRemaining(child: Center(child: SmallText(text: "No hotels found in this category")),);
          }
          return SliverFillRemaining(child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.refresh_outlined)),
                SmallText(text: "Request timeout. Tap to retry")
              ],
            ),
          ),);
        }
        );
    
}

}

