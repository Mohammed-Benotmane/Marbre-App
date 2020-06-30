import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sofamarbre/const.dart';
import 'package:sofamarbre/custom_appbar.dart';
import 'package:sofamarbre/models/marbre.dart';
import 'package:sofamarbre/screens/marbre_detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title;
  String origin;
  int price;
  String imageUrl;
  List marbresList = [];

  Future<void> getMarbre() async {
    try {
      Response response = await get('https://marbreproject.herokuapp.com/marbres');
      Map marbres = jsonDecode(response.body);
      marbresList = marbres['marbres'];
    } catch (e) {
      print(e.toString());
    }
  }

  void getTemp() async {
    await getMarbre();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTemp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.all(0),
              child: Container(color: mainColor),
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.filter_list))],
      ),
      body: Column(
        children: <Widget>[
          CustomAppBar(),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
              child: GridView.builder(
                  itemCount: marbresList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return MarbreDetail(Marbre(
                              title: marbresList[index]['title'],
                              image: marbresList[index]['image'],
                              price: marbresList[index]['price'],
                              origin: marbresList[index]['origin'],
                              description: marbresList[index]['description']
                          )
                          );
                        }));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        elevation: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 5,
                                child: Image.network(
                                  marbresList[index]['image'],
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width / 2,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        marbresList[index]['title'],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade800,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              marbresList[index]['origin'].toString().toUpperCase(),
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: mainColor,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${marbresList[index]['price']} DA",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: mainColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
