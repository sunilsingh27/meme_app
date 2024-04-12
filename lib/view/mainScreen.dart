import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meme_viewer/controller/fetchMeme.dart';
import 'package:meme_viewer/controller/saveMyData.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});



  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  String imgurl = "https://i.imgflip.com/28s2gu.jpg";
  int? memeNo ;
  bool isloading = true;
  int targetMeme = 100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetInitMemeNo();
    UpdateImg();
  }
  Future<void> GetInitMemeNo()async {
    memeNo= await SaveMyData.fetchData() ?? 0;
    if(memeNo!>1000){
      memeNo =0;
    }
      else if(memeNo!> 500){
      targetMeme = 1000;
    }
      else if(memeNo !>100){
        targetMeme =500;
    }


    setState(() {

    });
  }

  void UpdateImg() async{
    String getImgUrl = await FetchMeme.fetchNewMeme();
    setState(() {
      imgurl=getImgUrl;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Meme #${memeNo.toString()}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: 15,
            ),
            Text("Target ${targetMeme} Meme",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 20,
            ),



            Container(
                width: MediaQuery.of(context).size.width,
                height: 400,


                child: Image.network(imgurl)

            ),


            SizedBox(

              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  await SaveMyData.saveData(memeNo!+1);
                  GetInitMemeNo();

                  UpdateImg();
                },
                child: Container(
                    height: 60,
                    width: 90,
                    child: Center(
                        child: Text(
                          'Next',
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                        )))),
            // Spacer(),
            // Text("APP CREATED BY",
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // Text("SUNIL SINGH",
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // SizedBox(
            //   height: 10,
            // ),
          ],
        ),
      ),
    );
  }
}
