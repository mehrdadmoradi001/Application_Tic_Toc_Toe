import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isTurnO = true;

  List<String> xOroList = ['', '', '', '', '', '', '', '', ''];

  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Tic Tac Toe'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            onPressed: () {
              clearGame();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
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
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color:
                          xOroList[index] == 'X' ? Colors.white : Colors.red),
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
      if (xOroList[index] != '') {
        return;
      }

      if (isTurnO) {
        xOroList[index] = 'O';
        filledBoxes = filledBoxes + 1;
      } else {
        xOroList[index] = 'X';
        filledBoxes = filledBoxes + 1;
      }

      isTurnO = !isTurnO;
    });

    checkWinner();

    if (filledBoxes == 9) {
      print('game is equal');
    }
  }

  void checkWinner() {
    if (xOroList[0] == xOroList[1] &&
        xOroList[0] == xOroList[2] &&
        xOroList[0] != '') {
      print('Winner is ' + xOroList[0]);
      return;
    }
    if (xOroList[3] == xOroList[4] &&
        xOroList[3] == xOroList[5] &&
        xOroList[3] != '') {
      print('Winner is ' + xOroList[3]);
      return;
    }
    if (xOroList[6] == xOroList[7] &&
        xOroList[6] == xOroList[8] &&
        xOroList[6] != '') {
      print('Winner is ' + xOroList[6]);
      return;
    }
    if (xOroList[0] == xOroList[3] &&
        xOroList[0] == xOroList[6] &&
        xOroList[0] != '') {
      print('Winner is ' + xOroList[0]);
      return;
    }
    if (xOroList[1] == xOroList[4] &&
        xOroList[1] == xOroList[7] &&
        xOroList[1] != '') {
      print('Winner is ' + xOroList[1]);
      return;
    }
    if (xOroList[2] == xOroList[5] &&
        xOroList[2] == xOroList[8] &&
        xOroList[2] != '') {
      print('Winner is ' + xOroList[2]);
      return;
    }
    if (xOroList[0] == xOroList[4] &&
        xOroList[0] == xOroList[8] &&
        xOroList[0] != '') {
      print('Winner is ' + xOroList[0]);
      return;
    }
    if (xOroList[2] == xOroList[4] &&
        xOroList[2] == xOroList[6] &&
        xOroList[2] != '') {
      print('Winner is ' + xOroList[2]);
      return;
    }
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

  void clearGame(){
    setState(() {
      for(var i=0; i < xOroList.length; i++){
        xOroList[i] = '';
        filledBoxes = 0;
      }
    });
  }
}
