import 'package:bloc_tutorial/bloc/favourite/favourite_bloc.dart';
import 'package:bloc_tutorial/ui/article_list_screen.dart';
import 'package:bloc_tutorial/ui/counter_screen.dart';
import 'package:bloc_tutorial/ui/favourite_screen.dart';
import 'package:bloc_tutorial/ui/image_picker_screen.dart';
import 'package:bloc_tutorial/ui/switch_screen.dart';
import 'package:bloc_tutorial/ui/to_do_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/image_picker/image_picker_bloc.dart';
import '../utils/image_picker_utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Menu")),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity, // 👈 takes full width
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CounterScreen()),
                  ),
                  child: const Text('Move To Counter Screen'),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity, // 👈 takes full width
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SwitchScreen()),
                  ),
                  child: const Text('Move To Switcher Screen'),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity, // 👈 takes full width
                child: // In your MainScreen
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider(
                          create: (_) => ImagePickerBloc(imagePickerUtils: ImagePickerUtils()),
                          child: const ImagePickerScreen(),
                        ),
                      ),
                    );
                  },
                  child: Text("Go to Image Picker"),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity, // 👈 takes full width
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ToDoScreen()),
                  ),
                  child: const Text('Move To To Do Screen'),
                ),
              ),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity, // 👈 takes full width
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ArticleListScreen()),
                  ),
                  child: const Text('Move To Article List Screen'),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity, // 👈 takes full width
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FavouriteScreen()),
                  ),
                  child: const Text('Move To Favourite List Screen'),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
