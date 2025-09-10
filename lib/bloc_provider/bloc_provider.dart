// 1
import 'package:flutter/material.dart';

import '../bloc/article_list/bloc.dart';
class BlocProviders<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  BlocProviders({
    Key? key,
    required this.bloc,
    required this.child,
  }) : super(key: key);

  // 2
  static T of<T extends Bloc>(BuildContext context) {
    final BlocProviders<T> provider = context.findAncestorWidgetOfExactType()!;
    return provider.bloc;
  }

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProviders> {
  // 3
  @override
  Widget build(BuildContext context) => widget.child;

  // 4
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
