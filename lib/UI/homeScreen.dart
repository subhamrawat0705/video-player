import 'package:demo/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller;
  ValueNotifier<int> currentSongIndex = ValueNotifier(0);
  List<String> songList = [
    K.jadooHiLageZindagi,
    K.kallastar,
    K.mainePeeRakhiHai,
    K.terePyaarMein,
    K.whoKnows,
    K.kallastar,
    K.zindabanda,
    K.chaleya,
    K.jeenilagda,
    K.tuashiquihai,
  ];
  List<String> songNameList = [
    "Jadoo Hi Lage Zindagi",
    "Kallastar Teaser (Yo Yo Honey Singh)",
    "Maine Pee Rakhi Hai",
    "Tere Pyaar Mein",
    "Who Knows",
    "Chaleya",
    "Zinda banda",
    "Jee ni lagda",
    "kallastar",
    "Tu ashiqui hai",
  ];
  ValueNotifier<bool> isPause = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    changeVideo();
  }

  changeVideo() {
    _controller = VideoPlayerController.asset(songList[currentSongIndex.value]);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(_controller.value.isCompleted){
      isPause.value = true;
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Video Player",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
            ),
          ),
          // centerTitle: true,
          backgroundColor: K.primary,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: K.primary.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(
                              _controller,
                            ),
                            // _ControlsOverlay(controller: _controller),
                            VideoProgressIndicator(_controller,
                                allowScrubbing: true),

                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {
                                print("WTF: ${currentSongIndex.value}");
                                isPause.value = false;
                                currentSongIndex.value > 0
                                    ? currentSongIndex.value--
                                    : currentSongIndex.value = 9;
                                changeVideo();
                                print("WTF: ${currentSongIndex.value}");
                              },
                              icon: const Icon(
                                Icons.skip_previous,
                                size: 28,
                              )),
                          IconButton(
                            onPressed: () {
                              isPause.value = !isPause.value;
                              if (isPause.value) {
                                _controller.pause();
                              } else {
                                _controller.play();
                              }
                            },
                            icon: ValueListenableBuilder(
                              valueListenable: isPause,
                              builder: (context, bool pause, child) {
                                if (pause) {
                                  return const Icon(
                                    Icons.play_arrow,
                                    size: 34,
                                  );
                                }
                                return const Icon(
                                  Icons.pause,
                                  size: 34,
                                );
                              },
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                print("WTF: ${currentSongIndex.value}");
                                isPause.value = false;
                                currentSongIndex.value < 9
                                    ? currentSongIndex.value++
                                    : currentSongIndex.value = 0;
                                changeVideo();
                                print("WTF: ${currentSongIndex.value}");
                              },
                              icon: const Icon(
                                Icons.skip_next,
                                size: 28,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "PLAYLIST:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    itemCount: songNameList.length,

                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          isPause.value = false;
                          if (index == 0) {
                            currentSongIndex.value = index;
                            changeVideo();
                          }
                          if (index == 1) {
                            currentSongIndex.value = index;
                            changeVideo();
                          }
                          if (index == 2) {
                            currentSongIndex.value = index;
                            changeVideo();
                          }
                          if (index == 3) {
                            currentSongIndex.value = index;
                            changeVideo();
                          }
                          if (index == 4) {
                            currentSongIndex.value = index;
                            changeVideo();
                          }
                          if (index == 5) {
                            currentSongIndex.value = index;
                            changeVideo();
                          }
                          if (index == 6) {
                            currentSongIndex.value = index;
                            changeVideo();
                          }
                          if (index == 7) {
                            currentSongIndex.value = index;
                            changeVideo();
                          }
                          if (index == 8) {
                            currentSongIndex.value = index;
                            changeVideo();
                          }
                          if (index == 9) {
                            currentSongIndex.value = index;
                            changeVideo();
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentSongIndex.value == index
                                ? K.secondary.withOpacity(0.8)
                                : K.primary.withOpacity(0.4),
                          ),
                          child: Text(
                            songNameList[index],
                            style: TextStyle(
                              fontSize: 16,
                              color: currentSongIndex.value == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
