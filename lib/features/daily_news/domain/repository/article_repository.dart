import 'package:news_feed/core/resources/data_state.dart';
import 'package:news_feed/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> deleteArticle(ArticleEntity article);
}
