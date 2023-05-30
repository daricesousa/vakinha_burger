import 'dart:developer';
import 'package:vakinha_burger/app/core/exceptions/user_not_found_exception.dart';
import 'package:vakinha_burger/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burger/app/models/user_model.dart';
import 'package:vakinha_burger/app/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post('/users', {
      'name': name,
      'email': email,
      'password': password,
    });
    if (result.hasError) {
      var message = "Erro ao realizar cadastro";
      if (result.statusCode == 400) {
        message = result.body['error'];
      }
      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(message);
    }
    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post('/auth', {
      'email': email,
      'password': password,
    });

    var message = "Erro ao autenticar o usuário";
    if (result.hasError) {
      if (result.statusCode == 403) {
        message = "Usuário ou senha inválidos";
        log(message, error: result.statusText, stackTrace: StackTrace.current);
        throw UserNotFoundException();
      }
      log("$message + (${result.statusCode})",
          error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException(message);
    }

    final token = result.body["access_token"];
    _restClient.setToken(token);
    return await user(email);
  }

  @override
  Future<UserModel> user(String email) async {
    final res = await _restClient.get<List<dynamic>>(
      '/users',
      query: {"email": email},
    );
    if (res.hasError) {
      log("Erro ao buscar usuário + (${res.statusCode})",
          error: res.statusText, stackTrace: StackTrace.current);
      throw RestClientException("Erro interno");
    }
    if (res.body!.isNotEmpty) {
      return UserModel.fromMap(res.body![0]);
    } else {
      log("Erro ao buscar usuário");
      throw RestClientException("Erro interno");
    }
  }
}
