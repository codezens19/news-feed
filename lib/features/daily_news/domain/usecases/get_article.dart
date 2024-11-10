import 'package:news_feed/core/resources/data_state.dart';
import 'package:news_feed/core/usecases/usecase.dart';
import 'package:news_feed/features/daily_news/domain/entities/article.dart';
import 'package:news_feed/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
