import 'package:flutter/material.dart';

class NavigationItem {

  IconData iconData;

  NavigationItem(this.iconData);

}

List<NavigationItem> getNavigationItemList(){//ไอคอนจากข้างล่าง
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.calendar_today),
    NavigationItem(Icons.notifications),
    NavigationItem(Icons.person),
  ];
}

class Car {

  String brand;
  String model;
  
  String condition;
  List<String> images;

  Car(this.brand, this.model,  this.condition, this.images);

  get pricePerDay => null;

  get pricePerWeek => null;

}

List<Car> getCarList(){
  return [
    Car(
      "Toyota",
      "Yaris Ativ",
     
      "Day",
      [
        "assets/ALL NEW YARIS ATIV.png",
      ],
    ),
    Car(
      "Toyota",
      "Yaris Ativ",
     
      "Day",
      [
        "assets/ALL_NEW_YARIS_ATIV_150.png",
      ],
    ),
    Car(
      "ISUZU",
      "DMAx",
     
      "Day",
      [
        "assets/hi-lander-4-door-1-9-ddi-l-dolomite-pearl-white.png",
      ],
    ),
    Car(
      "Toyota",
      "Revo",
      
      "Day",
      [
        "assets/Hilux_Revo_Smart_Cab-removebg-preview.png",
      ],
    ),
    Car(
      "Toyota",
      "Corolla cross ",
      
      "Day",
      [
        "assets/toyota corolla cross red.png",
      ],
    ),
    Car(
      "Toyota",
      "Corolla cross ",
      
      "Day",
      [
        "assets/toyota corolla cross white.png",
      ],
    ),
  ];
}

  

class Dealer {

  String name;
  int offers;
  String image;


  Dealer(this.name, this.offers, this.image);

}
List<Dealer> getDealerList() {
  return <Dealer>[
    Dealer(
      "Yaris Ativ",
      900,
      "assets/ALL NEW YARIS ATIV.png",
    ),
    Dealer(
      "Yaris Ativ",
      900,
      "assets/ALL_NEW_YARIS_ATIV_150.png",
    ),
  
  ];
}

class Filter {

  String name;

  Filter(this.name);

}

List<Filter> getFilterList(){
  return <Filter>[
    Filter("Best Match"),
    Filter("Highest Price"),
    Filter("Lowest Price"),
  ];
}