import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutterapp/network/http_request.dart';
/*网络请求
* 建议开发中，使用第三方库时都进行一层封装(便于后期维护)*/
main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "网络请求",
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("网络请求"),),
        ),
        body:NetPage(),
      ),
    );
  }
}
class NetPage extends StatefulWidget {
  const NetPage({Key? key}) : super(key: key);

  @override
  State<NetPage> createState() => _NetPageState();
}

class _NetPageState extends State<NetPage> {

  void initState()
  {
    super.initState();
    //发送网络请求
    /*1、创建dio对象*/
    //final dio=Dio();
    /*2、发送网络请求*/
    //dio.get("https://api.covid19api.com/summary").then((value) => print(value));//发送get请求,get是future类型
    //dio.post("https://httpbin.org/post").then((value) => print(value));//发送post请求,post是future类型
    /*3、用封装的方法发送网络请求*/
    print("\n用封装方法发送网络请求\n");
    HttpRequest.request("https://movie.douban.com/j/search_subjects?type=movie&tag=%E7%83%AD%E9%97%A8&sort=recommend&page_limit=10&page_start=0",inter:InterceptorsWrapper(),params: {"name":"why"}).then((value){
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListView.builder(
          itemBuilder: (BuildContext ctx,int index){
            return ListTile(
              title: Text("最新电影信息:"),
            );
          },
          itemCount: 100,
      ),
    );
  }
}


/*Json转modle*/
/*电影信息*/

/*
class MovieItem{
  String ? episodes_info;
  double ? rate;
  String ?title;
  bool ?is_new;
  String ?image;
  String ?url;
  MovieItem(this.episodes_info,this.rate,this.title,this.is_new,this.image,this.url);

  MovieItem.fromJson(Map<String,dynamic> jsonStr)
  {
    episodes_info=jsonStr['episodes_info'];
    rate=jsonStr['rate'];
    title=jsonStr['title'];
    image=jsonStr['cover'];
  print("${title}");
  }

}
*/


