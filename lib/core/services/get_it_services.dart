import 'package:fruits_hub/core/repos/productsrepos/product_repos.dart';
import 'package:fruits_hub/core/repos/productsrepos/product_repos_impl.dart';
import 'package:fruits_hub/core/services/data_services.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/services/firestore_services.dart';
import 'package:fruits_hub/features/auth/data/repo/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';
final getIt=GetIt.instance;
void setUp(){
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
    getIt.registerSingleton<DataServices>(FirestoreServices());

  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    dataServices: getIt<DataServices>(),
    firebaseAuthService:getIt<FirebaseAuthService>() ));
    getIt.registerSingleton<ProductRepos>(ProductReposImpl(
     getIt<DataServices>(),
    ));
}