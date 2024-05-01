import 'package:core/data/common/base_url.dart';
import 'package:core/domain/movie/entities/movie.dart';
import 'package:core/domain/tv/entities/tv.dart';
import 'package:core/presentation/pages/movie_detail_page.dart';
import 'package:core/presentation/pages/now_playing_movies_page.dart';
import 'package:core/presentation/pages/now_playing_tv_page.dart';
import 'package:core/presentation/pages/popular_movies_page.dart';
import 'package:core/presentation/pages/popular_tv_page.dart';
import 'package:core/presentation/pages/top_rated_movies_page.dart';
import 'package:core/presentation/pages/top_rated_tv_page.dart';
import 'package:core/presentation/pages/tv_detail_page.dart';
import 'package:core/presentation/pages/watchlist_movies_page.dart';
import 'package:core/presentation/pages/watchlist_tv_page.dart';
import 'package:core/presentation/provider/movie_list_notifier.dart';
import 'package:core/presentation/provider/tv_list_notifier.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/styles/text_styles.dart';
import 'package:core/utils/state_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:core/utils/routes.dart';

class HomeMoviePage extends StatefulWidget {
  @override
  _HomeMoviePageState createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<MovieListNotifier>(context, listen: false)
        ..fetchNowPlayingMovies()
        ..fetchPopularMovies()
        ..fetchTopRatedMovies(),
    );
    Future.microtask(
      () => Provider.of<TvListNotifier>(context, listen: false)
        ..getNowPlayingTvs()
        ..getPopularTvs()
        ..getTopRatedTvs(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('BioskopKeren'),
              accountEmail: Text('BioskopKeren@dicoding.com'),
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text('Movies & TV'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist Movie'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: const Icon(Icons.save_alt),
              title: const Text('Watchlist TV'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistTvPage.ROUTE_NAME);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, ABOUT_ROUTE);
              },
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('BioskopKeren'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SEARCH_ROUTE);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _nowPlaying(),
              const SizedBox(height: 24),
              _popular(),
              const SizedBox(height: 24),
              _topRated(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nowPlaying() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Now Playing',
          style: kHeading6,
        ),
        const SizedBox(height: 4),
        _buildSubHeading(
          title: 'Movies',
          onTap: () => Navigator.pushNamed(
            context,
            NowPlayingMoviesPage.ROUTE_NAME,
          ),
        ),
        Consumer<MovieListNotifier>(builder: (context, data, child) {
          final state = data.nowPlayingState;
          if (state == RequestState.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state == RequestState.Loaded) {
            return MovieList(data.nowPlayingMovies);
          } else {
            return const Text('Failed');
          }
        }),
        const SizedBox(height: 4),
        _buildSubHeading(
          title: 'TV',
          onTap: () => Navigator.pushNamed(
            context,
            NowPlayingTvPage.ROUTE_NAME,
          ),
        ),
        Consumer<TvListNotifier>(builder: (context, data, child) {
          final state = data.nowPlayingState;
          if (state == RequestState.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state == RequestState.Loaded) {
            return TvList(data.nowPlayingTvs);
          } else {
            return const Text('Failed');
          }
        }),
      ],
    );
  }

  Widget _popular() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular',
          style: kHeading6,
        ),
        const SizedBox(height: 4),
        _buildSubHeading(
          title: 'Movies',
          onTap: () => Navigator.pushNamed(
            context,
            PopularMoviesPage.ROUTE_NAME,
          ),
        ),
        Consumer<MovieListNotifier>(builder: (context, data, child) {
          final state = data.popularMoviesState;
          if (state == RequestState.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state == RequestState.Loaded) {
            return MovieList(data.popularMovies);
          } else {
            return const Text('Failed');
          }
        }),
        const SizedBox(height: 4),
        _buildSubHeading(
          title: 'TV',
          onTap: () => Navigator.pushNamed(
            context,
            PopularTvPage.ROUTE_NAME,
          ),
        ),
        Consumer<TvListNotifier>(builder: (context, data, child) {
          final state = data.popularTvsState;
          if (state == RequestState.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state == RequestState.Loaded) {
            return TvList(data.popularTvs);
          } else {
            return const Text('Failed');
          }
        }),
      ],
    );
  }

  Widget _topRated() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Rated',
          style: kHeading6,
        ),
        const SizedBox(height: 4),
        _buildSubHeading(
          title: 'Movies',
          onTap: () =>
              Navigator.pushNamed(context, TopRatedMoviesPage.ROUTE_NAME),
        ),
        Consumer<MovieListNotifier>(builder: (context, data, child) {
          final state = data.topRatedMoviesState;
          if (state == RequestState.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state == RequestState.Loaded) {
            return MovieList(data.topRatedMovies);
          } else {
            return const Text('Failed');
          }
        }),
        const SizedBox(height: 4),
        _buildSubHeading(
          title: 'TV',
          onTap: () => Navigator.pushNamed(context, TopRatedTvPage.ROUTE_NAME),
        ),
        Consumer<TvListNotifier>(builder: (context, data, child) {
          final state = data.topRatedTvsState;
          if (state == RequestState.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state == RequestState.Loaded) {
            return TvList(data.topRatedTvs);
          } else {
            return const Text('Failed');
          }
        }),
      ],
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: kSubtitle,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'See More',
                  style: kSubtitle,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}

class TvList extends StatelessWidget {
  final List<Tv> tvs;

  TvList(this.tvs);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tv = tvs[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvDetailPage.ROUTE_NAME,
                  arguments: tv.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tv.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvs.length,
      ),
    );
  }
}
