import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConsumerStateData<T> extends StatelessWidget {
  const ConsumerStateData({
    super.key,
    required this.state,
    required this.enumValue,
    required this.message,
    this.isSliver = false,
    this.loadingWidget,
    required this.builder,
  });

  final Enum state;
  final List<Enum> enumValue;
  final String message;

  final bool? isSliver;
  final Widget? loadingWidget;

  final Widget Function(BuildContext context, T value, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, provider, child) {
        if (state == enumValue[0]) {
          if (isSliver!) {
            return loadingWidget ??
                const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator.adaptive()),
                );
          } else {
            return loadingWidget ??
                const Center(child: CircularProgressIndicator.adaptive());
          }
        } else if (state == enumValue[2]) {
          return builder(context, Provider.of<T>(context), child);
        } else if (state == enumValue[1]) {
          if (isSliver!) {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }
        } else if (state == enumValue[3]) {
          if (isSliver!) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'Internal Server Error',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Internal Server Error',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            );
          }
        } else {
          return builder(context, Provider.of<T>(context), child);
        }
      },
    );
  }
}
