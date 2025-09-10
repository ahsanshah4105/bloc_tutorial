import 'package:bloc_tutorial/ui/counter_screen.dart';
import 'package:bloc_tutorial/ui/main_screen.dart';
import 'package:flutter/material.dart';

import '../bloc/article_list_bloc.dart';
import '../bloc_provider/bloc_provider.dart';
import '../data/article.dart';
import 'article_list_item.dart';
class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProviders.of<ArticleListBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("Articles"),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainScreen()),
              );
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search...',
              ),
              onChanged: bloc.searchQuery.add,
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Article>?>(
              stream: bloc.articleStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No articles found"));
                }
                return _buildSearchResults(snapshot.data!);
              },
            )
            ,
          ),

        ],
      ),
    );
  }

  Widget _buildSearchResults(List<Article> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final article = results[index];
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ArticleListItem(article: article),
          ),
          onTap: () {
            // TODO: Handle navigation
          },
        );
      },
    );
  }
}
