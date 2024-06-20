part of '../chat.dart';

class _SentMessageWidget extends StatelessWidget {
  const _SentMessageWidget(this._message);

  final Message _message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 40),
        padding: AppStyles.paddingMessage,
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.primaryFixedDim,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(2),
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
                color: Theme.of(context).colorScheme.onPrimaryFixed,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  DateFormat.jm().format(_message.dateTime),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
                    fontSize: 12,
                  ),
                ),
                AppStyles.width5,
                if (_message.status == MessageStatus.sending)
                  Icon(
                    CupertinoIcons.time,
                    size: 17,
                    color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
                  ),
                if (_message.status == MessageStatus.sent)
                  Icon(
                    Icons.done_rounded,
                    size: 17,
                    color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
                  ),
                if (_message.status == MessageStatus.delivered)
                  Icon(
                    Icons.done_all_rounded,
                    size: 17,
                    color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
                  ),
                if (_message.status == MessageStatus.seen)
                  const Icon(
                    Icons.done_all_rounded,
                    size: 17,
                    color: AppColors.messageSeen,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
