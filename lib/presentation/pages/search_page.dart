import 'package:bioskop_keren/common/constants.dart';
import 'package:bioskop_keren/common/state_enum.dart';
import 'package:bioskop_keren/presentation/provider/movie_search_notifier.dart';
import 'package:bioskop_keren/presentation/provider/tv_search_notifier.dart';
import 'package:bioskop_keren/presentation/widgets/movie_card_list.dart';
import 'package:bioskop_keren/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  static const ROUTE_NAME = '/search';

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // Initial Selected Value
  String selectedType = 'Movie';

  // List of items in our dropdown menu
  var items = [
    'Movie',
    'TV',
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchBar(),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            _listItem(),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DropdownButton(
          value: selectedType,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedType = newValue!;
            });
            if (selectedType == items[0]) {
              Provider.of<MovieSearchNotifier>(context, listen: false)
                  .fetchMovieSearch(_searchController.text);
            } else {
              Provider.of<TvSearchNotifier>(context, listen: false)
                  .fetchTvSearch(_searchController.text);
            }
          },
        ),
        const SizedBox(
          width: 12,
        ),
        Flexible(
          flex: 1,
          child: TextField(
            controller: _searchController,
            onSubmitted: (query) {
              if (selectedType == items[0]) {
                Provider.of<MovieSearchNotifier>(context, listen: false)
                    .fetchMovieSearch(query);
              } else {
                Provider.of<TvSearchNotifier>(context, listen: false)
                    .fetchTvSearch(query);
              }
            },
            decoration: const InputDecoration(
              hintText: 'Search title',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              // constraints: BoxConstraints.tightFor(
              //   width: 300,
              // ),
            ),
            textInputAction: TextInputAction.search,
          ),
        ),
      ],
    );
  }

  Widget _listItem() {
    if (selectedType == items[0]) {
      return Consumer<MovieSearchNotifier>(
        builder: (context, data, child) {
          if (data.state == RequestState.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (data.state == RequestState.Loaded) {
            final result = data.searchResult;
            return Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final movie = data.searchResult[index];
                  return MovieCard(movie);
                },
                itemCount: result.length,
              ),
            );
          } else {
            return Expanded(
              child: Container(),
            );
          }
        },
      );
    } else {
      return Consumer<TvSearchNotifier>(
        builder: (context, data, child) {
          if (data.state == RequestState.Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (data.state == RequestState.Loaded) {
            final result = data.searchResult;
            return Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final tv = data.searchResult[index];
                  return TvCard(tv);
                },
                itemCount: result.length,
              ),
            );
          } else {
            return Expanded(
              child: Container(),
            );
          }
        },
      );
    }
  }
}
