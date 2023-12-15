import 'package:alertdialog_in_flutter/confirmation_alertDialog.dart';
import 'package:flutter/material.dart';

class TextFieldAlertDialog extends StatelessWidget {
  TextFieldAlertDialog({super.key});

  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('TextField AlertDemo'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "TextField in Dialog"),
            ),
            actions: <Widget>[
              new TextButton(
                child: new Text('SUBMIT'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Show Alert'),
          onPressed: () => _displayDialog(context),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ConfirmationAlertDialog();
            }));
          },
          child: Text("Next"),
        )
      ],
    );
  }
}
