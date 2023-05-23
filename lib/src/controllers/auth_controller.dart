import 'package:bend_reality/src/repository/auth_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<bool> {
  final AuthRepo _repo;

  AuthController({
    required AuthRepo repo,
  }) : _repo = repo, super(false);

  void login() async {
    state = true;
    _repo.login();
    state = false;

  }

  void logout(){
    
  }
}