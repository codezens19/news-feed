import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_feed/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:news_feed/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_feed/features/daily_news/data/repository/article_repository.dart';
import 'package:news_feed/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_feed/features/daily_news/domain/usecases/delete_article.dart';
import 'package:news_feed/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_feed/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_feed/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_feed/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_feed/features/daily_news/presentation/bloc/article/remote/remote_articles_bloc.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  s1.registerSingleton<AppDatabase>(database);

  s1.registerSingleton<Dio>(Dio());
  s1.registerSingleton<NewsApiService>(NewsApiService((s1())));
  s1.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(s1(), s1()));
  s1.registerSingleton<GetArticleUseCase>(GetArticleUseCase(s1()));
  s1.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(s1()));
  s1.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(s1()));
  s1.registerSingleton<DeleteArticleUseCase>(DeleteArticleUseCase(s1()));
  s1.registerSingleton<RemoteArticlesBloc>(RemoteArticlesBloc(s1()));
  s1.registerSingleton<LocalArticleBloc>(LocalArticleBloc(s1(), s1(), s1()));
}
