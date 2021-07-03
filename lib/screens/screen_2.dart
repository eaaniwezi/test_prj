import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
// ignore: prefer_relative_imports
import 'package:test_prj/providers/horizontal_items.dart';
// ignore: prefer_relative_imports
import 'package:test_prj/providers/vertical_items.dart';

// class Screen2 extends StatelessWidget {
//   const Screen2({Key? key}) : super(key: key);

//   static const routeName = '/screen_2';

//   @override
//   Widget build(BuildContext context) => Container();
// }

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);
  static const routeName = '/screen_2';

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          // ignore: prefer_const_literals_to_create_immutables
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Section 1 (2)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                _horizontalItem(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Section 2 (4)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                _verticalItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }

   Widget _verticalItem() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: Provider.of<HorizontalItemsProvider>(context).itemsCount,
        itemBuilder: (context, index) {
          var counter = Provider.of<VerticalItemsProvider>(
            context,
          ).generateItemAt(index);
          return _item(counter);
        });
  }

  Widget _item(String counter) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: 150,
          height: 100,
          child: Center(
            // ignore: prefer_const_constructors
            child: Text(
              '$counter',
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _horizontalItem() {
    return SizedBox(
      height: 130.0,
      width: double.infinity,
      child: Center(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            itemCount: Provider.of<HorizontalItemsProvider>(context).itemsCount,
            itemBuilder: (context, index) {
              var counter = Provider.of<HorizontalItemsProvider>(
                context,
              ).generateItemAt(index);
              return _item(counter);
            }),
      ),
    );
  }
}
