import 'dart:ui';

import 'package:food_order/widgets/player/toggle.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({this.iconSize = 20, this.fontSize = 12});
  final double iconSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlickShowControlsAction(
          child: FlickSeekVideoAction(
            child: Center(
              child: FlickVideoBuffer(
                child: FlickAutoHideChild(
                  showIfVideoNotInitialized: false,
                  child: PlayToggle(),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: FlickAutoHideChild(
            child: Column(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white12,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlickPlayToggle(
                          size: 16,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        FlickCurrentPosition(
                          fontSize: fontSize,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            child: FlickVideoProgressBar(
                              flickProgressBarSettings:
                                  FlickProgressBarSettings(
                                height: 10,
                                handleRadius: 6,
                                handleColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 8,
                                ),
                                getPlayedPaint: ({
                                  double? handleRadius,
                                  double? height,
                                  double? playedPart,
                                  double? width,
                                }) {
                                  return Paint()
                                    ..shader = LinearGradient(colors: [
                                      Color.fromRGBO(255, 172, 113, 1),
                                      Color.fromRGBO(255, 132, 80, 1),
                                    ], stops: [
                                      0.0,
                                      0.3
                                    ]).createShader(
                                      Rect.fromPoints(
                                        Offset(0, 0),
                                        Offset(width!, 0),
                                      ),
                                    );
                                },
                              ),
                            ),
                          ),
                        ),
                        FlickTotalDuration(
                          fontSize: fontSize,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FlickSoundToggle(
                          size: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.hd,
                          size: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FlickFullScreenToggle(
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
