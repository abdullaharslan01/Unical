import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unical/averageCalculator.dart';
import 'package:unical/minFinal.dart';
import 'package:unical/projectDatas.dart';

class ProjejtBody extends StatefulWidget {
  const ProjejtBody({super.key});

  @override
  State<ProjejtBody> createState() => _ProjejtBodyState();
}

class _ProjejtBodyState extends State<ProjejtBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.blueGrey.shade700,
        child: SafeArea(
          child: Column(
            children: [
              _ListTileItem(
                  context,
                  ProjectDatas.drawerMinFinalTitle,
                  ProjectDatas.drawerMinFinalSubtitle,
                  FontAwesomeIcons.minimize,
                  MinFinal.routname),
              _ListTileItem(
                  context,
                  ProjectDatas.drawerAverageTitle,
                  ProjectDatas.drawerAverageSubtitle,
                  FontAwesomeIcons.scaleBalanced,
                  AverageFinal.routname),
              _ListTileItem(
                  context,
                  ProjectDatas.drawerAboutDeveloperTitle,
                  ProjectDatas.drawerAboutDeveloperSubtitle,
                  FontAwesomeIcons.code,
                  "me"),
              _ListTileItem(
                  context,
                  ProjectDatas.drawerExitTitle,
                  ProjectDatas.drawerExitSubtitle,
                  FontAwesomeIcons.doorOpen,
                  "exit")
            ],
          ),
        ),
      ),
      appBar: AppBar(
          title: Text(
        "${ProjectDatas.mainPageAppBarTitle}",
        style: ProjectDatas.mainPageAppBarTitleStyle,
      )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: _Button(
                            onPressed: () {
                              Navigator.pushNamed(context, MinFinal.routname);
                            },
                            buttonName: ProjectDatas.button3Text)),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                        flex: 5,
                        child: _Button(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AverageFinal.routname);
                            },
                            buttonName: ProjectDatas.button2Text)),
                  ],
                )),
            Expanded(
                flex: 4,
                child: Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset("images/hope.jpeg", fit: BoxFit.fill),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: _Button(
                            onPressed: () {
                              _aboutMe(context);
                            },
                            buttonName: ProjectDatas.button0Text)),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                        flex: 5,
                        child: _Button(
                            onPressed: () {
                              _exitNotification(context);
                            },
                            buttonName: ProjectDatas.button1Text)),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Future<dynamic> _exitNotification(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => _MyAlert(
          title: ProjectDatas.exitTitle,
          contextExplanation: ProjectDatas.exitExplanation),
    );
  }

  Future<dynamic> _aboutMe(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(FontAwesomeIcons.userSecret),
            Center(child: Text(ProjectDatas.aboutTitle)),
          ],
        ),
        content: Text(ProjectDatas.aboutContext),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(FontAwesomeIcons.xmark)),
        ],
      ),
    );
  }

  ListTile _ListTileItem(BuildContext context, String title, String subTitle,
      IconData icon, String routeName) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pop();
        if (routeName == "me") {
          _aboutMe(context);
        } else if (routeName == "exit") {
          _exitNotification(context);
        } else {
          Navigator.pushNamed(context, routeName);
        }
      },
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        "$title",
        style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 25),
      ),
      subtitle: Text(
        "$subTitle",
        style: GoogleFonts.comfortaa(color: Colors.white54, fontSize: 10),
      ),
    );
  }

  ElevatedButtonTheme _Button(
          {void Function()? onPressed, String? buttonName}) =>
      ElevatedButtonTheme(
          data: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.transparent,
                  side: BorderSide(
                      strokeAlign: 0.1, style: BorderStyle.solid, width: 2),
                  backgroundColor: Colors.transparent)),
          child: ElevatedButton(
              onPressed: onPressed,
              child: Text(
                "$buttonName",
                textAlign: TextAlign.center,
                style: ProjectDatas.buttonTextStyle,
              )));
}

class _MyAlert extends StatelessWidget {
  const _MyAlert(
      {super.key, required this.title, required this.contextExplanation});
  final String title;
  final String contextExplanation;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("$title"),
      content: Text("$contextExplanation"),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(FontAwesomeIcons.xmark)),
        IconButton(
            onPressed: () {
              SystemChannels.platform.invokeMethod('SystemNavigator.pop');
            },
            icon: Icon(FontAwesomeIcons.check)),
      ],
    );
  }
}
