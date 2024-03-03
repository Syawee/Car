import 'package:flutter/material.dart';
import 'package:car/data.dart';

Widget buildDealer(Dealer dealer, int index){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
    padding: EdgeInsets.all(12),
    margin: EdgeInsets.only(right: 12, left: index == 0 ? 12 : 0),
    width: 100,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(dealer.image), 
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          height: 550,
          width: 550,
        ),

        SizedBox(
          height: 16,
        ),

        Text(
          dealer.name,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),

        Text(
          "${dealer.offers} offers",
          style: TextStyle(
            fontSize: 25,
            color: Colors.grey,
          ),
        ),

      ],
    ),
  );
}