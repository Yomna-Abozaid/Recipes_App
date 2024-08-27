import 'package:flutter/material.dart';
import 'package:untitled32/recipes.dart';

class  FavList extends StatefulWidget {
  const   FavList({super.key});

  @override
  State< FavList> createState() => _FavList();
}

class _FavList extends State< FavList> {
  static var length;
  @override
  Widget build(BuildContext context) {


    return Scaffold(

        appBar: AppBar(backgroundColor: Colors.white,
          leading: Icon(Icons.format_list_bulleted,color: Colors.green.shade400,size: 30,)
          ,title:Text('Favourite List',style: TextStyle(
            fontSize: 28,fontWeight: FontWeight.bold,color: Colors.green.shade400,

          ),
          ),actions: [
            Icon(Icons.search,color: Colors.green.shade400,size: 30,)
          ] ,

        ),
        bottomNavigationBar: BottomNavigationBar(currentIndex: 1,


          items: [
            BottomNavigationBarItem(label: '',icon: IconButton(onPressed: (){
              Navigator.push
                (context
                  , MaterialPageRoute(builder: (context) => RecipesList()));

            }, icon: Icon(
                Icons.home_outlined,size:30),))

            ,BottomNavigationBarItem(label: '',icon: IconButton(onPressed: (){


            }, icon:Icon(Icons.favorite_border,size: 30,color: Colors.green,),))
          ],
        )
        ,body:
   Container(
     padding: EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 1,
          ),
          itemCount: _FavList.length
          ,itemBuilder: ( context, index) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)

            ),
          );
        },
        )
    ),
     );
  }}