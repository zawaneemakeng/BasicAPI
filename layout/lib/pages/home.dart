import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layuot/pages/detail.dart';

import 'package:http/http.dart' as http; //as http. ตั้งชื่อเล่น
import 'dart:async';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("หนังสือที่น่าสนใจ"),
          backgroundColor: Colors.black54,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder(
            builder: (context,AsyncSnapshot snapshot) {//AsyncSnapshot มันไม่รู้เป็นไฟฟลอะไร เลยต้องใส่ AsyncSnapshot
              //var data = json.decode(snapshot.data.toString());// class json ต้อง import[{},{},{}] เป็นก้อนๆ
              
              return ListView.builder(
                itemBuilder: (BuildContext context,int index){
                  return Column(
                    children: [
                      Mybox(snapshot.data[index]['title'],snapshot.data[index]['subtitle'],snapshot.data[index]['image_url'],snapshot.data[index]['detail']),
                      const SizedBox(height:12)
                    ],
                  );
                },
                itemCount: snapshot.data.length,
                );
            },
            //future: DefaultAssetBundle.of(context).loadString('assets/data.json'),เอาจากเครื่องเรา
            future: getData()
          )
        ));
  }

  Widget Mybox(String title, String subtitle, String image_url,String detail) {
    //have paramiter
    var v1 = title;
    var v2 = subtitle;
    var v3 = image_url;
    var v4 = detail;
    return Container(
      margin:  const EdgeInsets.only(top:15),
      padding: const EdgeInsets.all(10),
      // color: Colors.blue[100], 
      height: 170,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(image_url),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.50), BlendMode.darken)),
        borderRadius: BorderRadius.circular(15),
      ),

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start, //start center end
            crossAxisAlignment: CrossAxisAlignment
                .start, //เเนวนอนที่เราต่องการจะอยู่เเนวไหน start center end
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(subtitle, style: const TextStyle(fontSize: 13, color: Colors.white)),
              const SizedBox(height: 7),
              TextButton(
                onPressed: () {
                  print("next page");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  DetailPage(v1,v2,v3,v4),
                      )); //ใส่context เพื่อให้มีปุ่มback
                },
                child: const Text("อ่านต่อ..."),
              )
            ]),
      ),
    );
  }
  
  Future getData() async{
    //https://raw.githubusercontent.com/zawaneemakeng/BasicAPI/main/data.json
    var url = Uri.https('raw.githubusercontent.com','zawaneemakeng/BasicAPI/main/data.json');
    var  response = await http.get(url);
    var result = json.decode(response.body);
    return result;

  }
}
