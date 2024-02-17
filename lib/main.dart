import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram/add_page.dart';
import 'package:instagram/user.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'firebase_crud'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];

  

  @override
  void initState() {
    super.initState();

    _fetchfirebase();
  }

  void _fetchfirebase() async{
    final db = FirebaseFirestore.instance;
    final event = await db.collection("users").get();
    final docs = event.docs;
    final _users = docs.map((doc) => User.FromFirestore(doc)).toList();
    
    setState(() {
      this.users = _users;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      body:  ListView(
        children: 
          users.map((user) => ListTile(
            title: Text(user.first),
            subtitle: Text(user.last),
            trailing: Text(user.born.toString()),
            onTap: (){
              showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Select Year"),
                  content: Container(
                    width: 300,
                    height: 300,
                    child: YearPicker(
                      firstDate: DateTime(DateTime.now().year - 100, 1),
                      lastDate: DateTime(DateTime.now().year + 100, 1),
                      initialDate: DateTime.now(),
                      selectedDate: DateTime(user.born),
                      onChanged: (DateTime dateTime) {
                        
                        FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.id)
                          .update({'born' : dateTime.year});
                    
                        // close the dialog when year is selected.
                        Navigator.pop(context);

                        _fetchfirebase();
                      },
                              ),
                  ),
        );
      },
    );
            },
            onLongPress: () async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("削除の確認"),
        content: Text("本当にこの要素を削除しますか？"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // ポップアップを閉じる
            },
            child: Text("キャンセル"),
          ),
          TextButton(
            onPressed: () async {
              final db = FirebaseFirestore.instance;
              await db.collection("users").doc(user.id).delete();
              _fetchfirebase();
              Navigator.of(context).pop(); // ポップアップを閉じる
            },
            child: Text("削除"),
          ),
        ],
      );
    },
  );
},

            )).toList(),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: gotoaddpage,
        tooltip: 'addpage',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void gotoaddpage () async{
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Addpage()),
    );

    _fetchfirebase();
  }
}