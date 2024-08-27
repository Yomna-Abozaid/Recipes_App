class RecipeModel {
  final String title, image, summary;
  final int id, time, healthScore;
  final List<String> ingredients;

  RecipeModel(
      {required this.title, required this.image, required this.summary, required this.id, required this.time, required this.healthScore, required this.ingredients});

  factory RecipeModel.fromJson(Map<String, dynamic>json){
    return RecipeModel(
      title: json['title'],
      image: json['image'],
      summary: json['summary'],
      id: json['id'],
      time: json['time'],
      healthScore: json['healthScore'],
      ingredients: List<String>.from(json['ingredients']),
    );
  }


}