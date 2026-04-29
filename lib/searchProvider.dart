import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider =
    StateNotifierProvider<SearchNotifier, SearchState>((ref) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(search: " ",isChanged: false));

  void search(String query) {
    state = state.copyWith(search: query);
  }
  void onChanged(bool isChanged) {
    state = state.copyWith(isChanged: isChanged);
  }
}

class SearchState {
  final String search;
  final bool isChanged;
  SearchState({required this.search, required this.isChanged});

  SearchState copyWith({String? search, bool? isChanged}) {
    return SearchState(
        search: search ?? this.search,
       isChanged: isChanged ?? this.isChanged);
  }
}
