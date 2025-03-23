import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomContextMenuDemo(),
    );
  }
}

class CustomContextMenuDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Context Menu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          contextMenuBuilder: (context, editableTextState) {
            final List<ContextMenuButtonItem> buttonItems =
                editableTextState.contextMenuButtonItems;
            
            buttonItems.insert(
                0,
                ContextMenuButtonItem(
                  label: 'Custom Action',
                  onPressed: () {
                    ContextMenuController.removeAny();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Custom Action Selected')),
                    );
                  },
                ));
            
            return AdaptiveTextSelectionToolbar.buttonItems(
              anchors: editableTextState.contextMenuAnchors,
              buttonItems: buttonItems,
            );
          },
          decoration: InputDecoration(
            hintText: 'Long press to see custom actions',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
