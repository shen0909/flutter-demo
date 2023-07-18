import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "数据持久化",
      home: HYHomePage(),
    );
  }
}
class HYHomePage extends StatelessWidget {
  final namecontroller=TextEditingController();
  final agecontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("数据持久化"),
      ),
      body: Center(
        child: Container(
          width: 320,
          child: Column(
            children: [
              TextField(
                controller:namecontroller ,
                decoration: InputDecoration(
                  hintText: "请输入名字"
                ),
              ),
              TextField(
                controller:agecontroller ,
                decoration: InputDecoration(
                    hintText: "请输入年龄"
                ),
              ),
              SizedBox(height: 40,),
              ElevatedButton(
                  onPressed: ()=>tapbutton(),
                  child: Text(
                    "提交",
                  ))
            ],
          ),
        ),
      ),
    );
  }

  tapbutton(){
    print("提交信息");
  }
}