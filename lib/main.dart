import 'package:buy_tickets_design/app_state.dart';
import 'package:buy_tickets_design/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
        builder: (context) => AppState(),
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'SF Pro Display'),
          title: 'Buy Tickets',
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        ),
      );
  }
}
