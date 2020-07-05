import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sofamarbre/const.dart';
import 'package:sofamarbre/models/marbre.dart';

class MarbreDetail extends StatefulWidget {
  Marbre marbre;
  List marbreList;

  MarbreDetail(this.marbre, this.marbreList);

  @override
  _MarbreDetailState createState() => _MarbreDetailState();
}

class _MarbreDetailState extends State<MarbreDetail> {
  @override
  void initState() {
    super.initState();
  }

  customCard(String image, String title, int price) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Card(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Image.network(
              image,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 5,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(title, style: TextStyle(fontSize: 16)),
                Text(price.toString(), style: TextStyle(color: Colors.grey.shade800)),
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
      backgroundColor: Colors.grey.shade100,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    fit: BoxFit.fill,
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
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(35), topLeft: Radius.circular(35)),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Center(child: ClipRRect(borderRadius: BorderRadius.circular(5),child: Container(color: mainColor,width: 60,height: 5,))),
                          SizedBox(height: 20),
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
                          SizedBox(height: 30),
                          Center(
                            child: AutoSizeText(
                              widget.marbre.description,
                              style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
                              maxLines: 4,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "People also liked:",
                            style: TextStyle(
                              fontSize: 18,
                              color: mainColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: MediaQuery.of(context).size.height / 7,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.marbreList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return MarbreDetail(
                                          Marbre(
                                              title: widget.marbreList[index]['title'],
                                              image: widget.marbreList[index]['image'],
                                              price: widget.marbreList[index]['price'],
                                              origin: widget.marbreList[index]['origin'],
                                              description: widget.marbreList[index]['description']),
                                          widget.marbreList);
                                    }));
                                  },
                                  child: customCard(widget.marbreList[index]['image'],
                                      widget.marbreList[index]['title'], widget.marbreList[index]['price']),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "${widget.marbre.price} DA",
                                  style:
                                      TextStyle(fontSize: 26, color: mainColor, fontWeight: FontWeight.w500),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: RaisedButton.icon(
                                    icon: Icon(Icons.check, color: Colors.white),
                                    padding: EdgeInsets.fromLTRB(15, 10, 30, 10),
                                    onPressed: () {},
                                    color: mainColor,
                                    label: Text(
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
