import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unical/projectDatas.dart';

class AverageFinal extends StatefulWidget {
  const AverageFinal({super.key});
  static String routname = "averageFinal";

  @override
  State<AverageFinal> createState() => _AverageFinalState();
}

class _AverageFinalState extends State<AverageFinal> {
  double midTermNotes = 50;
  int result = 50;
  double finalNotes = 60;
  IconData resultIcon = FontAwesomeIcons.scaleBalanced;

  void calculateAverage() {
    result = (midTermNotes * 0.4 + finalNotes * 0.6).round();

    if (result < 50) {
      resultIcon = FontAwesomeIcons.scaleUnbalanced;
    } else if (result == 50) {
      resultIcon = FontAwesomeIcons.scaleBalanced;
    } else {
      resultIcon = FontAwesomeIcons.scaleUnbalancedFlip;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ProjectDatas.averagePageAppBarTitle,
            style: ProjectDatas.mainPageAppBarTitleStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              child: MyContainer(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 50, 0, 25),
                  child: Row(
                    children: [
                      Text(
                        "${ProjectDatas.averageMidterm}: ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.comfortaa(
                            fontSize: 40, color: Colors.black54),
                      ),
                      Text(
                        "${midTermNotes.round().toString()}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.comfortaa(
                            fontSize: 43,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Slider(
                  min: 0,
                  max: 100,
                  label: midTermNotes.round().toString(),
                  divisions: 100,
                  value: midTermNotes,
                  onChanged: (changedValue) {
                    setState(() {
                      midTermNotes = changedValue;
                      calculateAverage();
                    });
                  },
                )
              ],
            ),
          )),
          Expanded(
              child: MyContainer(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 50, 0, 25),
                  child: Row(
                    children: [
                      Text(
                        "${ProjectDatas.averageFinal}: ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.comfortaa(
                            fontSize: 40, color: Colors.black54),
                      ),
                      Text(
                        "${finalNotes.round().toString()}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.comfortaa(
                            fontSize: 43,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Slider(
                  min: 0,
                  max: 100,
                  label: finalNotes.round().toString(),
                  divisions: 100,
                  value: finalNotes,
                  onChanged: (changedValue) {
                    setState(() {
                      finalNotes = changedValue;
                      calculateAverage();
                    });
                  },
                )
              ],
            ),
          )),
          Expanded(
              child: MyContainer(
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 60, 0),
                    child: Icon(
                      resultIcon,
                      size: 90,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "${result.round().toString()}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.comfortaa(
                        fontSize: 100,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )),
        ]),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({
    this.child,
    super.key,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.amber),
    );
  }
}
