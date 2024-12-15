// Mocks generated by Mockito 5.4.4 from annotations
// in coding_assignment/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart'
    as _i2;
import 'package:path_provider_platform_interface/src/enums.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [PathProviderPlatform].
///
/// See the documentation for Mockito's code generation for more information.
class MockPathProviderPlatform extends _i1.Mock
    implements _i2.PathProviderPlatform {
  @override
  _i3.Future<String?> getTemporaryPath() => (super.noSuchMethod(
        Invocation.method(
          #getTemporaryPath,
          [],
        ),
        returnValue: _i3.Future<String?>.value(),
        returnValueForMissingStub: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);

  @override
  _i3.Future<String?> getApplicationSupportPath() => (super.noSuchMethod(
        Invocation.method(
          #getApplicationSupportPath,
          [],
        ),
        returnValue: _i3.Future<String?>.value(),
        returnValueForMissingStub: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);

  @override
  _i3.Future<String?> getLibraryPath() => (super.noSuchMethod(
        Invocation.method(
          #getLibraryPath,
          [],
        ),
        returnValue: _i3.Future<String?>.value(),
        returnValueForMissingStub: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);

  @override
  _i3.Future<String?> getApplicationDocumentsPath() => (super.noSuchMethod(
        Invocation.method(
          #getApplicationDocumentsPath,
          [],
        ),
        returnValue: _i3.Future<String?>.value(),
        returnValueForMissingStub: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);

  @override
  _i3.Future<String?> getApplicationCachePath() => (super.noSuchMethod(
        Invocation.method(
          #getApplicationCachePath,
          [],
        ),
        returnValue: _i3.Future<String?>.value(),
        returnValueForMissingStub: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);

  @override
  _i3.Future<String?> getExternalStoragePath() => (super.noSuchMethod(
        Invocation.method(
          #getExternalStoragePath,
          [],
        ),
        returnValue: _i3.Future<String?>.value(),
        returnValueForMissingStub: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);

  @override
  _i3.Future<List<String>?> getExternalCachePaths() => (super.noSuchMethod(
        Invocation.method(
          #getExternalCachePaths,
          [],
        ),
        returnValue: _i3.Future<List<String>?>.value(),
        returnValueForMissingStub: _i3.Future<List<String>?>.value(),
      ) as _i3.Future<List<String>?>);

  @override
  _i3.Future<List<String>?> getExternalStoragePaths(
          {_i4.StorageDirectory? type}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getExternalStoragePaths,
          [],
          {#type: type},
        ),
        returnValue: _i3.Future<List<String>?>.value(),
        returnValueForMissingStub: _i3.Future<List<String>?>.value(),
      ) as _i3.Future<List<String>?>);

  @override
  _i3.Future<String?> getDownloadsPath() => (super.noSuchMethod(
        Invocation.method(
          #getDownloadsPath,
          [],
        ),
        returnValue: _i3.Future<String?>.value(),
        returnValueForMissingStub: _i3.Future<String?>.value(),
      ) as _i3.Future<String?>);
}