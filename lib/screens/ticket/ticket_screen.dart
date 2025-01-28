import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/res/style/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/base/widgets/app_column_text_layout.dart';
import 'package:ticket_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/screens/ticket/widgets/ticket_positioned_circles.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late int ticketIndex = 0;

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      var args = ModalRoute.of(context)!.settings.arguments as Map;
      ticketIndex = args["index"];
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: Text("Ticket"),
        backgroundColor: AppStyles.bgColor,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.all(20),
              children: [
                // Text("Tickets", style: AppStyles.headLineStyle1),
                SizedBox(height: 20),
                AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
                SizedBox(height: 20),
                Container(padding: EdgeInsets.only(left: 16), child: TicketView(ticket: ticketList[ticketIndex], isColor: true)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                    color: AppStyles.ticketColor,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppColumnTextLayout(
                            topText: "Flutter DB",
                            bottomText: "Passenger",
                            alignment: CrossAxisAlignment.start,
                            isColor: true,
                          ),
                          AppColumnTextLayout(
                            topText: "123 345 678",
                            bottomText: "Passenger",
                            alignment: CrossAxisAlignment.end,
                            isColor: true,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      AppLayoutbuilderWidget(
                        randomDivider: 15,
                        width: 5,
                        isColor: false,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppColumnTextLayout(
                            topText: "19230123123912",
                            bottomText: "Number of E-Ticket",
                            alignment: CrossAxisAlignment.start,
                            isColor: true,
                          ),
                          AppColumnTextLayout(
                            topText: "B46859",
                            bottomText: "Booking Code",
                            alignment: CrossAxisAlignment.end,
                            isColor: true,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      AppLayoutbuilderWidget(
                        randomDivider: 15,
                        width: 5,
                        isColor: false,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(AppMedia.visaCard, scale: 100),
                                  Text(" **** **** **** 1234"),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Payment method",
                                style: AppStyles.headLineStyle4,
                              )
                            ],
                          ),
                          AppColumnTextLayout(
                            topText: "\$245.99",
                            bottomText: "Price",
                            alignment: CrossAxisAlignment.end,
                            isColor: true,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      AppLayoutbuilderWidget(
                        randomDivider: 15,
                        width: 5,
                        isColor: false,
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: BarcodeWidget(
                            barcode: Barcode.code128(),
                            data: "https://github.com/Chhila",
                            drawText: false,
                            height: 50,
                            color: AppStyles.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: TicketView(ticket: ticketList[ticketIndex]),
                ),
              ],
            ),
            TicketPositionedCircles(
              pos: true,
            ),
            TicketPositionedCircles(),
          ],
        ),
      ),
    );
  }
}
