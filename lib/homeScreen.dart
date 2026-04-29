import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_tut/provider/favourite_Provider.dart';



class HomeScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Widget build(BuildContext context) {
    
    final favList = ref.watch(favProvider);
    print("build");
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Counter App")),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            ref.read(favProvider.notifier).favourite(value);
          },
          itemBuilder: (context) {
           return [
            PopupMenuItem(
              value: "All",
              child: Text("All")),
              PopupMenuItem(
              value: "Favourite",
              child: Text("Favourite"))
           ];
        },)
      ],),
      body:Column(
        children: [
          TextField(
            
            decoration: InputDecoration(
              hintText: "Search",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              ),
            ),
            onChanged: (value) {
               ref.read(favProvider.notifier).filter(value);
            },
          ),
          Expanded(child: 
          ListView.builder(
            itemCount: favList.filteredItems.length,
            itemBuilder: (context, index) {
            final item = favList.filteredItems[index];
            return ListTile(
              title: Text(item.name),
              trailing: Icon(item.favourite ? Icons.favorite : Icons.favorite_border),
            );
          },))
        ],
      ),
         
      floatingActionButton:  FloatingActionButton(
                    onPressed: () {
            ref.read(favProvider.notifier).addItem();
                    },
                    child: Icon(Icons.add),),
      
           );
  }
}
