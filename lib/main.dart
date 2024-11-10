import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_feed/config/theme/app_theme.dart';
import 'package:news_feed/features/daily_news/presentation/bloc/article/remote/remote_articles_bloc.dart';
import 'package:news_feed/features/daily_news/presentation/bloc/article/remote/remote_articles_event.dart';
import 'package:news_feed/features/daily_news/presentation/pages/daily_news.dart';
import 'package:news_feed/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => s1()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
