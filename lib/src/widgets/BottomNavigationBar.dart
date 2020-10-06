import 'package:flutter/material.dart';
class BottomNavigationbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       var size = MediaQuery.of(context).size;
    return Container(
        child: Center(child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("BSmart - 2020",style:Theme.of(context).textTheme.headline1 ,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.copyright,size: 20,color:Theme.of(context).accentColor ,),
            )
          ],
        ) ,),
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        height: 60.0,
        width: size.width,
      );
  }
}