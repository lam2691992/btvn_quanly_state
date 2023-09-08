import 'package:btvn_qly_statee/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  final UserInterAct _bloc = UserInterAct();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            StreamBuilder<int>(
              initialData: 0,
              stream: _bloc.likeStream,
              builder: (context, snapshot) {
                return  Expanded(child: Center(child: Text('${snapshot.data} likes')));
              }
            ),
            StreamBuilder<int>(
              initialData: 0,
              stream: _bloc.commentStream.stream,
              builder: (context, snapshot) {
                return Expanded(child: Center(child: Text('${snapshot.data} comments')));
              }
            ),
          ],
        ),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<int>(
            stream: _bloc.interActStream,
            builder: (context, snapshot) {
              return Text('Tong so luong tuong tac la: ${snapshot.data}');
            }
          ),
        ),
        Row(
          children: [
            Expanded(
                child: TextButton(onPressed: _bloc.tangsoLike, child: const Text('Like'))),
            Expanded(
                child:
                    TextButton(onPressed: _bloc.tangsoCommet, child: const Text('Comment'))),
          ],
        )
      ],
    ));
  }
}
