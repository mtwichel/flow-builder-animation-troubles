import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlowBlocBuilder<B extends BlocBase<S>, S> extends StatelessWidget {
  const FlowBlocBuilder({
    required this.onGeneratePages,
    Key? key,
  }) : super(key: key);

  final List<Page<dynamic>> Function(S, List<Page<dynamic>>) onGeneratePages;

  @override
  Widget build(BuildContext context) {
    return FlowBuilder<S>(
      state: context.select<B, S>((B cubit) => cubit.state),
      onGeneratePages: onGeneratePages,
    );
  }
}
