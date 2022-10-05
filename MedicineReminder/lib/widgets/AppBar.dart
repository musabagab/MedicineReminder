import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key key,
    @required this.greenColor,
  }) : super(key: key);

  final Color greenColor;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      color: greenColor,
      width: double.infinity,
      padding: EdgeInsets.all(25),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Text(
            'Medicine Reminder',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: deviceWidth * .085,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
