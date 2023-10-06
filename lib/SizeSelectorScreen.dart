import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  List<Color> buttonColors = [
    Colors.red,
    Colors.green,
    Colors.pink,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  // Define the available button sizes
  List<String> buttonSizes = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    'XXXL',
  ];
  int selectedIndex = -1;
  String selectedSize = '';


  void handleButtonTap(int index) {
    setState(() {

      selectedIndex = index;


      selectedSize = buttonSizes[index];


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selected Size: $selectedSize'),
          duration: const Duration(milliseconds: 200),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Size Selector'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton(

                        onPressed: () {
                          handleButtonTap(i);
                        },
                        style: ElevatedButton.styleFrom(

                          primary: selectedIndex == i ? buttonColors[i] : null,
                        ),
                        child: Text(buttonSizes[i] , style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white
                        ),),
                      ),
                    )
                ],

              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 4; i < buttonColors.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton(
                        onPressed: () {
                          handleButtonTap(i);
                        },
                        style: ElevatedButton.styleFrom(

                          primary: selectedIndex == i ? buttonColors[i] : null,
                        ),
                        child: Text(buttonSizes[i] , style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white
                        ),),
                      ),
                    ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
