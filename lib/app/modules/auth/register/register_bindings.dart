import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger/app/modules/auth/register/register_controller.dart';
import 'package:vakinha_burger/app/repositories/auth/auth_repository.dart';
import 'package:vakinha_burger/app/repositories/auth/auth_repository_impl.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(restClient: Get.find<RestClient>()));
    Get.lazyPut(() => RegisterController(authRepository: Get.find()));
  }
}
