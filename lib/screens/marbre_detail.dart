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
    print(widget.marbre.price);
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
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[

            Material(
              elevation: 10,
              shadowColor: mainColor,
              borderRadius: BorderRadius.circular(25),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(widget.marbre.image,
                width: MediaQuery.of(context).size.width/1.5,
                height: MediaQuery.of(context).size.height/1.5,fit: BoxFit.fitHeight,
                ),
              ),
            ),

          ],
        ),
      ),
      );
  }
}
