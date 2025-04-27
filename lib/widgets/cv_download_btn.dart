// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// Define the possible states of the download
enum DownlaodStatus {notDownloaded, fechingDownload, downloading, downloaded}

class CvDownloadButton extends StatelessWidget {
  const CvDownloadButton({
    Key? key,
    required this.status,
    required this.transitionDuration,
  }) : super(key: key);

  final DownlaodStatus status;
  final Duration transitionDuration;

  // 
  bool get _isDownloading => status == DownlaodStatus.downloading;
  bool get _isFeching => status == DownlaodStatus.fechingDownload;
  bool get _isdownloaded => status == DownlaodStatus.downloaded;

  @override
  Widget build(BuildContext context) {
    // return ElevatedButton.icon(
    //   onPressed: () { },
    //   icon: const Icon(Icons.download),
    //   label: const Text('Download CV'),
    // );
    return ButtonShapeWidget(
      isDownloaded: _isdownloaded,
      isDownloading: _isDownloading,
      isFeching: _isFeching,
      transitionDuration: transitionDuration,
    );
  }
}

class ButtonShapeWidget extends StatelessWidget {
  const ButtonShapeWidget({
    Key? key,
    required this.isDownloading,
    required this.isDownloaded,
    required this.isFeching,
    required this.transitionDuration,
  }) : super(key: key);

  final bool isDownloading;
  final bool isDownloaded;
  final bool isFeching;
  final Duration transitionDuration;
  @override
  Widget build(BuildContext context) {
    final ShapeDecoration shape;

    if (isDownloading || isFeching) {
      shape = const ShapeDecoration(shape: CircleBorder(), color: Colors.transparent);
    } else {
      shape = const ShapeDecoration(shape: StadiumBorder(), color: Colors.lightBlue);
    }

    return AnimatedContainer(
      duration: transitionDuration,
      curve: Curves.ease,
      width: double.infinity,
      decoration: shape,
      child: SizedBox(),
    );
  }
}
