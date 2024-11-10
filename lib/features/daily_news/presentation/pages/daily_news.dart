import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_feed/features/daily_news/presentation/bloc/article/remote/remote_articles_bloc.dart';
import 'package:news_feed/features/daily_news/presentation/bloc/article/remote/remote_articles_state.dart';
import 'package:news_feed/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text('Daily News'),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
      builder: (_, state) {
        if (state is RemoteArticlesLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticleDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ArticleTile(
                article: state.articles![index]
              );
            },
            itemCount: state.articles!.length,
          );
        }

        return const SizedBox();
      },
    );
  }
}
