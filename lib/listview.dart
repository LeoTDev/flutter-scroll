import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.builder(
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return ListItem(index: index + 1);
            }),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final int index;

  const ListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: theme.primaryColor),
          child: SizedBox(
            height: 50,
            child: Center(
                child: Text(
              "item $index",
              style: theme.textTheme.labelLarge
                  ?.copyWith(color: theme.primaryColorLight),
            )),
          )),
    );
  }
}
