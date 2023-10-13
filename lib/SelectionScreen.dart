import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  List<String> items = List.generate(50, (index) => "Item $index");
  Set<int> selectedItems = Set();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selection Screen"),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index+1]),
            onTap: () {
              setState(() {
                if (selectedItems.contains(index)) {
                  selectedItems.remove(index);
                } else {
                  selectedItems.add(index);
                }
              });
            },
            tileColor: selectedItems.contains(index)
                ? Colors.blue
                : Colors.white,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Selected Items"),
                content: Text("Number of selected items: ${selectedItems.length}"),
                actions: <Widget>[
                  TextButton(
                    child: Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
