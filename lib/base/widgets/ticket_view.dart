import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/style/app_styles.dart';
import 'package:ticket_app/base/widgets/app_column_text_layout.dart';
import 'package:ticket_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/base/widgets/big_circle.dart';
import 'package:ticket_app/base/widgets/big_dot.dart';
import 'package:ticket_app/base/widgets/text_style_fourth.dart';
import 'package:ticket_app/base/widgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  const TicketView({super.key, required this.ticket, this.wholeScreen = false, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      // height: 183,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen ? 0 : 16),
        child: Column(
          children: [
            // Blue Upper part of the Ticket
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isColor == null ? AppStyles.ticketBlue : AppStyles.ticketColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // Show departure and destination with icons first line
                  Row(
                    children: [
                      TextStyleThird(text: ticket["from"]["code"], isColor: isColor),
                      Expanded(child: Container()),
                      BigDot(isColor: true),
                      // Ticket flying icons
                      Expanded(
                        child: Stack(
                          children: [
                            SizedBox(height: 24, child: AppLayoutbuilderWidget(randomDivider: 7)),
                            Center(
                              child: Transform.rotate(
                                angle: 1.57,
                                child: Icon(
                                  Icons.local_airport_rounded,
                                  color: isColor == null ? Colors.white : AppStyles.planeSecondColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      BigDot(isColor: true),
                      Expanded(child: Container()),
                      TextStyleThird(text: ticket['to']['code'], isColor: isColor),
                    ],
                  ),
                  SizedBox(height: 3),
                  // Show departure and destination name with time
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(text: ticket['from']['name'], isColor: isColor),
                      ),
                      Expanded(child: Container()),
                      TextStyleFourth(text: ticket["flying_time"], isColor: isColor),
                      Expanded(child: Container()),
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(text: ticket['to']['name'], align: TextAlign.end, isColor: isColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Circles and Dots
            Container(
              height: 20,
              color: isColor == null ? AppStyles.ticketOrange : AppStyles.ticketColor,
              child: Row(
                children: [
                  BigCircle(isRight: true, isColor: true),
                  Expanded(child: AppLayoutbuilderWidget(randomDivider: 16, width: 6, isColor: isColor)),
                  BigCircle(isRight: false, isColor: true),
                ],
              ),
            ),
            // Orange Lower part of the Ticket
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isColor == null ? AppStyles.ticketOrange : AppStyles.ticketColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(isColor == null ? 20 : 0),
                  bottomLeft: Radius.circular(isColor == null ? 20 : 0),
                ),
              ),
              child: Column(
                children: [
                  // Show departure and destination with icons first line
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(topText: ticket["date"], bottomText: "Date", alignment: CrossAxisAlignment.start, isColor: isColor),
                      AppColumnTextLayout(topText: ticket['departure_time'], bottomText: "Departure Time", alignment: CrossAxisAlignment.center, isColor: isColor),
                      AppColumnTextLayout(topText: ticket['number'].toString(), bottomText: "Number", alignment: CrossAxisAlignment.end, isColor: isColor),
                      // Expanded(child: Container()),
                      // TextStyleThird(text: "08:00 AM"),
                      // Expanded(child: Container()),
                      // TextStyleThird(text: "23"),
                    ],
                  ),
                  SizedBox(height: 3),
                  // Show departure and destination name with time
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: 100,
                  //       child: Text(
                  //         "Date",
                  //         style: AppStyles.headLineStyle4.copyWith(color: Colors.white),
                  //       ),
                  //     ),
                  //     Expanded(child: Container()),
                  //     TextStyleFourth(text: "Departure Time"),
                  //     Expanded(child: Container()),
                  //     SizedBox(
                  //       width: 100,
                  //       child: TextStyleFourth(text: "Number", align: TextAlign.end),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
