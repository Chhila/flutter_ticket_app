import 'package:flutter/material.dart';

class AppTicketTabs extends StatelessWidget {
  final String firstTab;
  final String secondTab;
  const AppTicketTabs({super.key, required this.firstTab, required this.secondTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color(0xFFF4F6FD),
      ),
      child: Row(
        children: [
          AppTabs(tabText: firstTab, tabBorder: false, tabSelected: true),
          AppTabs(tabText: secondTab, tabBorder: true, tabSelected: false),
        ],
      ),
    );
  }
}

class AppTabs extends StatelessWidget {
  final String tabText;
  final bool tabBorder;
  final bool tabSelected;
  const AppTabs({super.key, this.tabText = "", this.tabBorder = false, this.tabSelected = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.44,
      decoration: BoxDecoration(
        color: tabSelected ? Colors.white : Colors.transparent,
        borderRadius: tabBorder ? BorderRadius.horizontal(right: Radius.circular(50)) : BorderRadius.horizontal(left: Radius.circular(50)),
      ),
      child: Center(
        child: Text(tabText),
      ),
    );
  }
}
