import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
        backgroundColor: Color(0xFF2727ff),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          itemCount: marbresList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15.0,
            childAspectRatio: 1 / 1.55,
          ),
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Image.network(
                        marbresList[index]['image'],
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text(
                          marbresList[index]['title'],
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF2727ff),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),

                        Text(
                          marbresList[index]['price'].toString(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
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
