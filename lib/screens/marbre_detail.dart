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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        centerTitle: true,
        backgroundColor: mainColor,
        title: Text("Marbre Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FlatButton.icon(
                      label: Text(""),
                      onPressed: () {},
                      icon: Icon(Icons.add,color: mainColor,size: 50,),
                    ),
                    SizedBox(height: 20),
                    Text("${widget.marbre.price}"),
                    SizedBox(height: 20),
                    FlatButton.icon(
                      label: Text(""),
                      onPressed: () {},
                      icon: Icon(Icons.minimize,color: mainColor,size: 50,),
                    ),
                  ],
                ),
                Material(
                  elevation: 10,
                  shadowColor: mainColor,
                  borderRadius: BorderRadius.circular(25),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      widget.marbre.image,
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.height / 1.5,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 15),
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
            Text(
              widget.marbre.origin.toUpperCase(),
              style: TextStyle(
                fontSize: 16,
                color: mainColor,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
                  onPressed: () {},
                  color: mainColor,
                  child: Text("Validate",style: TextStyle(color: Colors.white,fontSize: 25),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
