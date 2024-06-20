part of '../chat.dart';

class _ReceivedMessageWidget extends StatelessWidget {
  const _ReceivedMessageWidget(this._message);

  final Message _message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 40),
        padding: AppStyles.paddingMessage,
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.secondaryFixedDim,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              _message.message,
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.start,
              softWrap: true,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryFixed,
              ),
            ),
            Text(
              DateFormat.jm().format(_message.dateTime),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryFixedVariant,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
