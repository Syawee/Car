
import 'package:flutter/material.dart';
import 'package:car/data.dart';
import 'package:car/constants.dart';

class BookCar extends StatefulWidget {
  final Car car;

  BookCar({required this.car});

  @override
  _BookCarState createState() => _BookCarState();
}

class _BookCarState extends State<BookCar> {
  int _currentImage = 0;

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < widget.car.images.length; i++) {
      list.add(buildIndicator(i == _currentImage));
    }
    return list;
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 10 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 350,
                                height: 350,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  border: Border.all(
                                    color: Color(0xFFCCCCCC),
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.bookmark_border,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          widget.car.model,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.car.brand,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: PageView(
                          physics: BouncingScrollPhysics(),
                          onPageChanged: (int page) {
                            setState(() {
                              _currentImage = page;
                            });
                          },
                          children: widget.car.images.map((path) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Hero(
                                tag: widget.car.model,
                                child: Image.asset(
                                  path,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      widget.car.images.length > 1
                          ? Container(
                              margin: EdgeInsets.symmetric(vertical: 16),
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: buildPageIndicator(),
                              ),
                            )
                          : Container(),
                           BookNowButton(car: widget.car),
                    ],
                  ),
                ),
              ),
               
            ],
          ),
        ),
      ),
    );
  }
}

// 'Book Now' button
class BookNowButton extends StatelessWidget {
  final Car car;

  BookNowButton({required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookCar(car: car),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Book Now",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}