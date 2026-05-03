import 'dart:async';


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/provider/fakeApiProvider.dart';

final greetingAsyncProvider = AsyncNotifierProvider<GreetingAsyncNotifier,String>(
  ()=>GreetingAsyncNotifier());

class GreetingAsyncNotifier extends AsyncNotifier<String>{
  @override
  FutureOr<String> build() async {
    
    return await ref.read(fakeApiProvider).fetchGreetings();
  }
  Future<void> refreshGreeting() async {
state = AsyncLoading();
    state = await AsyncValue.guard(()=> ref.read(fakeApiProvider).fetchGreetings());


    
  }
  

}