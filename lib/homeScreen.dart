import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/itmeProvider.dart';



class HomeScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Widget build(BuildContext context) {
    
    final item = ref.watch(itemProvider);
    print("build");
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Counter App"))),
      body:
         item.isEmpty ? Center(child: Text("No data found")) : 
          ListView.builder(
             itemCount : item.length ,
            itemBuilder: (context, index) {
             
              final itemDetail =  item[index];
              return ListTile(
                title: Text(itemDetail.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     IconButton(onPressed: () {
                      ref.read(itemProvider.notifier).updateItem(itemDetail.id,"new Name");
                    }, icon: Icon(Icons.edit),),
                    IconButton(onPressed: () {
                      ref.read(itemProvider.notifier).deleteItem(itemDetail.id);
                    }, icon: Icon(Icons.delete),),
                    
                  ],
                ),
              );
            },),
          
      floatingActionButton:  FloatingActionButton(
                    onPressed: () {
            ref.read(itemProvider.notifier).addItem("Syeda ");
                    },
                    child: Icon(Icons.add),),
      
           );
  }
}
