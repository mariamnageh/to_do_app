import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './screens/home.dart';
import 'package:instabug_flutter/instabug_flutter.dart';

void main() {
  runApp(MyApp());
  Instabug.init(
    token: '36078c3fec34df6ebfe8c247cf6a93f6',
    invocationEvents: [
      InvocationEvent.shake,
      InvocationEvent.none,
      InvocationEvent.screenshot,
      InvocationEvent.floatingButton
    ],
  );
  Instabug.show();
  Replies.show();
  Instabug.setPrimaryColor(Colors.blue);
  BugReporting.setFloatingButtonEdge(FloatingButtonEdge.right, 250);
  BugReporting.setShakingThresholdForAndroid(800);
  //Disable extended bug report mode

  BugReporting.setExtendedBugReportMode(
      ExtendedBugReportMode.enabledWithRequiredFields);

//Enable extended bug report mode and make all additional fields required
  ExtendedBugReportMode.enabledWithRequiredFields;
//Enable extended bug report mode and make all additional fields optional
  ExtendedBugReportMode.enabledWithOptionalFields;

  //For all Report Types
  BugReporting.setCommentMinimumCharacterCount(20);

  //For specific Report Types
  BugReporting.setCommentMinimumCharacterCount(
      20, [ReportType.bug, ReportType.feedback, ReportType.question]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: Home(), // Use the Home widget here, not home()
    );
  }
}
