import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  //const DetailPage({ Key? key }) : super(key: key);

  final v1 ,v2 ,v3 ,v4  ;
  DetailPage(this.v1,this.v2,this.v3,this.v4,);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  var _v1, _v2, _v3, _v4 ,_v5;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _v1 = widget.v1;//ใส่ดาต้า
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail"),backgroundColor:Colors.black54),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [Text(_v1,textAlign: TextAlign.center,),Text(_v2),Image.network(_v3),Text(_v4),],
        ),
      ),
      
    );
  }
}