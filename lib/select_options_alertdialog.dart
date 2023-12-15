import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Select Options Alert Dialog"),
        ),
        body: Material(
          child: SelectOptionAlertDialog(),
        ),
      ),
    ),
  );
}

class SelectOptionAlertDialog extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          ElevatedButton(
              onPressed: () async {
                final Product? prodName = await _asyncSimpleDialog(context);
                print("Selected Product is $prodName");
              },
              child: const Text(
                "Show Alert",),
            ),
            TextButton(
              child: new Text('Back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
    );
  }
}
enum Product { Apple, Samsung, Oppo, Redmi }

Future<Product?> _asyncSimpleDialog(BuildContext context) async {
  return await showDialog<Product>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Product '),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Product.Apple);
              },
              child: const Text('Apple'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Product.Samsung);
              },
              child: const Text('Samsung'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Product.Oppo);
              },
              child: const Text('Oppo'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Product.Redmi);
              },
              child: const Text('Redmi'),
            ),
          ],
        );
      });
}