import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/homeScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ProviderScope(
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a purple toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: HomeScreen(),
        ),
    );
    
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
      body: Center(
        
      
        ),
      );
    
  }
}
/*

# 🌱 Big Picture

In Flutter framework apps, we need a way to:

👉 share data
👉 update UI when data changes

That’s what **state management** solves.

---

# ⚙️ What is Riverpod?

Riverpod is a state management system where:

👉 everything revolves around **providers**

---

# 📦 What is a Provider (in Riverpod)?

👉 A **provider is a container of value**

Example:

```dart
final messageProvider = Provider<String>((ref) {
  return "Hello Riverpod";
});
```

This means:

👉 “When someone asks, give this value”

---

## Important clarity

* ❌ Provider is not always state management
* ✅ It can just provide static data

---

# 🧠 Why Provider takes a function?

```dart
Provider((ref) {
  return value;
});
```

👉 You pass a **function** so Riverpod can:

* run it only when needed (lazy)
* rebuild it when dependencies change

---

# 🔌 What is `ref`?

👉 **`ref` is the tool Riverpod gives to interact with providers**

It allows you to:

* access other providers
* react to changes
* manage dependencies

---

## Example

```dart
final name = ref.watch(nameProvider);
```

👉 “Get value and stay updated”

---

# 👀 What is `ref.watch()`?

👉 It does two things:

1. gets value
2. **listens for changes**

---

## Why “listens”?

Because:

👉 if provider changes → widget rebuilds automatically

---

# 📱 ConsumerWidget vs normal widget

### Normal widget

```dart
StatelessWidget
```

* no access to providers

---

### ConsumerWidget

```dart
ConsumerWidget
```

* gets `WidgetRef ref`
* can use providers
* rebuilds automatically

---

# 🔑 Why `WidgetRef ref` is needed?

```dart
Widget build(BuildContext context, WidgetRef ref)
```

* `context` → Flutter system
* `ref` → Riverpod system

👉 Without `ref`, no provider access

---

# 🏗️ What is ProviderScope?

```dart
ProviderScope(child: MyApp())
```

👉 Root container of all providers

It:

* stores values
* manages updates
* tracks dependencies

👉 Without it, Riverpod does not work

---

# 🔄 How everything works together

Flow:

1. App starts inside `ProviderScope`
2. Widget uses `ref.watch(provider)`
3. Riverpod runs provider function
4. returns value
5. UI displays it
6. if value changes → UI rebuilds

---

# 🔥 Types of providers (important)

* `Provider` → static value
* `StateProvider` → simple state
* `StateNotifierProvider` → complex logic
* `FutureProvider` → async
* `StreamProvider` → real-time

👉 State management mainly comes from these, not basic Provider

---

# ⚠️ Provider (old package) vs Riverpod

### Old Provider package

```dart
context.watch()
```

* depends on `BuildContext`
* tied to widget tree

---

### Riverpod

```dart
ref.watch()
```

* independent of context
* cleaner and safer

---

# 🧩 Final mental model

* **Provider** → defines how to get data
* **ref** → tool to access data
* **ref.watch()** → get + listen
* **ConsumerWidget** → use providers in UI
* **ProviderScope** → system that manages everything

---

# 🧠 One-line summary

👉 **Riverpod uses providers (functions) to supply data, `ref` to access them, and `ref.watch()` to automatically rebuild UI when data changes**


 */