import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_tut/slider_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Widget build(BuildContext) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Counter App"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
              builder: (context, ref, child) {
                print("eye");
                final slider = ref.watch(
                    sliderProvider.select((state) => state.showPassword));
                
                return InkWell(
                  child: Container(
                    height: 200,
                    width: 200,
                    child:
                        slider ? Icon(Icons.image) : Icon(Icons.remove_red_eye),
                  ),
                  onTap: () {
                    final stateProvider = ref.read(sliderProvider.notifier);
                    stateProvider.state =
                        stateProvider.state.copyWith(showPassword: !slider);
                  },
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                print("slider");
                final slider =
                    ref.watch(sliderProvider.select((state) => state.slider));

                
                return Container(
                  height: 200,
                  width: 200,
                  color: Colors.pink.shade100.withOpacity(slider),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final slider = ref.watch(sliderProvider);
               
                return Slider(
                  value: slider.slider,
                  onChanged: (value) {
                    final stateProvider = ref.read(sliderProvider.notifier);
                    stateProvider.state =
                        stateProvider.state.copyWith(slider: value);
                  },
                );
              },
            ),
          ],
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