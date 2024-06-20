part of '../all_messages.dart';

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          9,
          (index) => const ListTile(
            leading: CircleAvatar(),
            title: SkeltonWidget(size: Size(20, 15)),
            subtitle: SkeltonWidget(size: Size(20, 10)),
          ),
        ),
      ),
    );
  }
}
