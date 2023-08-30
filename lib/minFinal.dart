import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unical/projectDatas.dart';

class MinFinal extends StatefulWidget {
  const MinFinal({super.key});
  static String routname = "minFinal";

  @override
  State<MinFinal> createState() => _MinFinalState();
}

class _MinFinalState extends State<MinFinal> {
  double midTermNotes = 50;
  int result = 50;
  double averageNotes = 60;
  IconData resultIcon = FontAwesomeIcons.scaleBalanced;

  void calculateAverage() {
    result = ((averageNotes - midTermNotes * 0.4) / 0.6).round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ProjectDatas.minFinalTitle,
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
                  padding: const EdgeInsets.fromLTRB(50, 50, 0, 25),
                  child: Row(
                    children: [
                      Text(
                        "${ProjectDatas.minFinalAverage}: ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.comfortaa(
                            fontSize: 40, color: Colors.black54),
                      ),
                      Text(
                        "${averageNotes.round().toString()}",
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
                  label: averageNotes.round().toString(),
                  divisions: 100,
                  value: averageNotes,
                  onChanged: (changedValue) {
                    setState(() {
                      averageNotes = changedValue;
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
                children: [ Text(
                    "Min Final: ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.comfortaa(
                        fontSize: 35,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
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
