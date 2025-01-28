import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/style/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/base/utils/app_routes.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        backgroundColor: AppStyles.bgColor,
        centerTitle: true,
        title: Text("All Hotels"),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.hotelDetail);
        },
        child: Container(
          margin: EdgeInsets.only(left: 8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.9,
              ),
              itemCount: hotelList.length,
              itemBuilder: (BuildContext context, int index) {
                var singleHotel = hotelList[index];
                return HotelGridView(hotel: singleHotel, index: index);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class HotelGridView extends StatelessWidget {
  final Map<String, dynamic> hotel;
  final int index;
  const HotelGridView({
    super.key,
    required this.hotel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.hotelDetail, arguments: {"index": index});
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        padding: EdgeInsets.all(10),
        width: size.width * 0.6,
        height: 350,
        decoration: BoxDecoration(
          color: AppStyles.primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/${hotel['image']}"),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                hotel['place'],
                style: AppStyles.headLineStyle4.copyWith(color: AppStyles.kakiColor),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    hotel['destination'],
                    style: AppStyles.headLineStyle4.copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    "\$${hotel['price']}/Night",
                    style: AppStyles.headLineStyle4.copyWith(color: AppStyles.kakiColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
