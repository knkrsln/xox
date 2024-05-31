import 'package:flutter/material.dart';

class TwoPlayer extends StatefulWidget {
  const TwoPlayer({super.key});

  @override
  State<StatefulWidget> createState() {
    return ikiOyunculu();
  }
}

class ikiOyunculu extends State<TwoPlayer> {
  String cr00 = "";
  String cr01 = "";
  String cr02 = "";
  String cr10 = "";
  String cr11 = "";
  String cr12 = "";
  String cr20 = "";
  String cr21 = "";
  String cr22 = "";
  int oyuncuDurumu = 0;
  String kazanan = "";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final buttonSize = size.width / 3 - 30; // Her bir buton için uygun boyut

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("2 Kişilik Oyun"),
      ),
      body: Column(
        children: [
          Text("Sıra: ${oyuncuDurumu == 0 ? 'O' : 'X'} Oyuncuda"),
          if (kazanan.isNotEmpty)
            Text(
              "Kazanan: $kazanan",
              style: const TextStyle(fontSize: 30, color: Colors.red),
            ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildRow([0, 1, 2], [cr00, cr01, cr02], buttonSize),
                const SizedBox(height: 25),
                buildRow([3, 4, 5], [cr10, cr11, cr12], buttonSize),
                const SizedBox(height: 25),
                buildRow([6, 7, 8], [cr20, cr21, cr22], buttonSize),
              ],
            ),
          ),
          const Text("Kaan Karaaslan")
        ],
      ),
    );
  }

  Row buildRow(List<int> indices, List<String> values, double buttonSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (i) {
        return Padding(
          padding: const EdgeInsets.all(12.5),
          child: SizedBox(
            width: buttonSize,
            height: buttonSize,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
              ),
              onPressed: kazanan.isNotEmpty ? null : () => changePlayerState(indices[i]),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  values[i],
                  style: const TextStyle(fontSize: 110),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void changePlayerState(int index) {
    setState(() {
      if (getValueAt(index) == "") {
        setValue(index, oyuncuDurumu == 0 ? "O" : "X");
        if (checkWin()) {
          kazanan = oyuncuDurumu == 0 ? "O" : "X";
        } else if (isDraw()) {
          kazanan = "Berabere";
        } else {
          oyuncuDurumu = 1 - oyuncuDurumu;
        }
      }
    });
  }

  String getValueAt(int index) {
    switch (index) {
      case 0:
        return cr00;
      case 1:
        return cr01;
      case 2:
        return cr02;
      case 3:
        return cr10;
      case 4:
        return cr11;
      case 5:
        return cr12;
      case 6:
        return cr20;
      case 7:
        return cr21;
      case 8:
        return cr22;
      default:
        return "";
    }
  }

  void setValue(int index, String value) {
    setState(() {
      switch (index) {
        case 0:
          cr00 = value;
          break;
        case 1:
          cr01 = value;
          break;
        case 2:
          cr02 = value;
          break;
        case 3:
          cr10 = value;
          break;
        case 4:
          cr11 = value;
          break;
        case 5:
          cr12 = value;
          break;
        case 6:
          cr20 = value;
          break;
        case 7:
          cr21 = value;
          break;
        case 8:
          cr22 = value;
          break;
      }
    });
  }

  bool checkWin() {
    List<List<int>> winConditions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var condition in winConditions) {
      String val1 = getValueAt(condition[0]);
      String val2 = getValueAt(condition[1]);
      String val3 = getValueAt(condition[2]);
      if (val1 == val2 && val2 == val3 && val1 != "") {
        return true;
      }
    }
    return false;
  }

  bool isDraw() {
    List<String> values = [cr00, cr01, cr02, cr10, cr11, cr12, cr20, cr21, cr22];
    return values.every((value) => value.isNotEmpty);
  }

  void resetGame() {
    setState(() {
      cr00 = "";
      cr01 = "";
      cr02 = "";
      cr10 = "";
      cr11 = "";
      cr12 = "";
      cr20 = "";
      cr21 = "";
      cr22 = "";
      oyuncuDurumu = 0;
      kazanan = "";
    });
  }
}
