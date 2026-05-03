import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/provider/async_notifier_provider.dart';





class HomeScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Widget build(BuildContext context) {
    
  final greetingAsync = ref.watch(greetingAsyncProvider);
  final greetingAsyncNotifier = ref.watch(greetingAsyncProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Counter App")),
     
      ),
      body:Center(
        child: greetingAsync.when(
          skipLoadingOnRefresh: false,
          data: (g) =>Text(g,style: TextStyle(fontSize: 24),) , 
          error: (e, _) => Text("Error: $e"),
           loading: () => CircularProgressIndicator(),),
      ),
         
      floatingActionButton:  FloatingActionButton(
                    onPressed:greetingAsyncNotifier.refreshGreeting,
                    child: Icon(Icons.refresh),),
      
           );
  }
}
