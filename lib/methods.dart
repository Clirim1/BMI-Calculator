import 'package:flutter/material.dart';

const styleText1 = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const styleText2 = TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);

class Methods {
  GestureDetector makeCard(Color color, Widget cardChild, Function ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          )),
    );
  }

  Column makeIcons(String text, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          text,
          style: styleText1,
        ),
      ],
    );
  }
}
