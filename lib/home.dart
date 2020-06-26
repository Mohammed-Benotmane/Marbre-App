import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sofamarbre/const.dart';

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
      Response response = await get('https://marbreapplication.herokuapp.com/marbres');
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
      appBar: AppBar(
        title: Text("Marbre App"),
        centerTitle: true,
        backgroundColor: mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          itemCount: marbresList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15.0,
            childAspectRatio: 1 / 1.3,
          ),
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Image.network(
                            marbresList[index]['image'],
                            fit: BoxFit.fitHeight,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    marbresList[index]['title'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade800,
                                    ),
                                  ),
                                ),
                                Text(
                                  marbresList[index]['price'].toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            marbresList[index]['origin'].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
