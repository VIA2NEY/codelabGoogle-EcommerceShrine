import 'package:e_commerce_app/backdrop.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/category_menu_page.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'supplemental/cut_corners_border.dart';
import 'package:e_commerce_app/colors.dart';

// TODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatefulWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  State<ShrineApp> createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {

  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        // TODO: Change to a Backdrop with a HomePage frontLayer (104)
        '/': (BuildContext context) => Backdrop(
          // TODO: Make currentCategory field take _currentCategory (104)
          currentCategory: _currentCategory,
          // TODO: Pass _currentCategory for frontLayer (104)
          frontLayer: HomePage(),
          // TODO: Change backLayer field value to CategoryMenuPage (104)
          backLayer: CategoryMenuPage(
            currentCategory: _currentCategory,
            onCategoryTap: _onCategoryTap,
          ),
          frontTitle: const Text('SHRINE'),
          backTitle: const Text('MENU'),
        ),
      },
      // Customize the theme
      theme: _kShrineTheme,
    );
  }
}

// Shrine Theme
final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
   final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kShrinePink100,
      onPrimary: kShrineBrown900,
      secondary: kShrineBrown900,
      error: kShrineErrorRed,
    ),
    textTheme: _buildShrineTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kShrinePink100,
    ),
    // scaffoldBackgroundColor: kShrineSurfaceWhite,
    inputDecorationTheme: const InputDecorationTheme(
      border: CutCornersBorder(),
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: /*kShrinePurple*/kShrineBrown900,
        ),
      ),
      floatingLabelStyle: TextStyle(
        color: /*kShrinePurple*/kShrineBrown900,
      ),
    ),

  );
}

// Build a Shrine Text Theme (103)
TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headlineSmall: base.headlineSmall!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        titleLarge: base.titleLarge!.copyWith(
          fontSize: 18.0,
        ),
        bodySmall: base.bodySmall!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyLarge: base.bodyLarge!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}