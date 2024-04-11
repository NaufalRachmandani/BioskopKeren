import 'package:bioskop_keren/presentation/style/text_style.dart';
import 'package:bioskop_keren/presentation/util/skeleton_loading.dart';
import 'package:bioskop_keren/presentation/util/tap_effect.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(
              context: context,
              colorScheme: colorScheme,
              onSearchClick: () {},
              onWatchlistClick: () {},
            ),
            const SizedBox(
              height: 14,
            ),
            _nowPlaying(colorScheme: colorScheme, onNowPlayingClick: () {}),
            const SizedBox(
              height: 14,
            ),
            _popular(colorScheme: colorScheme, onPopularClick: () {}),
            const SizedBox(
              height: 14,
            ),
            _topRated(colorScheme: colorScheme, onTopRatedClick: () {}),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _header({
    required BuildContext context,
    required ColorScheme colorScheme,
    required VoidCallback onSearchClick,
    required VoidCallback onWatchlistClick,
  }) {
    return Container(
      width: double.infinity,
      color: colorScheme.primary,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "BioskopKeren",
                style: appTitle(colorScheme: colorScheme),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: colorScheme.onPrimary,
                    size: 24,
                    semanticLabel: 'search',
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Icon(
                    Icons.watch_later,
                    color: colorScheme.onPrimary,
                    size: 24,
                    semanticLabel: 'search',
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _nowPlaying({
    required ColorScheme colorScheme,
    required VoidCallback onNowPlayingClick,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        child: Container(
          width: double.infinity,
          color: colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Now Playing",
                    style: headline1(colorScheme: colorScheme),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TapEffect(
                      onTap: () {},
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: colorScheme.onPrimary,
                        size: 24,
                        semanticLabel: 'now playing',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "TV",
                style: headline2(colorScheme: colorScheme),
              ),
              const SizedBox(
                height: 4,
              ),
              (true)
                  ? _nowPlayingTVList(colorScheme: colorScheme)
                  : _nowPlayingTVListShimmer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nowPlayingTVList({required ColorScheme colorScheme}) {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 12,
          );
        },
        itemBuilder: (context, index) {
          return _buildItemNowPlaying(
            colorScheme: colorScheme,
            onDetailClick: () {},
          );
        },
      ),
    );
  }

  Widget _buildItemNowPlaying({
    required ColorScheme colorScheme,
    required VoidCallback onDetailClick,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: TapEffect(
        onTap: () {
          onDetailClick();
        },
        child: Image.network(
          "https://picsum.photos/135/240",
          loadingBuilder: (
            BuildContext context,
            Widget child,
            ImageChunkEvent? loadingProgress,
          ) {
            if (loadingProgress == null) {
              return child;
            } else {
              return _itemTVImageShimmer();
            }
          },
          width: 135,
          height: 240,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _popular({
    required ColorScheme colorScheme,
    required VoidCallback onPopularClick,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        child: Container(
          width: double.infinity,
          color: colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: headline1(colorScheme: colorScheme),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TapEffect(
                      onTap: () {},
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: colorScheme.onPrimary,
                        size: 24,
                        semanticLabel: 'popular',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "TV",
                style: headline2(colorScheme: colorScheme),
              ),
              const SizedBox(
                height: 4,
              ),
              (true)
                  ? _nowPlayingTVList(colorScheme: colorScheme)
                  : _nowPlayingTVListShimmer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topRated({
    required ColorScheme colorScheme,
    required VoidCallback onTopRatedClick,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        child: Container(
          width: double.infinity,
          color: colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Rated",
                    style: headline1(colorScheme: colorScheme),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: TapEffect(
                      onTap: () {},
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: colorScheme.onPrimary,
                        size: 24,
                        semanticLabel: 'top rated',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "TV",
                style: headline2(colorScheme: colorScheme),
              ),
              const SizedBox(
                height: 4,
              ),
              (true)
                  ? _nowPlayingTVList(colorScheme: colorScheme)
                  : _nowPlayingTVListShimmer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nowPlayingTVListShimmer() {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 12,
          );
        },
        itemBuilder: (context, index) {
          return _buildItemNowPlayingShimmer();
        },
      ),
    );
  }

  Widget _buildItemNowPlayingShimmer() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: _itemTVImageShimmer(),
    );
  }

  Widget _itemTVImageShimmer() {
    return const SkeletonLoading(
      width: 135,
      height: 240,
      cornerRadius: 10,
    );
  }
}
