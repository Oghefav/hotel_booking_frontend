import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking_app/utility/card_number_input_formater.dart';
import 'package:hotel_booking_app/utility/date_input_formatter.dart';
import 'package:hotel_booking_app/utility/filter_header_delegate.dart';
import 'package:hotel_booking_app/widgets/app_colours.dart';
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
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: FilterHeaderDelegate(child: _appbarSection(), height: 85),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _orderSummarySection(),
                    SizedBox(height: 20),
                    _paymentMethodSection(),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // CustomDivider(),
              SizedBox(height: 15),
              _submitButton(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _appbarSection() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 20),

      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios_new_outlined),
              ),
              SizedBox(width: 5),
              Text(
                "Checkout",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          CustomDivider(),
        ],
      ),
    );
  }

  Widget _orderSummarySection() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleText(text: "Order Summary"),
            SizedBox(height: 10),
            _orderDetailBuilder(title: "Subtotal", detail: "₦30000.00"),
            _orderDetailBuilder(
              title: "Discounts",
              detail: "-₦1500.00",
              color: Colors.redAccent,
            ),
            _orderDetailBuilder(title: "Service  Fee", detail: "₦150.00"),
            SizedBox(height: 10),
            CustomDivider(),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubTitleText(
                  text: "Total",
                  fontsize: 18,
                  color: Colors.lightBlueAccent,
                ),
                SubTitleText(
                  text: "₦28650.00",
                  fontsize: 18,
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
      padding: const EdgeInsets.symmetric(vertical: 5),
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
        SizedBox(height: 10),
        GestureDetector(
          onTap: () => onPaymentMethodSelected(paymentMethods[0]),
          child: _paymentMethodBuilder(paymentMethods[0]),
        ),
        GestureDetector(
          onTap: () => onPaymentMethodSelected(paymentMethods[1]),
          child: _paymentMethodBuilder(paymentMethods[1]),
        ),
        SizedBox(height: 10),
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
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
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
                SizedBox(width: 10),
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
        SizedBox(height: 5),
        _buildCardNumberfield(),
        SizedBox(height: 5),
        Row(
          children: [
            _buildExpiryField(),
            SizedBox(width: 10),
            _buildCvcField(),
          ],
        ),
        Row(
          children: [
            Icon(Icons.lock_outline, color: Colors.grey.shade700, size: 15),

            SizedBox(width: 5),
            SmallText(
              text: "Your payment information is securely encryted.",
              fontsize: 13,
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
          fontsize: 16,
          color: Colors.grey.shade900,
        ),
        SizedBox(height: 5),
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
            fontsize: 16,
            color: Colors.grey.shade900,
          ),
          SizedBox(height: 5),
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
          SmallText(text: "CVV", fontsize: 16, color: Colors.grey.shade900),
          SizedBox(height: 5),
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
        SizedBox(height: 5),
        SmallText(
          text: "Make Transfer to the account details provided.",
          fontsize: 13,
        ),
        SizedBox(height: 10),
        _buildbankDetails(),
        SizedBox(width: 10),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.info_outline, color: Colors.lightBlueAccent, size: 15),
              SizedBox(width: 5),
              SmallText(
                text: "Only confirm if you have made transfer.",
                color: Colors.lightBlueAccent,
                fontsize: 13,
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
