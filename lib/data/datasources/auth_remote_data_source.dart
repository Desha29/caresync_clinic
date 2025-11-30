import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String name, String email, String password, String role);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
    return const UserModel(
      id: '1',
      email: 'test@example.com',
      name: 'Test User',
      role: 'patient',
    );
  }

  @override
  Future<UserModel> register(String name, String email, String password, String role) async {
    // Mock implementation
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      id: '2',
      email: email,
      name: name,
      role: role,
    );
  }
}
