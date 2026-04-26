import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lec = Provider<String>((ref){
  return "Dart";
});
class HomeScreen extends ConsumerStatefulWidget{
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Widget build(BuildContext){
    final online = ref.watch(lec);
    return Scaffold(
    appBar: AppBar(title: Text("Riverpod")),
      body: Center(
        child: Container(
          child: Text(online,style: TextStyle(fontSize: 30),),
      ),
      ),

    );
  }
}
// class HomeScreen extends ConsumerWidget{
//   Widget build(BuildContext,WidgetRef ref){
//     final online = ref.watch(lec);
//     return Scaffold(
//     appBar: AppBar(title: Text("Riverpod")),
//       body: Center(
//         child: Container(
//           child: Text(online,style: TextStyle(fontSize: 30),),
//       ),
//       ),
//     );
//   }
// }