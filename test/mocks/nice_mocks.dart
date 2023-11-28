import 'package:flutter_learning_path/core/auth/auth_service.dart';
import 'package:flutter_learning_path/core/storage/storage_service.dart';
import 'package:flutter_learning_path/data/auth/auth_repository.dart';
import 'package:flutter_learning_path/data/work_out/work_out_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<AuthService>(),
  MockSpec<StorageService>(),
  MockSpec<AuthRepository>(),
  MockSpec<WorkOutRepository>(),
])
void main() {}
