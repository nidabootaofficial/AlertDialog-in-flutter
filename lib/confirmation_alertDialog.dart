import 'package:alertdialog_in_flutter/select_options_alertdialog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Confirmation Alert Dialog"),
        ),
        body: Material(
          child: ConfirmationAlertDialog(),
        ),
      ),
    ),
  );
}

class ConfirmationAlertDialog extends StatelessWidget {
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
                final Future<ConfirmAction?> action = await _asyncConfirmDialog(context);
                print("Confirm Action $action" );
              },
              child: const Text("Show Alert",),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SelectOptionAlertDialog();
                }));
              },
              child: Text("Next"),
            )
          ],
        ),
      );
  }
}
enum ConfirmAction {Cancel, Accept}
Future<Future<ConfirmAction?>> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: true, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete This Contact?'),
        content: const Text(
            'This will delete the contact from your device.'),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          ElevatedButton(
            child: const Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Accept);
            },
          )
        ],
      );
    },
  );
}