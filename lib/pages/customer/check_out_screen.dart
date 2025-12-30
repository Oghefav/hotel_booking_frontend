import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/utility/card_number_input_formater.dart';
import 'package:hotel_booking_app/utility/date_input_formatter.dart';
import 'package:hotel_booking_app/utility/filter_header_delegate.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
import 'package:hotel_booking_app/widgets/custom_app_bar.dart';
import 'package:hotel_booking_app/widgets/custom_divider.dart';
import 'package:hotel_booking_app/widgets/small_text.dart';
import 'package:hotel_booking_app/widgets/sub_title_text.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List paymentMethods = ["Credit Card", "Bank Transfer"];
  String? selectedPaymentMethod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: FilterHeaderDelegate(child: const CustomAppBar(title: "Checkout"), height: 85.h),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  children: [
                    _orderSummarySection(),
                    SizedBox(height: 20.h),
                    _paymentMethodSection(),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              _submitButton(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _orderSummarySection() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(text: "Order Summary"),
            SizedBox(height: 8.h),
            _orderDetailBuilder(title: "Subtotal", detail: "₦30000.00"),
            _orderDetailBuilder(
              title: "Discounts",
              detail: "-₦1500.00",
              color: Colors.redAccent,
            ),
            _orderDetailBuilder(title: "Service  Fee", detail: "₦150.00"),
            SizedBox(height: 8.h),
            CustomDivider(),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubTitleText(
                  text: "Total",
                  fontsize: 12.sp,
                  color: Colors.lightBlueAccent,
                ),
                SubTitleText(
                  text: "₦28650.00",
                  fontsize: 12.sp,
                  color: Colors.lightBlueAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _orderDetailBuilder({
    required String title,
    required String detail,
    Color? color,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallText(text: title),
          SmallText(text: detail, color: color),
        ],
      ),
    );
  }

  Widget _paymentMethodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitleText(text: "Payment Method"),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () => onPaymentMethodSelected(paymentMethods[0]),
          child: _paymentMethodBuilder(paymentMethods[0]),
        ),
        GestureDetector(
          onTap: () => onPaymentMethodSelected(paymentMethods[1]),
          child: _paymentMethodBuilder(paymentMethods[1]),
        ),
        SizedBox(height: 9.h),
        if (selectedPaymentMethod == null)
          SizedBox()
        else if (selectedPaymentMethod == paymentMethods[0])
          _cardPaymentFormSection()
        else
          _bankTransferDetailSection(),
      ],
    );
  }

  Widget _paymentMethodBuilder(String paymentMethod) {
    return Card(
      color:
          selectedPaymentMethod == paymentMethod
              ? Color(0xFFE3F7FF)
              : Colors.white,
      shape: RoundedRectangleBorder(
        side:
            selectedPaymentMethod == paymentMethod
                ? BorderSide(color: Color(0xFF33C1FF))
                : BorderSide.none,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  paymentMethod == "Credit Card"
                      ? Icons.credit_card
                      : Icons.account_balance_wallet_outlined,
                  color: Colors.lightBlueAccent,
                ),
                SizedBox(width: 8.w),
                SmallText(text: paymentMethod),
              ],
            ),
            selectedPaymentMethod == paymentMethod
                ? Icon(Icons.check_circle_outline, color: Color(0xFF33C1FF))
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _cardPaymentFormSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitleText(text: "Card Details"),
        SizedBox(height: 5.h),
        _buildCardNumberfield(),
        SizedBox(height: 5.h),
        Row(
          children: [
            _buildExpiryField(),
            SizedBox(width: 10.w),
            _buildCvcField(),
          ],
        ),
        Row(
          children: [
            Icon(Icons.lock_outline, color: Colors.grey.shade700, size: 10.sp),

            SizedBox(width: 5.w),
            SmallText(
              text: "Your payment information is securely encryted.",
              fontsize: 9.sp,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCardNumberfield() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallText(
          text: "Card Number",
          fontsize: 12.sp,
          color: Colors.grey.shade900,
        ),
        SizedBox(height: 4.h),
        TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CardNumberInputFormatter(),
          ],
          maxLength: 19,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: _customOutputBorder(),
            hintText: "XXXX XXXX XXXX XXXX",
            focusedBorder: _customOutputBorder(),
            disabledBorder: _customOutputBorder(),
            enabledBorder: _customOutputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildExpiryField() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallText(
            text: "Expiry Date",
            fontsize: 12.sp,
            color: Colors.grey.shade900,
          ),
          SizedBox(height: 4.h),
          TextField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              DateInputFormatter(),
            ],
            keyboardType: TextInputType.datetime,
            maxLength: 5,
            decoration: InputDecoration(
              border: _customOutputBorder(),
              focusedBorder: _customOutputBorder(),
              disabledBorder: _customOutputBorder(),
              enabledBorder: _customOutputBorder(),
              hintText: "MM/YY",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCvcField() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallText(text: "CVV", fontsize: 12.sp, color: Colors.grey.shade900),
          SizedBox(height: 4.h),
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 3,
            obscureText: true,
            decoration: InputDecoration(
              border: _customOutputBorder(),
              hintText: "XXX",
              focusedBorder: _customOutputBorder(),
              disabledBorder: _customOutputBorder(),
              enabledBorder: _customOutputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bankTransferDetailSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitleText(text: "Bank Transfer"),
        SizedBox(height: 4.h),
        SmallText(
          text: "Make Transfer to the account details provided.",
          fontsize: 9.sp,
        ),
        SizedBox(height: 9.h),
        _buildbankDetails(),
        SizedBox(width: 9.h),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.info_outline, color: Colors.lightBlueAccent, size: 10.sp),
              SizedBox(width: 4.w),
              SmallText(
                text: "Only confirm if you have made transfer.",
                color: Colors.lightBlueAccent,
                fontsize: 10.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildbankDetails() {
    return Card(
      color: Colors.grey.shade200,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: "Account Number", fontsize: 13),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SubTitleText(text: "3456789765", fontsize: 14),
                        SizedBox(width: 5),
                        Icon(
                          Icons.copy_outlined,
                          size: 16,
                          color: Colors.grey.shade700,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SmallText(text: "Bank Name", fontsize: 13),
                    SubTitleText(text: "Zenith Bank", fontsize: 14),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(text: "Account Name", fontsize: 13),
                    SizedBox(height: 5),
                    SubTitleText(text: "Hotel Booking LTD", fontsize: 14),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SmallText(text: "Expiration time", fontsize: 13),
                    SubTitleText(text: "20:00", fontsize: 14),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _customOutputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200, width: 2.0),
    );
  }

  void onPaymentMethodSelected(String paymentMethod) {
    setState(() {
      selectedPaymentMethod = paymentMethod;
    });
  }

  Widget _promoCodeSection() {
    // complete promocode section
    return Column();
  }

  Widget _submitButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 40,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: SubTitleText(
          text: "Comfirm Payment",
          fontsize: 20,
          color: AppColours.white,
        ),
      ),
    );
  }
}
