import 'package:calendar_printer/page/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).copyWith(
      primaryColor: Colors.grey,
    );
    var textTheme = theme.textTheme;
    return MaterialApp(
      theme: theme.copyWith(
        textTheme: textTheme.copyWith(
          headline2: textTheme.headline2?.copyWith(
            color: Colors.black,
            fontSize: textTheme.headline2!.fontSize! * 1.2,
          ),
          headline6: textTheme.headline6?.copyWith(
            color: Colors.black,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
