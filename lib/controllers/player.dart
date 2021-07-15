import 'package:flick_video_player/flick_video_player.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class PlayerController extends GetxController {
  late FlickManager flickManager;
  final String videoLink;

  PlayerController(this.videoLink);
  @override
  void onInit() {
    super.onInit();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(videoLink),
    );
  }

  @override
  void onClose() {
    flickManager.dispose();
    super.onClose();
  }
}
