part of '../chat.dart';

enum _ChatFieldStatus { initial, typing, recording }

// bool _hasMicPermission = false;

class _ChatFieldWidget extends StatefulWidget {
  const _ChatFieldWidget();

  @override
  State<_ChatFieldWidget> createState() => _ChatFieldWidgetState();
}

class _ChatFieldWidgetState extends State<_ChatFieldWidget> {
  // bool _isRecorderReady = false;
  String _prevText = '';

  // final _soundRecorder = FlutterSoundRecorder();
  _ChatFieldStatus _status = _ChatFieldStatus.initial;

  final _textController = TextEditingController();

  @override
  void dispose() {
    // _soundRecorder.closeRecorder();
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initRecorder();
  }

  void showAddImageBottomSheet(
      BuildContext context, void Function(ImageSource source) selectImage) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: AppStyles.vPadding20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => selectImage(ImageSource.gallery),
                  icon: const Icon(
                    CupertinoIcons.photo_fill,
                    color: AppColors.primary,
                  ),
                ),
                const Text('Image'),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => selectImage(ImageSource.camera),
                  icon: const Icon(
                    CupertinoIcons.camera_fill,
                    color: AppColors.primary,
                  ),
                ),
                const Text('Camera'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendVoiceRecording(
      {bool start = false, bool cancel = false}) async {
    // if (_hasMicPermission) {
    //   if (_isRecorderReady) {
    //     const path = 'voice.aac';

    //     if (cancel) {
    //       setState(() {
    //         _status = _ChatFieldStatus.initial;
    //       });

    //       await _soundRecorder.stopRecorder();
    //       await _soundRecorder.deleteRecord(fileName: path);
    //     } else if (start) {
    //       setState(() {
    //         _status = _ChatFieldStatus.recording;
    //       });

    //       await _soundRecorder.startRecorder(toFile: path);
    //     } else if (_soundRecorder.isRecording) {
    //       setState(() {
    //         _status = _ChatFieldStatus.initial;
    //       });

    //       _soundRecorder.stopRecorder().then(
    //         (voicePath) {
    //           if (voicePath != null) {
    //             // print(voicePath);

    //             // send message
    //           } else {
    //             ScaffoldMessenger.of(context).showSnackBar(
    //               const SnackBar(
    //                 content: Text("Sorry, couldn't sent voice message !"),
    //               ),
    //             );
    //           }
    //         },
    //       );
    //     }
    //   }
    // } else {
    //   // Ask Mic Permission
    //   final status = await Permission.microphone.request();
    //   if (status != PermissionStatus.granted) {
    //     throw RecordingPermissionException(
    //         'Microphone permission is not allowed');
    //   }
    //   _hasMicPermission = true;

    //   await _initRecorder();
    // }
  }

  Future<void> _initRecorder() async {
    // if (_hasMicPermission) {
    //   await _soundRecorder.openRecorder();
    //   _isRecorderReady = true;
    // }
  }

  void _selectImage(ImageSource source) {
    // Closing the _addFile() ModalBottomSheet
    context.pop();

    try {
      ImagePicker()
          .pickImage(
        source: source,
        requestFullMetadata: false,
      )
          .then(
        (image) {
          if (image != null) {
            // final img = File(image.path);
            // send file
          }
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _onTyping(String currentText) {
    if (currentText.isEmpty || _prevText.isEmpty) {
      if (currentText.isEmpty) {
        setState(() {
          _status = _ChatFieldStatus.initial;
        });
      } else {
        setState(() {
          _status = _ChatFieldStatus.typing;
        });
      }
    }
    _prevText = currentText;
  }

  void _sendTextMessage() {}

  @override
  Widget build(BuildContext context) {
    if (_status == _ChatFieldStatus.recording) {
      return Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              margin: AppStyles.vPadding8,
              padding: AppStyles.hPadding8,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.primary),
                  borderRadius: AppStyles.borderRadius16,
                ),
              ),
              alignment: Alignment.centerLeft,
              child: const Text('Swipe to cancel'),
            ),
          ),
          AppStyles.width5,
          GestureDetector(
            onLongPressUp: _sendVoiceRecording,
            onLongPressMoveUpdate: (details) {
              if (details.offsetFromOrigin.distance > 50) {
                _sendVoiceRecording(cancel: true);
              }
            },
            child: const CircleAvatar(child: Icon(Icons.mic)),
          )
        ],
      );
    }
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: AppStyles.vPadding8,
            child: TextFormField(
              controller: _textController,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: const OutlineInputBorder(
                  borderRadius: AppStyles.borderRadius16,
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: AppStyles.borderRadius16,
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                contentPadding: AppStyles.padding8,
                prefixIcon: IconButton(
                  onPressed: () =>
                      showAddImageBottomSheet(context, _selectImage),
                  icon: const Icon(CupertinoIcons.add_circled_solid),
                ),
              ),
              onChanged: _onTyping,
            ),
          ),
        ),
        AppStyles.width5,
        _status == _ChatFieldStatus.initial
            ? GestureDetector(
                onLongPress: () => _sendVoiceRecording(start: true),
                child: const CircleAvatar(child: Icon(Icons.mic)),
              )
            : CircleAvatar(
                child: IconButton(
                  onPressed: _sendTextMessage,
                  icon: const Icon(Icons.send_rounded),
                ),
              ),
      ],
    );
  }
}
