import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

// Future<List<int>> fetchData() async {
//   final apiUrl = 'https://script.google.com/macros/s/AKfycby7o065pPg70rQxnPG50EdyrO7f8VbdwXvZ2KPVFYismIv1RzhYdUzf4rxGljYN1Z66/exec';

//   Map<String, dynamic> jsonData;

//   try {
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       jsonData = json.decode(response.body);
//     } else {
//       return [response.statusCode];
//     }
//   } catch (err) {
//     return [];
//   }

//   String jsonDataString = jsonData['egg_data'].toString();

//   List<int> eggDataArray = jsonDataString.split('').map((String digit) => int.parse(digit)).toList();

//   print(eggDataArray);

//   return eggDataArray;
// }

class EggNumWidget extends StatefulWidget {
  @override
  _EggNumWidgetState createState() => _EggNumWidgetState();
}

class _EggNumWidgetState extends State<EggNumWidget> {
  late Future<List<int>> eggDataFuture;

  @override
  void initState() {
    super.initState();
    eggDataFuture = fetchData();
  }

  Future<List<int>> fetchData() async {
    final apiUrl = 'https://script.google.com/macros/s/AKfycby7o065pPg70rQxnPG50EdyrO7f8VbdwXvZ2KPVFYismIv1RzhYdUzf4rxGljYN1Z66/exec';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        String jsonDataString = jsonData['egg_data'].toString();
        List<int> eggDataArray = jsonDataString.split('').map((String digit) => int.parse(digit)).toList();
        return eggDataArray;
      } else {
        return [response.statusCode];
      }
    } catch (err) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>>(
      future: eggDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // データ取得中の表示
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return Text('No data available');
        } else {
          return GridView.count(
            padding: EdgeInsets.only(top: 30),
            crossAxisCount: 3,
            children: snapshot.data!.map((int eggData) {
              return Column(
                children: [
                  EggWidget(eggData: eggData),
                ],
              );
            }).toList(),
          );
        }
      },
    );
  }
}

class EggWidget extends StatelessWidget {
  const EggWidget({
    Key? key,
    required this.eggData,
  }) : super(key: key);

  final int eggData;

  Color getEggColor() {
    return eggData == 1 ? Colors.yellow : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 50,
          decoration: BoxDecoration(
            color: getEggColor(),
            borderRadius: BorderRadius.all(
              Radius.elliptical(50, 100),
            )
          ),
        ),
        Text('test text'),
      ],
    );
  }
}
