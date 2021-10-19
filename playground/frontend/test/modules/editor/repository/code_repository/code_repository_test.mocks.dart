// Mocks generated by Mockito 5.0.16 from annotations
// in playground/test/modules/editor/repository/code_repository/code_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:playground/modules/editor/repository/code_repository/code_client/check_status_response.dart'
    as _i3;
import 'package:playground/modules/editor/repository/code_repository/code_client/code_client.dart'
    as _i5;
import 'package:playground/modules/editor/repository/code_repository/code_client/output_response.dart'
    as _i4;
import 'package:playground/modules/editor/repository/code_repository/code_client/run_code_response.dart'
    as _i2;
import 'package:playground/modules/editor/repository/code_repository/run_code_request.dart'
    as _i7;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeRunCodeResponse_0 extends _i1.Fake implements _i2.RunCodeResponse {}

class _FakeCheckStatusResponse_1 extends _i1.Fake
    implements _i3.CheckStatusResponse {}

class _FakeOutputResponse_2 extends _i1.Fake implements _i4.OutputResponse {}

/// A class which mocks [CodeClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockCodeClient extends _i1.Mock implements _i5.CodeClient {
  MockCodeClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.RunCodeResponse> runCode(_i7.RunCodeRequestWrapper? request) =>
      (super.noSuchMethod(Invocation.method(#runCode, [request]),
              returnValue:
                  Future<_i2.RunCodeResponse>.value(_FakeRunCodeResponse_0()))
          as _i6.Future<_i2.RunCodeResponse>);
  @override
  _i6.Future<_i3.CheckStatusResponse> checkStatus(String? pipelineUuid) =>
      (super.noSuchMethod(Invocation.method(#checkStatus, [pipelineUuid]),
              returnValue: Future<_i3.CheckStatusResponse>.value(
                  _FakeCheckStatusResponse_1()))
          as _i6.Future<_i3.CheckStatusResponse>);
  @override
  _i6.Future<_i4.OutputResponse> getCompileOutput(String? pipelineUuid) =>
      (super.noSuchMethod(Invocation.method(#getCompileOutput, [pipelineUuid]),
              returnValue:
                  Future<_i4.OutputResponse>.value(_FakeOutputResponse_2()))
          as _i6.Future<_i4.OutputResponse>);
  @override
  _i6.Future<_i4.OutputResponse> getRunOutput(String? pipelineUuid) =>
      (super.noSuchMethod(Invocation.method(#getRunOutput, [pipelineUuid]),
              returnValue:
                  Future<_i4.OutputResponse>.value(_FakeOutputResponse_2()))
          as _i6.Future<_i4.OutputResponse>);
  @override
  String toString() => super.toString();
}
