import 'package:clean_arch_bookly_app/core/network/api_service.dart';
import 'package:clean_arch_bookly_app/features/details/data/data_sources/details_remote_data_source.dart';
import 'package:clean_arch_bookly_app/features/details/data/repos/details_repo_imp.dart';
import 'package:clean_arch_bookly_app/features/details/domain/repos/details_repo.dart';
import 'package:clean_arch_bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:clean_arch_bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:clean_arch_bookly_app/features/home/data/repos/home_repo_imp.dart';
import 'package:clean_arch_bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImp(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );
  getIt.registerSingleton<DetailsRepo>(
    DetailsRepoImp(
      detailsRemoteDataSource: DetailsRemoteDataSourceImp(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );
}
