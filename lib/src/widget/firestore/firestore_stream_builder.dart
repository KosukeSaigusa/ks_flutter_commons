import 'package:flutter/material.dart';

class DocumentStreamBuilder<T> extends StatelessWidget {
  const DocumentStreamBuilder({
    required this.subscriber,
    required this.builder,
    this.waitingWidget = const SizedBox(),
    this.noDataWidget = const SizedBox(),
  });
  final Stream<T?> subscriber;
  final Widget Function(BuildContext context, T data) builder;
  final Widget waitingWidget;
  final Widget noDataWidget;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T?>(
      stream: subscriber,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }
        if (!snapshot.hasData) {
          return const SizedBox();
        }
        final data = snapshot.data as T;
        return builder(context, data);
      },
    );
  }
}

class CollectionStreamBuilder<T> extends StatelessWidget {
  const CollectionStreamBuilder({
    required this.subscriber,
    required this.builder,
    this.waitingWidget = const SizedBox(),
    this.noDataWidget = const SizedBox(),
  });
  final Stream<List<T>> subscriber;
  final Widget Function(BuildContext context, List<T> data) builder;
  final Widget waitingWidget;
  final Widget noDataWidget;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<T>>(
      stream: subscriber,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }
        if (!snapshot.hasData) {
          return const SizedBox();
        }
        final data = snapshot.data!;
        return builder(context, data);
      },
    );
  }
}
