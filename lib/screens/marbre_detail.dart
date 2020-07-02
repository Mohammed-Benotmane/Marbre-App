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

  customCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Card(
        color: Colors.grey.shade100,
        child: Row(
          children: <Widget>[
            Image.network(
              widget.marbre.image,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 5,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(widget.marbre.title, style: TextStyle(fontSize: 16)),

                Text(widget.marbre.price.toString(), style: TextStyle(color: Colors.grey.shade800)),
              ],
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Material(
              elevation: 7,
              shadowColor: Colors.grey.shade100,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(35), bottomLeft: Radius.circular(35)),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(35), bottomLeft: Radius.circular(35)),
                child: Container(
                  child: Image.network(
                    widget.marbre.image,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            widget.marbre.title,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade800,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "  " + widget.marbre.origin.toUpperCase(),
                            style: TextStyle(
                              fontSize: 16,
                              color: mainColor,
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: Text(
                              widget.marbre.description,
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            height: MediaQuery.of(context).size.height / 8,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 6,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return customCard();
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "${widget.marbre.price} DA",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: mainColor,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: RaisedButton(
                                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                    onPressed: () {},
                                    color: mainColor,
                                    child: Text(
                                      "Validate",
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
