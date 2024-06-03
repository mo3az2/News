class NewsModel{
  String? title ;
  String? author;
  String? time;
  String? image;
  String? urlOfNew;

 NewsModel.fromJson(Map<String,dynamic>json){
   title =json["title"];
   author=json["author"];
   time =json["publishedAt"];
   image =json["urlToImage"];
   urlOfNew=json["url"];
 }

}