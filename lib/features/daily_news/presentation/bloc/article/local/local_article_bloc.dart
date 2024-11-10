import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_feed/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_feed/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_feed/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

import '../../../../domain/usecases/delete_article.dart';
import '../../../../domain/usecases/save_article.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final DeleteArticleUseCase _deleteArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._deleteArticleUseCase,
  ) : super(const LocalArticlesLoading()) {
    on<GetSavedArticles>(onGetSavedArticles);
    on<DeleteArticle>(onDeleteArticle);
    on<SaveArticle>(onSaveArticle);
  }

  void onGetSavedArticles(
    GetSavedArticles event,
    Emitter<LocalArticleState> emit,
  ) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onDeleteArticle(
    DeleteArticle deleteArticle,
    Emitter<LocalArticleState> emit,
  ) async {
    await _deleteArticleUseCase(params: deleteArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSaveArticle(
    SaveArticle saveArticle,
    Emitter<LocalArticleState> emit,
  ) async {
    await _saveArticleUseCase(params: saveArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }
}
