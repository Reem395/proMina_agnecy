import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_agency/cubits/auth_cubit/auth_cubit.dart';
import 'package:promina_agency/cubits/gallery_cubit/gallery_cubit.dart';
import 'package:sizer/sizer.dart';

import 'cubits/bloc_observer.dart';
import 'data_providers/local/cache_helper.dart';
import 'router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => GalleryCubit(),
        )
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // home: HomeScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
            theme: ThemeData(
                // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                // useMaterial3: true,
                fontFamily: 'Segoe'),
          );
        },
      ),
    );
  }
}
