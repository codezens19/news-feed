import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_feed/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticlesState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

class RemoteArticleDone extends RemoteArticlesState {
  const RemoteArticleDone(List<ArticleEntity> articles)
      : super(articles: articles);
}

class RemoteArticleFailed extends RemoteArticlesState {
  const RemoteArticleFailed(DioException error) : super(error: error);
}
