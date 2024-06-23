// import 'package:bookly/Core/utils/api_serves.dart';
// import 'package:bookly/Featuers/home/data/repos/home_repo_impl.dart';
// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';

// final getIt = GetIt.instance;

// void setupServiceLocator() {
//   getIt.registerSingleton<ApiService>(
//     ApiService(
//       Dio(),
//     ),
//   );
//   getIt.registerSingleton<HomeRepoImpl>(
//     HomeRepoImpl(
//       getIt.get<ApiService>(),
//     ),
//   );
// }
import 'package:bookly/Core/utils/api_serves.dart';
import 'package:bookly/Featuers/home/Data/data_source/home_local_data_source.dart';
import 'package:bookly/Featuers/home/Data/data_source/home_remote_data_source.dart';
import 'package:bookly/Featuers/home/repo/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  );
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}

class HomeRemote {}
