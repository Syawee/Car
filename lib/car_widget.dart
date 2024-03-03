import 'package:flutter/material.dart';
import 'package:car/data.dart';
import 'package:car/constants.dart';


Widget buildCar(Car car, int? index){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
       Radius.circular(15),
      ),
    ),
    padding: EdgeInsets.all(16),
    margin :EdgeInsets.only(right: index != null ? 16 : 0, left: index == 0 ? 16 : 0),
    width: 220,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              )
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                car.condition,
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 12, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),

        SizedBox(
          height: 8,
        ),


        SizedBox(
          height: 200,
          child:  Center(
           child: car.images != null && car.images.isNotEmpty
        ? Image.asset(
              car.images[0],
              fit: BoxFit.fitWidth,
        )
         : Placeholder(),
            
          ),
        ),
      

        SizedBox(
          height: 50,
        ),

      Text(//ชื่อbrandรถ
        car.brand,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          height: 0,
        ),
      ),

      


       SizedBox(
          height: 50,
        ),

      Text(
        car.model,
        style: TextStyle(
          fontSize: 25,
          

        ),
      ),

      

  
Text(
      car.condition == "Daily"
          ? "\$${car.pricePerDay.toString()} per day"
          : car.condition == "Weekly"
              ? "\$${car.pricePerWeek.toString()} per week"
              : " 900",
      style: TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,  // สีตามต้องการ
      ),
    ),
    
],


    ),
 
  );
}