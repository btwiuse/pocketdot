// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.82.5.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';

import 'dart:ffi' as ffi;

abstract class SmoldotFlutter {
  Stream<LogEntry> initLogger({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kInitLoggerConstMeta;

  Future<void> initLightClient({dynamic hint});

  FlutterRustBridgeTaskConstMeta get kInitLightClientConstMeta;

  Future<void> startChainSync(
      {required String chainName,
      required String chainSpec,
      required String database,
      String? relayChain,
      dynamic hint});

  FlutterRustBridgeTaskConstMeta get kStartChainSyncConstMeta;

  Future<void> stopChainSync({required String chainName, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kStopChainSyncConstMeta;

  Future<void> sendJsonRpcRequest(
      {required String chainName, required String req, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kSendJsonRpcRequestConstMeta;

  Stream<String> listenJsonRpcResponses(
      {required String chainName, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kListenJsonRpcResponsesConstMeta;

  Future<Solutions> solveMethodNposMiner(
      {required NposMiner that, dynamic hint});

  FlutterRustBridgeTaskConstMeta get kSolveMethodNposMinerConstMeta;
}

class LogEntry {
  final int timeMillis;
  final int level;
  final String tag;
  final String msg;

  const LogEntry({
    required this.timeMillis,
    required this.level,
    required this.tag,
    required this.msg,
  });
}

class NposMiner {
  final SmoldotFlutter bridge;
  final String chain;
  final String method;
  final Uint8List snapshotBytes;
  final int round;
  final int desiredTargets;
  final int iterations;

  const NposMiner({
    required this.bridge,
    required this.chain,
    required this.method,
    required this.snapshotBytes,
    required this.round,
    required this.desiredTargets,
    required this.iterations,
  });

  Future<Solutions> solve({dynamic hint}) => bridge.solveMethodNposMiner(
        that: this,
      );
}

class Solutions {
  final Uint8List rawSolution;
  final Uint8List readySolution;

  const Solutions({
    required this.rawSolution,
    required this.readySolution,
  });
}

class SmoldotFlutterImpl implements SmoldotFlutter {
  final SmoldotFlutterPlatform _platform;
  factory SmoldotFlutterImpl(ExternalLibrary dylib) =>
      SmoldotFlutterImpl.raw(SmoldotFlutterPlatform(dylib));

  /// Only valid on web/WASM platforms.
  factory SmoldotFlutterImpl.wasm(FutureOr<WasmModule> module) =>
      SmoldotFlutterImpl(module as ExternalLibrary);
  SmoldotFlutterImpl.raw(this._platform);
  Stream<LogEntry> initLogger({dynamic hint}) {
    return _platform.executeStream(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_init_logger(port_),
      parseSuccessData: _wire2api_log_entry,
      parseErrorData: _wire2api_FrbAnyhowException,
      constMeta: kInitLoggerConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kInitLoggerConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "init_logger",
        argNames: [],
      );

  Future<void> initLightClient({dynamic hint}) {
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_init_light_client(port_),
      parseSuccessData: _wire2api_unit,
      parseErrorData: _wire2api_FrbAnyhowException,
      constMeta: kInitLightClientConstMeta,
      argValues: [],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kInitLightClientConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "init_light_client",
        argNames: [],
      );

  Future<void> startChainSync(
      {required String chainName,
      required String chainSpec,
      required String database,
      String? relayChain,
      dynamic hint}) {
    var arg0 = _platform.api2wire_String(chainName);
    var arg1 = _platform.api2wire_String(chainSpec);
    var arg2 = _platform.api2wire_String(database);
    var arg3 = _platform.api2wire_opt_String(relayChain);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_start_chain_sync(port_, arg0, arg1, arg2, arg3),
      parseSuccessData: _wire2api_unit,
      parseErrorData: _wire2api_FrbAnyhowException,
      constMeta: kStartChainSyncConstMeta,
      argValues: [chainName, chainSpec, database, relayChain],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kStartChainSyncConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "start_chain_sync",
        argNames: ["chainName", "chainSpec", "database", "relayChain"],
      );

  Future<void> stopChainSync({required String chainName, dynamic hint}) {
    var arg0 = _platform.api2wire_String(chainName);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_stop_chain_sync(port_, arg0),
      parseSuccessData: _wire2api_unit,
      parseErrorData: _wire2api_FrbAnyhowException,
      constMeta: kStopChainSyncConstMeta,
      argValues: [chainName],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kStopChainSyncConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "stop_chain_sync",
        argNames: ["chainName"],
      );

  Future<void> sendJsonRpcRequest(
      {required String chainName, required String req, dynamic hint}) {
    var arg0 = _platform.api2wire_String(chainName);
    var arg1 = _platform.api2wire_String(req);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_send_json_rpc_request(port_, arg0, arg1),
      parseSuccessData: _wire2api_unit,
      parseErrorData: _wire2api_FrbAnyhowException,
      constMeta: kSendJsonRpcRequestConstMeta,
      argValues: [chainName, req],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kSendJsonRpcRequestConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "send_json_rpc_request",
        argNames: ["chainName", "req"],
      );

  Stream<String> listenJsonRpcResponses(
      {required String chainName, dynamic hint}) {
    var arg0 = _platform.api2wire_String(chainName);
    return _platform.executeStream(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_listen_json_rpc_responses(port_, arg0),
      parseSuccessData: _wire2api_String,
      parseErrorData: _wire2api_FrbAnyhowException,
      constMeta: kListenJsonRpcResponsesConstMeta,
      argValues: [chainName],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kListenJsonRpcResponsesConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "listen_json_rpc_responses",
        argNames: ["chainName"],
      );

  Future<Solutions> solveMethodNposMiner(
      {required NposMiner that, dynamic hint}) {
    var arg0 = _platform.api2wire_box_autoadd_npos_miner(that);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_solve__method__NposMiner(port_, arg0),
      parseSuccessData: _wire2api_solutions,
      parseErrorData: _wire2api_FrbAnyhowException,
      constMeta: kSolveMethodNposMinerConstMeta,
      argValues: [that],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kSolveMethodNposMinerConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "solve__method__NposMiner",
        argNames: ["that"],
      );

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  FrbAnyhowException _wire2api_FrbAnyhowException(dynamic raw) {
    return FrbAnyhowException(raw as String);
  }

  String _wire2api_String(dynamic raw) {
    return raw as String;
  }

  int _wire2api_i32(dynamic raw) {
    return raw as int;
  }

  int _wire2api_i64(dynamic raw) {
    return castInt(raw);
  }

  LogEntry _wire2api_log_entry(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 4)
      throw Exception('unexpected arr length: expect 4 but see ${arr.length}');
    return LogEntry(
      timeMillis: _wire2api_i64(arr[0]),
      level: _wire2api_i32(arr[1]),
      tag: _wire2api_String(arr[2]),
      msg: _wire2api_String(arr[3]),
    );
  }

  Solutions _wire2api_solutions(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return Solutions(
      rawSolution: _wire2api_uint_8_list(arr[0]),
      readySolution: _wire2api_uint_8_list(arr[1]),
    );
  }

  int _wire2api_u8(dynamic raw) {
    return raw as int;
  }

  Uint8List _wire2api_uint_8_list(dynamic raw) {
    return raw as Uint8List;
  }

  void _wire2api_unit(dynamic raw) {
    return;
  }
}

// Section: api2wire

@protected
int api2wire_u32(int raw) {
  return raw;
}

@protected
int api2wire_u8(int raw) {
  return raw;
}

@protected
int api2wire_usize(int raw) {
  return raw;
}
// Section: finalizer

class SmoldotFlutterPlatform extends FlutterRustBridgeBase<SmoldotFlutterWire> {
  SmoldotFlutterPlatform(ffi.DynamicLibrary dylib)
      : super(SmoldotFlutterWire(dylib));

// Section: api2wire

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_String(String raw) {
    return api2wire_uint_8_list(utf8.encoder.convert(raw));
  }

  @protected
  ffi.Pointer<wire_NposMiner> api2wire_box_autoadd_npos_miner(NposMiner raw) {
    final ptr = inner.new_box_autoadd_npos_miner_0();
    _api_fill_to_wire_npos_miner(raw, ptr.ref);
    return ptr;
  }

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_opt_String(String? raw) {
    return raw == null ? ffi.nullptr : api2wire_String(raw);
  }

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_uint_8_list(Uint8List raw) {
    final ans = inner.new_uint_8_list_0(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }

// Section: finalizer

// Section: api_fill_to_wire

  void _api_fill_to_wire_box_autoadd_npos_miner(
      NposMiner apiObj, ffi.Pointer<wire_NposMiner> wireObj) {
    _api_fill_to_wire_npos_miner(apiObj, wireObj.ref);
  }

  void _api_fill_to_wire_npos_miner(NposMiner apiObj, wire_NposMiner wireObj) {
    wireObj.chain = api2wire_String(apiObj.chain);
    wireObj.method = api2wire_String(apiObj.method);
    wireObj.snapshot_bytes = api2wire_uint_8_list(apiObj.snapshotBytes);
    wireObj.round = api2wire_u32(apiObj.round);
    wireObj.desired_targets = api2wire_u32(apiObj.desiredTargets);
    wireObj.iterations = api2wire_usize(apiObj.iterations);
  }
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint

/// generated by flutter_rust_bridge
class SmoldotFlutterWire implements FlutterRustBridgeWireBase {
  @internal
  late final dartApi = DartApiDl(init_frb_dart_api_dl);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  SmoldotFlutterWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  SmoldotFlutterWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void store_dart_post_cobject(
    DartPostCObjectFnType ptr,
  ) {
    return _store_dart_post_cobject(
      ptr,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(DartPostCObjectFnType)>>(
          'store_dart_post_cobject');
  late final _store_dart_post_cobject = _store_dart_post_cobjectPtr
      .asFunction<void Function(DartPostCObjectFnType)>();

  Object get_dart_object(
    int ptr,
  ) {
    return _get_dart_object(
      ptr,
    );
  }

  late final _get_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Handle Function(ffi.UintPtr)>>(
          'get_dart_object');
  late final _get_dart_object =
      _get_dart_objectPtr.asFunction<Object Function(int)>();

  void drop_dart_object(
    int ptr,
  ) {
    return _drop_dart_object(
      ptr,
    );
  }

  late final _drop_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.UintPtr)>>(
          'drop_dart_object');
  late final _drop_dart_object =
      _drop_dart_objectPtr.asFunction<void Function(int)>();

  int new_dart_opaque(
    Object handle,
  ) {
    return _new_dart_opaque(
      handle,
    );
  }

  late final _new_dart_opaquePtr =
      _lookup<ffi.NativeFunction<ffi.UintPtr Function(ffi.Handle)>>(
          'new_dart_opaque');
  late final _new_dart_opaque =
      _new_dart_opaquePtr.asFunction<int Function(Object)>();

  int init_frb_dart_api_dl(
    ffi.Pointer<ffi.Void> obj,
  ) {
    return _init_frb_dart_api_dl(
      obj,
    );
  }

  late final _init_frb_dart_api_dlPtr =
      _lookup<ffi.NativeFunction<ffi.IntPtr Function(ffi.Pointer<ffi.Void>)>>(
          'init_frb_dart_api_dl');
  late final _init_frb_dart_api_dl = _init_frb_dart_api_dlPtr
      .asFunction<int Function(ffi.Pointer<ffi.Void>)>();

  void wire_init_logger(
    int port_,
  ) {
    return _wire_init_logger(
      port_,
    );
  }

  late final _wire_init_loggerPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_init_logger');
  late final _wire_init_logger =
      _wire_init_loggerPtr.asFunction<void Function(int)>();

  void wire_init_light_client(
    int port_,
  ) {
    return _wire_init_light_client(
      port_,
    );
  }

  late final _wire_init_light_clientPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int64)>>(
          'wire_init_light_client');
  late final _wire_init_light_client =
      _wire_init_light_clientPtr.asFunction<void Function(int)>();

  void wire_start_chain_sync(
    int port_,
    ffi.Pointer<wire_uint_8_list> chain_name,
    ffi.Pointer<wire_uint_8_list> chain_spec,
    ffi.Pointer<wire_uint_8_list> database,
    ffi.Pointer<wire_uint_8_list> relay_chain,
  ) {
    return _wire_start_chain_sync(
      port_,
      chain_name,
      chain_spec,
      database,
      relay_chain,
    );
  }

  late final _wire_start_chain_syncPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>)>>('wire_start_chain_sync');
  late final _wire_start_chain_sync = _wire_start_chain_syncPtr.asFunction<
      void Function(
          int,
          ffi.Pointer<wire_uint_8_list>,
          ffi.Pointer<wire_uint_8_list>,
          ffi.Pointer<wire_uint_8_list>,
          ffi.Pointer<wire_uint_8_list>)>();

  void wire_stop_chain_sync(
    int port_,
    ffi.Pointer<wire_uint_8_list> chain_name,
  ) {
    return _wire_stop_chain_sync(
      port_,
      chain_name,
    );
  }

  late final _wire_stop_chain_syncPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64,
              ffi.Pointer<wire_uint_8_list>)>>('wire_stop_chain_sync');
  late final _wire_stop_chain_sync = _wire_stop_chain_syncPtr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_send_json_rpc_request(
    int port_,
    ffi.Pointer<wire_uint_8_list> chain_name,
    ffi.Pointer<wire_uint_8_list> req,
  ) {
    return _wire_send_json_rpc_request(
      port_,
      chain_name,
      req,
    );
  }

  late final _wire_send_json_rpc_requestPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64, ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>)>>('wire_send_json_rpc_request');
  late final _wire_send_json_rpc_request =
      _wire_send_json_rpc_requestPtr.asFunction<
          void Function(int, ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>)>();

  void wire_listen_json_rpc_responses(
    int port_,
    ffi.Pointer<wire_uint_8_list> chain_name,
  ) {
    return _wire_listen_json_rpc_responses(
      port_,
      chain_name,
    );
  }

  late final _wire_listen_json_rpc_responsesPtr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(ffi.Int64, ffi.Pointer<wire_uint_8_list>)>>(
      'wire_listen_json_rpc_responses');
  late final _wire_listen_json_rpc_responses =
      _wire_listen_json_rpc_responsesPtr
          .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_solve__method__NposMiner(
    int port_,
    ffi.Pointer<wire_NposMiner> that,
  ) {
    return _wire_solve__method__NposMiner(
      port_,
      that,
    );
  }

  late final _wire_solve__method__NposMinerPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64,
              ffi.Pointer<wire_NposMiner>)>>('wire_solve__method__NposMiner');
  late final _wire_solve__method__NposMiner = _wire_solve__method__NposMinerPtr
      .asFunction<void Function(int, ffi.Pointer<wire_NposMiner>)>();

  ffi.Pointer<wire_NposMiner> new_box_autoadd_npos_miner_0() {
    return _new_box_autoadd_npos_miner_0();
  }

  late final _new_box_autoadd_npos_miner_0Ptr =
      _lookup<ffi.NativeFunction<ffi.Pointer<wire_NposMiner> Function()>>(
          'new_box_autoadd_npos_miner_0');
  late final _new_box_autoadd_npos_miner_0 = _new_box_autoadd_npos_miner_0Ptr
      .asFunction<ffi.Pointer<wire_NposMiner> Function()>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list_0(
    int len,
  ) {
    return _new_uint_8_list_0(
      len,
    );
  }

  late final _new_uint_8_list_0Ptr = _lookup<
          ffi
          .NativeFunction<ffi.Pointer<wire_uint_8_list> Function(ffi.Int32)>>(
      'new_uint_8_list_0');
  late final _new_uint_8_list_0 = _new_uint_8_list_0Ptr
      .asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  void free_WireSyncReturn(
    WireSyncReturn ptr,
  ) {
    return _free_WireSyncReturn(
      ptr,
    );
  }

  late final _free_WireSyncReturnPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturn)>>(
          'free_WireSyncReturn');
  late final _free_WireSyncReturn =
      _free_WireSyncReturnPtr.asFunction<void Function(WireSyncReturn)>();
}

final class _Dart_Handle extends ffi.Opaque {}

final class wire_uint_8_list extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}

final class wire_NposMiner extends ffi.Struct {
  external ffi.Pointer<wire_uint_8_list> chain;

  external ffi.Pointer<wire_uint_8_list> method;

  external ffi.Pointer<wire_uint_8_list> snapshot_bytes;

  @ffi.Uint32()
  external int round;

  @ffi.Uint32()
  external int desired_targets;

  @ffi.UintPtr()
  external int iterations;
}

typedef DartPostCObjectFnType = ffi.Pointer<
    ffi.NativeFunction<
        ffi.Bool Function(DartPort port_id, ffi.Pointer<ffi.Void> message)>>;
typedef DartPort = ffi.Int64;
