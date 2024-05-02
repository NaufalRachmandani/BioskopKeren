import 'package:core/presentation/widgets/movie_card_list.dart';
import 'package:core/presentation/widgets/tv_card_list.dart';
import 'package:core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/presentation/bloc/movie_search_bloc.dart';
import 'package:search/presentation/bloc/tv_search_bloc.dart';

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
              context
                  .read<MovieSearchBloc>()
                  .add(OnQueryChangedEvent(_searchController.text));
            } else {
              context
                  .read<TvSearchBloc>()
                  .add(TvOnQueryChangedEvent(_searchController.text));
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
                context.read<MovieSearchBloc>().add(OnQueryChangedEvent(query));
              } else {
                context.read<TvSearchBloc>().add(TvOnQueryChangedEvent(query));
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
      return BlocBuilder<MovieSearchBloc, MovieSearchState>(
        builder: (context, state) {
          if (state is SearchLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearchHasDataState) {
            final result = state.result;
            return Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final movie = result[index];
                  return MovieCard(movie);
                },
                itemCount: result.length,
              ),
            );
          } else if (state is SearchErrorState) {
            return Expanded(
              child: Center(
                child: Text(state.message),
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
      return BlocBuilder<TvSearchBloc, TvSearchState>(
        builder: (context, state) {
          if (state is TvSearchLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TvSearchHasDataState) {
            final result = state.result;
            return Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  final tv = result[index];
                  return TvCard(tv);
                },
                itemCount: result.length,
              ),
            );
          } else if (state is TvSearchErrorState) {
            return Expanded(
              child: Center(
                child: Text(state.message),
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
