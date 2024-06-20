part of 'shimmer.dart';

class SkeltonWidget extends StatelessWidget {
  const SkeltonWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: AppStyles.borderRadius16,
      ),
    );
  }
}
