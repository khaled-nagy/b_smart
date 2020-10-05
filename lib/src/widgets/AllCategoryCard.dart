import 'package:flutter/material.dart';

class AllCategoryCard extends StatefulWidget {
  @override
  _AllCategoryCardState createState() => _AllCategoryCardState();
}

class _AllCategoryCardState extends State<AllCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/imgs/Beauty.png"),
            ),
            Text("Beauty", style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ),
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => SubCategoriesScreen()));
      },
    );
  }
}
