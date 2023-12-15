import 'package:alertdialog_in_flutter/textfield_alertdialog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Basic Alert Dialog in flutter"),
        ),
        body: Material(
          child: BasicAlertDialog(),
        ),
      ),
    ),
  );
}

class BasicAlertDialog extends StatelessWidget {
  const BasicAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            child: Text("Click me"),
            onPressed: () {
              showAlertDialog(context);
            },
          ),
        ),
        Center(
          child: TextButton(
              child: Text("Next"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TextFieldAlertDialog();
                    },
                  ),
                );
              }),
        ),
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    //show alertdialog
    AlertDialog alertDialog = AlertDialog(
      title: Text("Message"),
      content: Text("This is basic Alert Dialog in flutter"),
      actions: [
        okButton,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
