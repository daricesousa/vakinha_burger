import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/mixins/loader_mixin.dart';
import 'package:vakinha_burger/app/core/mixins/messages_mixin.dart';
import 'package:vakinha_burger/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger/app/repositories/auth/auth_repository.dart';

class RegisterController extends GetxController
    with LoaderMixin, MessagesMixin {
  final AuthRepository _authRepository;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  RegisterController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  Future<void> register(
      {required String name,
      required String email,
      required String password}) async {
    _loading.toggle();
    try {
      await _authRepository.register(name, email, password);
      _loading.toggle();
      Get.back();
      _message(
        MessageModel(
          title: "Sucesso",
          message: "Usuário cadastrado com sucesso",
          type: MessageType.info,
        ),
      );
    } on RestClientException catch (e) {
      _loading.toggle();
      _message(MessageModel(
        title: "Erro",
        message: e.message ?? '',
        type: MessageType.error,
      ));
    } catch (e) {
      _loading.toggle();
      _message(MessageModel(
        title: "Erro",
        message: "Erro ao registrar usuário",
        type: MessageType.error,
      ));
    }
  }
}
