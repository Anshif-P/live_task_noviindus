import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:noviindus_live_task_/src/features/show_video/model/feed_model.dart';
import 'package:noviindus_live_task_/src/util/app_url/app_url.dart';
import 'package:noviindus_live_task_/src/util/constance/colors.dart';
import 'package:noviindus_live_task_/src/util/constance/text_style.dart';
import 'package:shimmer/shimmer.dart';

class AllCategories extends StatefulWidget {
  final List<FeedModel> feedList;

  AllCategories({Key? key, required this.feedList}) : super(key: key);

  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    // Initialize video player and chewie controller
    _videoPlayerController = VideoPlayerController.network('');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoInitialize: true,
      looping: true,
      autoPlay: false,
      allowFullScreen: true,
      allowMuting: false,
    );
  }

  @override
  void dispose() {
    // Dispose video player and chewie controller
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.feedList.length,
      separatorBuilder: (context, index) => SizedBox(height: 15),
      itemBuilder: (context, index) {
        final data = widget.feedList[index];
        return Container(
          height: 520,
          width: double.maxFinite,
          color: AppColor.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 15),
                    ClipOval(
                      child: _buildCachedNetworkImage(
                          Urls().url + (data.image ?? "")),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.user?.name ?? '',
                          style: AppText.defaultLight,
                        ),
                        Text(
                          data.createdAt.toString(),
                          style: AppText.smallGrey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                flex: 8,
                child: _buildVideoPlayer(data.video ?? ''),
              ),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(10),
                color: AppColor.backgroundColor,
                child: Text(
                  data.description ?? '',
                  style: AppText.smallGrey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCachedNetworkImage(String imageUrl) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: 50,
      height: 50,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: AppColor.extraLightGrey,
        highlightColor: Colors.white,
        child: Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.extraLightGrey, // Placeholder color
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey, // Placeholder color
        ),
        child: const Icon(Icons.error),
      ),
    );
  }

  Widget _buildVideoPlayer(String videoUrl) {
    _videoPlayerController =
        VideoPlayerController.network(Urls().url + videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoInitialize: true,
      looping: true,
      autoPlay: false,
      allowFullScreen: true,
      allowMuting: false,
    );

    return Chewie(controller: _chewieController);
  }
}
