import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/app_colors.dart';
import 'data/datasources/auth_remote_data_source.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'presentation/cubit/auth/auth_cubit.dart';
import 'presentation/cubit/dashboard/dashboard_cubit.dart';
import 'presentation/pages/dashboard_page.dart';
import 'presentation/pages/login_page.dart';

void main() {
  runApp(const CareSyncApp());
}

class CareSyncApp extends StatelessWidget {
  const CareSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    final authDataSource = AuthRemoteDataSourceImpl();
    final authRepository = AuthRepositoryImpl(remoteDataSource: authDataSource);


    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(authRepository: authRepository),
        ),
        BlocProvider(
          create: (context) => DashboardCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'CareSync Clinic',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryBlue,
          scaffoldBackgroundColor: AppColors.lightGray,
          fontFamily: 'Inter',
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginPage(),
          '/dashboard': (context) => const DashboardPage(),
        },
      ),
    );
  }
}
