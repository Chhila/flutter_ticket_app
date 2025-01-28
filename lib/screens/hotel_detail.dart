import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/style/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int index = 0;

  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    index = args["index"];
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: 300,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, color: AppStyles.primaryColor),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(
              //   hotelList[index]["place"],
              //   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              // ),
              // centerTitle: true,
              // background: Image.network("https://fakeimg.pl/600x400"),
              // background: Image.asset("assets/images/${hotelList[index]["image"]}", fit: BoxFit.cover),
              background: Stack(
                children: [
                  Positioned.fill(child: Image.asset("assets/images/${hotelList[index]["image"]}", fit: BoxFit.cover)),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.black.withAlpha(50),
                      child: Text(
                        hotelList[index]["place"],
                        style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text("More Images", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(margin: EdgeInsets.only(left: 15), child: Image.network("https://fakeimg.pl/200x200"));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
