import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurahLikeController extends GetxController{
  RxList favoriteSuranName=[].obs;

  addToFavourite(String value)
  {
    favoriteSuranName.add(value);
  }

  removeToFavourite(String value){
    favoriteSuranName.remove(value);
  }
}