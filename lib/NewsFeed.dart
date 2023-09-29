import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsFeedScreeen extends StatefulWidget {
  const NewsFeedScreeen({super.key});

  @override
  State<NewsFeedScreeen> createState() => _NewsFeedScreeenState();
}

class _NewsFeedScreeenState extends State<NewsFeedScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.blue,
        title: const Text('News Feed'),
      ),
      body: OrientationBuilder(
          builder: (context, orientation){
            if(orientation == Orientation.portrait){
              return Column(
                children: [
                  const SizedBox(height: 12,),

                  SizedBox(
                    height: MediaQuery.of(context).size.height-100,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 3,
                            crossAxisSpacing: 5, mainAxisSpacing: 5),
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return Card(
                              color: Colors.white,
                              elevation: 2,
                              child: Container(
                                //color: Colors.yellow,
                                 width: 150,
                                  height: 150,
                                  child: Image.asset("assets/images/placeholder.png",width: 50,height: 50,fit: BoxFit.contain,)));
                        },
                      ),
                    ),
                  ),
                ],

              );
            }
            else {
              return Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height-100,
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2,
                            crossAxisSpacing: 5, mainAxisSpacing: 5),
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Card(
                              color: Colors.white,
                              elevation: 2,
                              child: Container(
                                //color: Colors.yellow,
                                   height: 150,
                                  width: 150,
                                  child: Image.asset("assets/images/placeholder.png",width: 150,height: 150,fit: BoxFit.contain)));
                        },
                      ),
                    )

                  ],
                ),
              );
            }
          }
      ),
    );
  }
}
