import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otus_food/providers/favorit_data_provider.dart';
import 'package:otus_food/providers/ingredient_refrigerator_provider.dart';
import 'package:otus_food/screens/auth/auth.dart';
import 'package:otus_food/screens/auth/auth_reg.dart';
import 'package:otus_food/screens/main_page/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'utils/init_hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  hive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IngredientRefrigerator(),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => FavoriteData(),
        ),
      ],
      child: MaterialApp(
        theme: Theme.of(context)
            .copyWith(scaffoldBackgroundColor: const Color(0xFDCECEC6)),
        //  chipTheme: const ChipThemeData(backgroundColor: Color(0xFDCECEC6))),
        //Theme.of(context).copyWith(bottomNavigationBarTheme: Color(0xff2ECC71))
        //home: ListRecipes(),
        //initialRoute: '/',
        routes: {
          '/': (context) => const BottomNavigationBarWidget(),
          // '/infoRecipes': (context) => InfoRecipes(index),
          '/log_in': (context) => const AuthWidget(),
          '/log_reg': (context) => const AuthRegistration(),
        },
      ),
    );
  }
}
