import 'package:bloc_tutorial/bloc/favourite/favourite_bloc.dart';
import 'package:bloc_tutorial/repository/favourite_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/counter/counter_bloc.dart';
import 'bloc/image_picker/image_picker_bloc.dart';
import 'bloc/switch/switch_bloc.dart';
import 'bloc/to_do/to_do_bloc.dart';
import 'utils/image_picker_utils.dart';
import 'ui/app_colors.dart';
import 'ui/main_screen.dart';
import 'bloc/article_list/article_list_bloc.dart';
import 'bloc_provider/bloc_provider.dart';

void main() {
  runApp(const ArticleFinder());
}

class ArticleFinder extends StatelessWidget {
  const ArticleFinder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w700BitterFont = GoogleFonts.bitter(fontWeight: FontWeight.w700);

    return BlocProviders<ArticleListBloc>(
      bloc: ArticleListBloc(), // ✅ your custom bloc provider
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => SwitchBloc()),
          BlocProvider(create: (_) => ImagePickerBloc(imagePickerUtils: ImagePickerUtils())),
          BlocProvider(create: (_) => ToDoBloc()),
          BlocProvider(create: (_) => FavouriteBloc(favouriteRepository: FavouriteRepository()))
        ],
        child: MaterialApp(
          title: 'RW Finder',
          home: const MainScreen(),
          theme: ThemeData(
            primarySwatch: AppColors.black,
            primaryColor: AppColors.black,
            colorScheme: Theme.of(context).colorScheme.copyWith(
              secondary: AppColors.green,
              primary: AppColors.black,
            ),
            scaffoldBackgroundColor: AppColors.grey,
            primaryTextTheme: TextTheme(
              titleLarge: w700BitterFont,
            ),
            textTheme: TextTheme(
              titleMedium: w700BitterFont.apply(color: AppColors.black),
              titleLarge: w700BitterFont.apply(color: AppColors.black),
              bodyMedium: TextStyle(color: AppColors.black),
            ),
          ),
        ),
      ),
    );
  }
}
