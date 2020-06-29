import 'package:flutter/material.dart';
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
        title: Text("test"),
      ),
    );
  }
}
