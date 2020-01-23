import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testes_app/styles.dart';

import 'dark_theme_preferences.dart';
import 'provider/dark_theme_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  final String title = "Palmeiras não tem mundial!";
}

class _MyAppState extends State<MyApp> {
  AppThemeProvider themeChangeProvider = new AppThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
//    themeChangeProvider.darkTheme =
//        await themeChangeProvider.darkThemePreference.getTheme();

    themeChangeProvider.appThemeEnum =
    await themeChangeProvider.appThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          child: MyApp(),
          create: (_) {
            return themeChangeProvider;
          },
        )
      ],
      child: Consumer<AppThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.appThemeEnum, context),
            home: content(),
          );
        },
      ),
    );
  }

  int _counter = 0;

  Future<void> _incrementCounter() async {
    //themeChangeProvider.appThemeEnum = themeChangeProvider.appThemeEnum;
    setState(() {
      _counter++;
    });
  }

  content() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      darkTheme: Styles.themeData(true, context),
//      theme: Styles.themeData(false, context),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }

}
