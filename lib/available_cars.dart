import 'package:flutter/material.dart';
import 'package:car/constants.dart';
import 'package:car/data.dart';
import 'package:car/car_widget.dart';
import 'package:car/book_car.dart';


class AvailableCars extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _AvailableCarsState createState() => _AvailableCarsState();
}

class _AvailableCarsState extends State<AvailableCars> {

  List<Filter> filters = getFilterList();
  Filter? selectedFilter;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedFilter = filters[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

             


              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 1 / 1.70,//ความยาวของกล่อง
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10,
                  children: getCarList().map((item) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookCar(car: item)),
                        );
                      },
                      child: buildCar(item, null),
                    
                    );
                  }).toList(),
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 10,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            buildFilterIcon(),
            Row(
              children: buildFilters(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilterIcon(){
    return Container(
      width: 15,
      height: 15,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(25),//ความยาวของกล่อง
        ),
      ),
      child: Center(
        child: Icon(
          Icons.filter_list,
          color: Colors.white,
          size: 12,
        ),
      ),
    );
  }

  List<Widget> buildFilters(){
    List<Widget> list = [];
    for (var i = 0; i < filters.length; i++) {
      list.add(buildFilter(filters[i]));
    }
    return list;
  }

  Widget buildFilter(Filter filter){
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(right: 12),
        child: Text(
          filter.name,
          style: TextStyle(
            color: selectedFilter == filter ? kPrimaryColor : Color(0xFFCCCCCC),
            fontSize: 15,
            fontWeight: selectedFilter == filter ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}