import 'package:flutter/material.dart';
import 'package:untitled32/fav.dart';
import 'package:untitled32/recipes_model.dart';
import 'package:untitled32/services/api_servise.dart';

class  RecipesList extends StatefulWidget {
  const  RecipesList({super.key});

  @override
  State<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  ApiService apiService= ApiService();
 Future<List<RecipeModel>>getAllRecipes() async{
    List<RecipeModel>recipes = [];
    final result= await apiService.getAllRecipes();
    for(var item in result['recipes']){
      recipes.add(RecipeModel.fromJson(item));
  }
 return recipes;
 }
 @override
 void initState(){
   super.initState();
   getAllRecipes();
 }
  static var length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(


    appBar: AppBar(backgroundColor: Colors.white,
        leading: Icon(Icons.format_list_bulleted,color: Colors.green.shade400,size: 30,)
        ,title:Text('Recipe List',style: TextStyle(
            fontSize: 28,fontWeight: FontWeight.bold,color: Colors.green.shade400,

        ),
      ),actions: [
      Icon(Icons.search,color: Colors.green.shade400,size: 30,)
    ] ,

    ),
    bottomNavigationBar: BottomNavigationBar(currentIndex: 0,


      items: [
    BottomNavigationBarItem(label: '',icon: Icon(Icons.home_outlined,size: 30,color: Colors.green,)),
    BottomNavigationBarItem(label: '',icon: IconButton(onPressed: (){
Navigator.push
  (context
    , MaterialPageRoute(builder: (context) => FavList()));
      
    }, icon:Icon(Icons.favorite_border,size: 30,),))
    ],
    )
       ,body: FutureBuilder<List<RecipeModel>>(
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
        child: Image.network('https://api.spoonacular.com/recipes/complexSearch'),

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

  }
}
