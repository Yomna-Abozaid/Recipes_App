import 'package:flutter/material.dart';
import 'package:untitled32/recipes.dart';
import 'package:untitled32/recipes_model.dart';
import 'package:untitled32/services/api_servise.dart';

class  FavList extends StatefulWidget {
  const   FavList({super.key});

  @override
  State< FavList> createState() => _FavList();
}

class _FavList extends State< FavList> {
  ApiService apiService= ApiService();
  Future<List<RecipeModel>>getAllRecipes() async{
    List<RecipeModel>recipes = [];
    final result= await apiService.getAllRecipes();
    for(var item in result['results']){
      recipes.add(RecipeModel.fromJson(item));
    }
    return recipes;
  }
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
    FutureBuilder<List<RecipeModel>>(
        future: getAllRecipes(),
        builder: (context,snapshot){
          if (snapshot.hasData){
            if(snapshot.data!.isNotEmpty){

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 1,

                      ),

                      itemBuilder:( context, index) {
                    RecipeModel recipeModel=snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child:Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(borderRadius: BorderRadius.circular(15),child: Image.network
                                (recipeModel.image),
                              ),Positioned(right: 10,top: 10,child: Container(
                                width: 30,height: 30,decoration: BoxDecoration(
                                shape: BoxShape.circle,color: Colors.white.withOpacity(0.50),
                              ),child: IconButton(padding: EdgeInsets.zero,icon: const Icon(Icons.favorite,color: Colors.redAccent,),
                              onPressed: (){},),
                              ),)
                            ],
                          )
                          ,const SizedBox(
                            height: 14 ,
                          )
                          ,Expanded(child: Text(recipeModel.title,overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                        ),

                          )
                        ],
                      ),

                        );

                  }
                  ,itemCount: snapshot.data!.length,
                ),

              );


            }
            else{
              return const Center(
                child: Text('recipes is empty',style: TextStyle(color: Colors.black),),
              );
            }
          }else if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString(),style: TextStyle(color: Colors.black)),
            );
          }
          else{
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
        }
    )
     );
  }}
