import 'package:flutter/material.dart';
import 'package:habitpunk/main.dart';
import 'package:habitpunk/util/habit_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 

  final scaffoldKey = GlobalKey<ScaffoldState>();


  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      FocusScope.of(context).requestFocus(FocusNode());
        },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(150),
                child: AppBar(
                  backgroundColor: Colors.orange,
                  automaticallyImplyLeading: false,
                  actions: [],
                  centerTitle: false,
                  elevation: 2,
                ),
              ),
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Habits',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Container(
                        width: 1319,
                        height: 548,
                        decoration: const BoxDecoration(
                          color: Colors.white
                        ),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                      Align(
                        alignment: const AlignmentDirectional(0, -1),
                        child: Container(
                          width: 371,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(125, 255, 255, 255),
                            shape: BoxShape.rectangle,
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.green, // Replace with your desired color
                                    ),
                                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      const EdgeInsets.symmetric(horizontal: 24),
                                    ),
                                    textStyle: MaterialStateProperty.all<TextStyle>(
                                      TextStyle(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                    ),
                                    elevation: MaterialStateProperty.all<double>(3),
                                    side: MaterialStateProperty.all<BorderSide>(
                                      BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                    shape: MaterialStateProperty.all<OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  child: Text('+'),
                                ),
                                Container(
                                  width: 247,
                                  height: 39,
                                  decoration: BoxDecoration(
                                    color: Colors.grey, // Replace with your desired color
                                    border: Border.all(
                                      color: Colors.blue, // Replace with your desired color
                                      width: 2,
                                    ),
                                  ),
                                  child: const Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Text(
                                      'Insert Habit here',
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black, // Replace with your desired color
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.red, // Replace with your desired color
                                    ),
                                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      const EdgeInsets.symmetric(horizontal: 24),
                                    ),
                                    textStyle: MaterialStateProperty.all<TextStyle>(
                                      const TextStyle(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                    ),
                                    elevation: MaterialStateProperty.all<double>(3),
                                    side: MaterialStateProperty.all<BorderSide>(
                                      const BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                    shape: MaterialStateProperty.all<OutlinedBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  child: const Text('-'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],                                   
                    ),
                  ],
                ),
              ),
            ),
          ]
        )
        )
      )
    );  
        
  }
}