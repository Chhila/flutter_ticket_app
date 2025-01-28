import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/style/app_styles.dart';
import 'package:ticket_app/base/utils/app_routes.dart';
import 'package:ticket_app/base/widgets/app_double_text.dart';
import 'package:ticket_app/screens/search/widgets/app_text_icon.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:ticket_app/screens/search/widgets/find_tickets.dart';
import 'package:ticket_app/screens/search/widgets/ticket_promotion.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text(
              "What are\nyou looking for?",
              style: AppStyles.headLineStyle1.copyWith(fontSize: 35),
            ),
            SizedBox(height: 20),
            AppTicketTabs(firstTab: "Airline Tickets", secondTab: "Hotels"),
            SizedBox(height: 20),
            AppTextIcon(icon: Icons.flight_takeoff_rounded, text: "Departure"),
            SizedBox(height: 20),
            AppTextIcon(icon: Icons.flight_land_rounded, text: "Arrival"),
            SizedBox(height: 20),
            FindTickets(),
            SizedBox(height: 40),
            AppDoubleText(
              smallText: "View All",
              bigText: "Upcoming Flights",
              func: () => Navigator.pushNamed(context, AppRoutes.allTickets),
            ),
            SizedBox(height: 15),
            TicketPromotion(),
          ],
        ),
      ),
    );
  }
}
