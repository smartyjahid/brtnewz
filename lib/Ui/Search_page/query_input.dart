import 'package:brtnewz/Ui/Search_page/Search_viewer.dart';
import 'package:brtnewz/Ui/headlines/heading_tile.dart';
import 'package:flutter/material.dart';

import '../headlines/headlinesview.dart';

class Serchquery extends StatefulWidget {
  const Serchquery({super.key});

  @override
  State<Serchquery> createState() => _SerchqueryState();
}

class _SerchqueryState extends State<Serchquery> {
  TextEditingController txserach = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 223, 172, 172),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: txserach,
              decoration: InputDecoration(
                hintText: 'Search..',
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.file_copy_outlined,
                  color: Colors.indigo[900],
                ),
                isDense: true,
                contentPadding: EdgeInsets.all(0),
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
          Container(
            width: 1,
            height: 30,
            color: Colors.indigo[900],
          ),
          IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: Colors.indigo[900],
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Searchview(
                              squery: txserach.text,
                            )));
              }),
        ],
      ),
    );
  }
}
