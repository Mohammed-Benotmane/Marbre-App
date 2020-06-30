import 'package:flutter/material.dart';
import 'package:sofamarbre/const.dart';
import 'package:sofamarbre/models/marbre.dart';

class MarbreDetail extends StatefulWidget {
  Marbre marbre;

  MarbreDetail(this.marbre);

  @override
  _MarbreDetailState createState() => _MarbreDetailState();
}

class _MarbreDetailState extends State<MarbreDetail> {
  @override
  void initState() {
    super.initState();
  }

  customAppBar() {
    return Expanded(
      flex: 1,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Material(
                elevation: 7,
                borderRadius: BorderRadius.circular(25),
                shadowColor: mainColor,
                child: Container(
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 18, 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Marbre Detail",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: mainColor,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        actions: <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.filter_list))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          customAppBar(),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Material(
                    elevation: 10,
                    shadowColor: mainColor,
                    borderRadius: BorderRadius.circular(25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        widget.marbre.image,
                        height: 200,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.marbre.title,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Text(
                        "${widget.marbre.price} DA",
                        style: TextStyle(
                          fontSize: 22,
                          color: mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    widget.marbre.origin.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16,
                      color: mainColor,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Text(
                    "Description Description Description Description Description Description Description Description Description Description Description Description Description Description ",
                    style:TextStyle(color: Colors.grey.shade700),),
                ),
                SizedBox(height: 30),
                Center(
                  child: ClipRRect(
                    borderRadius:
                    BorderRadius.circular(25),
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                      onPressed: () {},
                      color: mainColor,
                      child: Text(
                        "Validate",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
