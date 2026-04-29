
import 'package:riverpod_tut/module/item.dart';


class FavouriteStates{
  final List<Item> allItems;
  final List<Item> filteredItems;
  final String search;

  FavouriteStates({required this.allItems,required this.filteredItems,required this.search});

  FavouriteStates copyWith({
    List<Item> ? allItems,
    List<Item> ?filteredItems,
    String ?search,
  }){
    return FavouriteStates(
      allItems: allItems ?? this.allItems,
       filteredItems: filteredItems ?? this.filteredItems,
        search: search ?? this.search);
  }
  

}