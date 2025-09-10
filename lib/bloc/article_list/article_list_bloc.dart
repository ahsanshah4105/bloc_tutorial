import 'dart:async';

import 'package:bloc_tutorial/data/rw_client.dart';
import '../../model/article.dart';
import 'bloc.dart';

class ArticleListBloc implements Bloc {
  final _client = RWClient();
  final searchQueryController = StreamController<String?>();

  Sink<String?> get searchQuery => searchQueryController.sink;

  late Stream<List<Article>?> articleStream;

  ArticleListBloc() {
    articleStream = searchQueryController.stream.asyncMap((query) => _client.fetchArticles(query));
    searchQueryController.add('');
  }

  @override
  void dispose() {
    searchQueryController.close();
  }
}