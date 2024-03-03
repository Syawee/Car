import 'package:flutter/material.dart';
import 'package:car/constants.dart';
import 'package:car/data.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:car/car_widget.dart';
import 'package:car/dealer_widget.dart';
import 'package:car/available_cars.dart';
import 'package:car/book_car.dart';

class Showroom extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ShowroomState createState() => _ShowroomState();
}

class _ShowroomState extends State<Showroom> {
  List<NavigationItem> navigationItems = getNavigationItemList();
  late NavigationItem selectedItem;

  List<Car> cars = getCarList();
  List<Dealer> dealers = getDealerList();

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Car Rental", // หัวบนสุด
          style: GoogleFonts.roboto(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
       
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TOP DEALS",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 550,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  
                  children: buildDeals(),
                  
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildNavigationItems(),
        ),
      ),
    );
  }

  List<Widget> buildDeals() {
    List<Widget> list = [];
    for (var i = 0; i < cars.length; i++) {
      list.add(buildCar(cars[i], i));
    }
    return list;
  }

  List<Widget> buildDealers() {
    List<Widget> list = [];
    for (var i = 0; i < dealers.length; i++) {
      list.add(GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookCar(car: cars[i])),
            );
          },
          child: buildDealer(dealers[i], i)));
    }
    return list;
  }

  List<Widget> buildNavigationItems() {
    List<Widget> list = [];
    for (var i = 0; i < navigationItems.length; i++) {
      list.add(buildNavigationItem(navigationItems[i]));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = item;
        });
      },
      child: SizedBox(
        width: 30,
        child: Stack(
          children: <Widget>[
            selectedItem == item
                ? Center(
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColorShadow,
                      ),
                    ),
                  )
                : Container(),
            Center(
              child: Icon(
                item.iconData,
                color: selectedItem == item ? kPrimaryColor : Colors.grey[400],
                size: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}

