import 'package:bioskop_keren/common/constants.dart';
import 'package:bioskop_keren/common/utils.dart';
import 'package:bioskop_keren/presentation/pages/about_page.dart';
import 'package:bioskop_keren/presentation/pages/home_movie_page.dart';
import 'package:bioskop_keren/presentation/pages/movie_detail_page.dart';
import 'package:bioskop_keren/presentation/pages/now_playing_movies_page.dart';
import 'package:bioskop_keren/presentation/pages/now_playing_tv_page.dart';
import 'package:bioskop_keren/presentation/pages/popular_movies_page.dart';
import 'package:bioskop_keren/presentation/pages/popular_tv_page.dart';
import 'package:bioskop_keren/presentation/pages/search_page.dart';
import 'package:bioskop_keren/presentation/pages/top_rated_movies_page.dart';
import 'package:bioskop_keren/presentation/pages/top_rated_tv_page.dart';
import 'package:bioskop_keren/presentation/pages/tv_detail_page.dart';
import 'package:bioskop_keren/presentation/pages/watchlist_movies_page.dart';
import 'package:bioskop_keren/presentation/provider/movie_detail_notifier.dart';
import 'package:bioskop_keren/presentation/provider/movie_list_notifier.dart';
import 'package:bioskop_keren/presentation/provider/movie_search_notifier.dart';
import 'package:bioskop_keren/presentation/provider/now_playing_movies_notifier.dart';
import 'package:bioskop_keren/presentation/provider/now_playing_tv_notifier.dart';
import 'package:bioskop_keren/presentation/provider/popular_movies_notifier.dart';
import 'package:bioskop_keren/presentation/provider/popular_tv_notifier.dart';
import 'package:bioskop_keren/presentation/provider/top_rated_movies_notifier.dart';
import 'package:bioskop_keren/presentation/provider/top_rated_tv_notifier.dart';
import 'package:bioskop_keren/presentation/provider/tv_detail_notifier.dart';
import 'package:bioskop_keren/presentation/provider/tv_list_notifier.dart';
import 'package:bioskop_keren/presentation/provider/watchlist_movie_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'injection.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TvDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<MovieSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<NowPlayingMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<NowPlayingTvNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<TopRatedTvNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<PopularTvNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<WatchlistMovieNotifier>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case NowPlayingMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => NowPlayingMoviesPage());
            case NowPlayingTvPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => NowPlayingTvPage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case PopularTvPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularTvPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case TopRatedTvPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedTvPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case TvDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case WatchlistMoviesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistMoviesPage());
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
