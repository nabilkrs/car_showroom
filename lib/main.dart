import 'package:flutter/material.dart';

void main() => runApp(MyApp());
final List<String> cars = ["Hyundai i20","Chevrolet Silverado","Mercedes C200","KIA Cerato","Ford Expedition","Mazda BT50","Peugeot B9","Renault Talisman","Range Rover","BMW M5 E60","Skoda Fabia"];
final List<String> images = ["https://www.lloydmotorgroup.com/ImageLibrary/Vehicle/275504-EQNZELsf1kiZCIXBr4Ekg.jpg",
"https://a0.typepad.com/6a017ee6664cf9970d0240a4b680b0200b-800wi",
"https://www.challenges.fr/assets/img/2019/06/26/cover-r4x3w1000-5d1256e51f99a-mercedes-classe-c-2019-la-star-de-l-etoile-592086.jpg","https://www.exhaustnotes.com.au/wp-content/uploads/2018/09/cerato1.jpg","https://www.kbb.com/wp-content/uploads/make/ford/expedition/2018/kbb/03-2018-Ford-Expedition-Platinum-Exterior-KBB.jpg?w=768","https://i.pinimg.com/originals/16/82/7a/16827a3af1d804cb828b897d3f9a4b90.jpg","https://voiture-neuve.tunisienumerique.com/wp-content/uploads/2017/06/PARTNER-LAST-600x318.jpg","https://images.caradisiac.com/logos-ref/modele/modele--renault-talisman/S7-modele--renault-talisman.jpg","https://media.caradvice.com.au/image/private/c_fill,q_auto,f_auto,w_960,h_500/hq5t7zwipvirs3qpmmqs.jpg","https://ag-spots-2018.o.auroraobjects.eu/2018/08/04/bmw-m5-e60-2005-c388104082018235958_1.jpg","https://www.auto-plus.tn/assets/modules/newcars/skoda/fabia/couverture/skoda-fabia.jpg"];
final List<String> release = ["Release Year : 2012","Release Year : 2016","Release Year : 2009","Release Year : 2011","Release Year : 2019","Release Year : 2006","Release Year : 2003","Release Year : 2017","Release Year : 2001","Release Year : 1990","Release Year : 2002"];
final List<String> hp = ["99","285","184","143","300","190","100","150","380","210","90"];
final List<String> price = ["12,100","28,300","41,400","13,000","24,980","12,660","24,980","90,900","103,695","21.600","90.240"];

class MyApp extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
   

return MaterialApp(
  
  debugShowCheckedModeBanner: false,
  home: Scaffold(
     key: _scaffoldKey,
     
    appBar: AppBar(
      title: Center(child: Text("Car Showroom")),
    ),
    body: ListView.builder(
      
      itemCount: cars.length,
      itemBuilder: (context,position){
        return InkWell(
          onTap: (){
             _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("You Tapped "+cars[position]))); 
          },
          child:Container(
          height: 200,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            
            gradient: LinearGradient(
              colors: [
                Colors.red[400],
                Colors.red[600],
                Colors.red[700],
                Colors.red[800],
                Colors.red[900],
                Color.fromARGB(255, 225, 0, 0),
              ],
              
              ),
              
            
            borderRadius: BorderRadius.circular(20),
            
          
            boxShadow: [
              BoxShadow(color: Colors.red,blurRadius: 20),
              
            ]

          ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
           Row(
             children: [
             CircleAvatar(
                radius: 50,
               // backgroundImage: NetworkImage(images[position]),
               // backgroundColor: Colors.transparent,
                child:ClipOval(child: 
                Stack(
                  children: [
                    Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),)),
                   Image.network(images[position],fit: BoxFit.cover,width: 100,height: 100,)
                  ],
                )
                ,)
                
            ),
           SizedBox(width: 15,),
            Text(cars[position],style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white))
           ],
         ),
         SizedBox(height: 20,),
         Text(release[position],style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
         Text("HP : "+hp[position],style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
         RichText(
           text:TextSpan(children: [   
         TextSpan(text:"Price : ",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
         TextSpan(text:price[position]+"\$",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green[600])),
           ])
         ,)

         ],),
        ),
        );
      },
    
    )
      ),
    );
  }
}