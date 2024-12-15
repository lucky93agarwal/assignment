import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:coding_assignment/controllers/login_controller.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import '../helpers/test_helper.mocks.dart';

void main() {
  late LoginController loginController;
  late MockPathProviderPlatform mockPathProvider;

  setUpAll(() async {
    mockPathProvider = MockPathProviderPlatform();
    PathProviderPlatform.instance = mockPathProvider;

    // Mock the directory response
    when(mockPathProvider.getApplicationDocumentsPath())
        .thenAnswer((_) async => 'mock_directory');

    await GetStorage.init();
  });

  setUp(() {
    loginController = LoginController();
  });

  test('Login fails with incorrect credentials', () {
    loginController.login('wrongNumber', 'wrongPassword');
    expect(Get.isSnackbarOpen, isTrue);
  });

  test('Logout clears storage and navigates to login', () {
    loginController.logout();
    expect(loginController.isLoggedIn, isFalse);
  });
}
