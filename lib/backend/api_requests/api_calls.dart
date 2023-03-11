import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class RecipeSearchCall {
  static Future<ApiCallResponse> call({
    String? ingridientName = 'pasta',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'recipeSearch',
      apiUrl: 'https://api.edamam.com/search',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'q': ingridientName,
        'app_id': "b81142d1",
        'app_key': "86bbf82e0311d2ae473ae6c41fd8e4db",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic recipeName(dynamic response) => getJsonField(
        response,
        r'''$.hits[:].recipe.label''',
        true,
      );
  static dynamic recipeImage(dynamic response) => getJsonField(
        response,
        r'''$.hits[:].recipe.image''',
        true,
      );
  static dynamic healthLabels(dynamic response) => getJsonField(
        response,
        r'''$.hits[:].recipe.healthLabels''',
        true,
      );
  static dynamic list(dynamic response) => getJsonField(
        response,
        r'''$.hits''',
        true,
      );
  static dynamic recipe(dynamic response) => getJsonField(
        response,
        r'''$.hits[:].recipe''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
