import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_hub/core/helper/ongenerate_routes.dart';
import 'package:fruits_hub/core/services/custom_bloc_observer.dart';
import 'package:fruits_hub/core/services/get_it_services.dart';
import 'package:fruits_hub/core/services/shared_preferences_singelton.dart';
import 'package:fruits_hub/features/splash/presentation/views/splash_views.dart';
import 'package:fruits_hub/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Prefs.init();
  setUp();
  Bloc.observer = CustomBlocObserver();
  runApp(FruitsHub());
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale("ar"),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: OnGenerateRoute,
      initialRoute: SplashViews.routeName,
    );
  }
}
