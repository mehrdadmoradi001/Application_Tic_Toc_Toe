import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isTurnO = true;

  List<String> xOroList = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Tic Tac Toe'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            getScoreBored(),
            SizedBox(height: 40.0),
            getGridView(),
            getTurn(),
          ],
        ),
      ),
    );
  }

  Widget getTurn() {
    return Text(
      isTurnO ? 'TurnO' : 'TurnX',
      style: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget getGridView() {
    return Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tapped(index);
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  xOroList[index],
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void tapped(int index) {
    print('$index');
    setState(() {
      if (isTurnO && xOroList[index] == '') {
        xOroList[index] = 'O';
        isTurnO = false;
      }
      if (!isTurnO && xOroList[index] == '') {
        xOroList[index] = 'X';
        isTurnO = true;
      }
    });
  }

  Widget getScoreBored() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Player O',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '0',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Player X',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '0',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
