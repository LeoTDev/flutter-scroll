import 'package:flutter/material.dart';

class ListViewWithRefreshIndicatorScreen extends StatelessWidget {
  const ListViewWithRefreshIndicatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView with RefreshIndicator"),
      ),
      body: RefreshIndicator(
        onRefresh: () { return Future.delayed(const Duration(seconds: 3)); },
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView.separated(
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return ListItem(index: index + 1);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 1,
              );
            },
          ),
        ),
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
