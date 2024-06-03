import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:ap_project/news/data/cubit/news_state.dart';
import 'package:ap_project/news/data/models/news_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(NewsIntial());
  static NewsCubit get(context){
    return BlocProvider.of(context);
  }

  List <NewsModel> newsList = [];
  void getNews() async {

    try{
      emit(NewsLoading());

      String apiKey ="973962674a7a4f779fc4fe04fd854ed7";
    var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey");
    var response = await http.get(url);
    if (response.statusCode==200){
      //print("=============================================${response.body}");
      var convertedResponse = jsonDecode(response.body);
      // print("==============================================${convertedResponse}");
      List listFromApi =convertedResponse["articles"];
      for (var element in listFromApi) {
        newsList.add(NewsModel.fromJson(element));
      }
      emit(NewsSuccess());
    }else {
      debugPrint("status : ${response.statusCode}");
    }
    }catch(e){

      debugPrint("$e");
      emit(NewsError());
    }


  }

  static Future<void> urlLaunch(String newsUrl)async{
    final Uri url =Uri.parse(newsUrl);
    if(!await launchUrl(url)){
      throw Exception("Could not launch");
    }
  }

}