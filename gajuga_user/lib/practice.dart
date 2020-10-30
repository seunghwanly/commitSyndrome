// import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       theme: ThemeData(
//         primaryColor: Colors.white,
//       ),
//       home: RandomWords(),
//     );
//   }
// }

// class RandomWords extends StatefulWidget {
//   @override
//   _RandomWordsState createState() => _RandomWordsState();
// }

// class _RandomWordsState extends State<RandomWords> {
//   final List<WordPair> _suggestion = <WordPair>[];
//   final TextStyle _biggerFont = const TextStyle(fontSize: 20);
//   final Set<WordPair> _saved = Set<WordPair>();

//   void _pushSaved() {
//     Navigator.of(context).push(
//       MaterialPageRoute<void>(
//         builder: (BuildContext context) {
//           final tiles = _saved.map(
//             (WordPair pair) {
//               return ListTile(
//                 title: Text(
//                   pair.asPascalCase, style: _biggerFont,
//                 ),
//               );
//             },
//           );
//           final divided = ListTile.divideTiles(
//             context: context,
//             tiles: tiles
//           ).toList();

//           return Scaffold(
//             appBar: AppBar(
//               title: Text("Saved"),
//             ),
//             body: ListView(children: divided)
//             );
//         },
//       )
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('GG'),
//         actions: [
//           IconButton(icon: Icon(Icons.format_list_bulleted), onPressed: _pushSaved)
//         ],
//       ),
//       body: _biggerSuggestion(),
//     );
//   }

//   Widget _biggerSuggestion() {
//     return ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemBuilder: (BuildContext _context, int i) {
//           if (i.isOdd) {
//             return Divider();
//           }
//           final int index = i ~/ 2;

//           _suggestion.addAll(generateWordPairs().take(10));

//           return _buildRow(_suggestion[index]);
//         });
//   }

//   Widget _buildRow(WordPair pair) {
//     final alreadySaved = _saved.contains(pair);

//     return ListTile(
//       title: Text(
//         pair.asPascalCase,
//         style: _biggerFont,
//       ),
//       trailing: Icon(
//         alreadySaved ? Icons.favorite : Icons.favorite_border,
//         color: alreadySaved ? Colors.red : null,
//       ),
//       onTap: (){
//         setState(() {
//           if(alreadySaved){
//             _saved.remove(pair);
//           } else {
//             _saved.add(pair);
//           }
//         });
//       },
//     );
//   }
// }
