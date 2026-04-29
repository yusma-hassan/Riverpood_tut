import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/module/item.dart';
import 'package:riverpod_tut/provider/favourite_States.dart';


final favProvider = StateNotifierProvider<favNotifier,FavouriteStates>((ref){
  return favNotifier();
});
class favNotifier extends StateNotifier<FavouriteStates>{
  favNotifier():super(FavouriteStates(allItems: [], filteredItems: [], search: " "));

void addItem(){
    List<Item> item = [
      Item(name: "MacBook", id: 1, favourite: true),
      Item(name: "i-phone", id: 2, favourite: false),
      Item(name: "G-force 3060", id: 3, favourite: false),
      Item(name: "Samsung Ultra", id: 4, favourite: true),
      Item(name: "Google Pixel 9", id: 5, favourite: false),
      Item(name: "ipad pro 13", id: 6, favourite: true),
    ];

    state = state.copyWith(allItems:item.toList(),filteredItems:item.toList());
  }
  void filter(String search){
 state = state.copyWith(filteredItems: filterItems(state.allItems, search));
  }
  List<Item> filterItems(List<Item> items,String search){

    if(search.isEmpty){
      return items;
    }
    else {
      return  items
      .where((items)=>
      items.name.toLowerCase().contains(search.toLowerCase()))
      .toList();
    }
  }
  void favourite(String option){
 state = state.copyWith(filteredItems: favItems(state.allItems, option));
  }
  List<Item> favItems(List<Item> items,String option){

    if(option == "All"){
      return items;
    }
    else {
      return  items
      .where((items)=>
      items.favourite == true)
      .toList();
    }
  }
}