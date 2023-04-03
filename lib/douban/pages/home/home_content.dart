import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/network/home_request.dart';

import '../../model/home_model.dart';
/*首页内容页*/
class HYHomeContent extends StatefulWidget {
  const HYHomeContent({Key? key}) : super(key: key);

  @override
  State<HYHomeContent> createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {

  final List<MovieItem>movies=[];

  /*发送网络请求，请求数据*/
  void initState(){
    super.initState();
    /*请求到的数据被返回放在了then的value中*/
    HomeRequest.requestMovieList().then((value){
      //print("返回数据后打印：$value");
      /*存在数据更新，所以要使用setState*/
      setState((){
        movies.addAll(value);//遍历value并且将他放到数组movies当中去
      });
    });
   
  }
  /*渲染widget 怎样显示获取的内容*/
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemBuilder: (BuildContext ctx ,int index){
            return Container(
              height: 80,
              child: ListTile(
                leading:Image(image: NetworkImage("${movies[index].cover}"),) ,
                title:Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${movies[index].rate}",style: TextStyle(color:Colors.orange ),),
                    Text("${movies[index].title}") ,
                  ],
                )
              ),
            ) ;
          },
          itemCount:movies.length ,//item个数=数组长度
      ),
    );
  }
}


