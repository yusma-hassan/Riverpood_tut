import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counter = StateProvider<int>((ref){
  return 0;
});
final switchProvider = StateProvider<bool>((ref){
return false;
});
class HomeScreen extends ConsumerStatefulWidget{
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Widget build(BuildContext){
   
    
    return Scaffold(
    appBar: AppBar(title: Center(child: Text("Counter App"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Consumer(builder: (context, ref, child) {
              final count = ref.watch(counter);
              
              return  Text(count.toString(),style: TextStyle(fontSize: 25),);
            },),
            Consumer(builder: (context, ref, child) {
              final switcher = ref.watch(switchProvider);

              return Switch(value:switcher, onChanged: (value) {
               ref.read(switchProvider.notifier).state = value;
            },);


            },),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  ref.read(counter.notifier).state ++ ;
                }
                , child: Text("+")),
                ElevatedButton(onPressed: () {
                  ref.read(counter.notifier).state -- ;
                }
                , child: Text("-")),
              ],
            ),
             
              
            
           
          ],        )
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