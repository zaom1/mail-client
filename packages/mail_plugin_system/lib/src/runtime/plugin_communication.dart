import 'dart:convert';

/// JSON-RPC 2.0 message protocol for plugin communication.
class PluginCommunication {
  /// Create a JSON-RPC request.
  static Map<String, dynamic> createRequest({
    required String method,
    Map<String, dynamic>? params,
    required int id,
  }) {
    return {
      'jsonrpc': '2.0',
      'method': method,
      if (params != null) 'params': params,
      'id': id,
    };
  }

  /// Create a JSON-RPC response.
  static Map<String, dynamic> createResponse({
    required int id,
    dynamic result,
    Map<String, dynamic>? error,
  }) {
    return {
      'jsonrpc': '2.0',
      'id': id,
      if (result != null) 'result': result,
      if (error != null) 'error': error,
    };
  }

  /// Create a JSON-RPC notification (no response expected).
  static Map<String, dynamic> createNotification({
    required String method,
    Map<String, dynamic>? params,
  }) {
    return {
      'jsonrpc': '2.0',
      'method': method,
      if (params != null) 'params': params,
    };
  }

  /// Parse a JSON-RPC message.
  static RpcMessage parse(String jsonString) {
    final map = json.decode(jsonString) as Map<String, dynamic>;

    if (map.containsKey('method') && !map.containsKey('id')) {
      return RpcNotification(
        method: map['method'] as String,
        params: map['params'] as Map<String, dynamic>?,
      );
    }

    if (map.containsKey('method') && map.containsKey('id')) {
      return RpcRequest(
        method: map['method'] as String,
        params: map['params'] as Map<String, dynamic>?,
        id: map['id'] as int,
      );
    }

    if (map.containsKey('result') || map.containsKey('error')) {
      return RpcResponse(
        id: map['id'] as int,
        result: map['result'],
        error: map['error'] as Map<String, dynamic>?,
      );
    }

    throw FormatException('Invalid JSON-RPC message');
  }
}

/// Base class for RPC messages.
sealed class RpcMessage {
  String toJson();
}

/// RPC request.
class RpcRequest extends RpcMessage {
  final String method;
  final Map<String, dynamic>? params;
  final int id;

  RpcRequest({required this.method, this.params, required this.id});

  @override
  String toJson() => json.encode({
    'jsonrpc': '2.0',
    'method': method,
    if (params != null) 'params': params,
    'id': id,
  });
}

/// RPC notification.
class RpcNotification extends RpcMessage {
  final String method;
  final Map<String, dynamic>? params;

  RpcNotification({required this.method, this.params});

  @override
  String toJson() => json.encode({
    'jsonrpc': '2.0',
    'method': method,
    if (params != null) 'params': params,
  });
}

/// RPC response.
class RpcResponse extends RpcMessage {
  final int id;
  final dynamic result;
  final Map<String, dynamic>? error;

  RpcResponse({required this.id, this.result, this.error});

  @override
  String toJson() => json.encode({
    'jsonrpc': '2.0',
    'id': id,
    if (result != null) 'result': result,
    if (error != null) 'error': error,
  });
}
