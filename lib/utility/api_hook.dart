part of widget_utility;

enum RequestType {
  get,
  post,
  delete,
  put,
}

class ApiReturnType<T> {
  bool isLoading = false;
  bool isError = false;
  dynamic response = {};
  String error = '';
  late Dio dio;
  late String path;
  late RequestType requestType;

  ApiReturnType({
    required this.path,
    required this.dio,
    this.requestType = RequestType.get,
  });

  void dispose() {
    dio.close(force: true);
  }

  Future<void> run(
      {required Map<String, dynamic>? data,
      Map<String, dynamic>? query,
      String? drill = '',
      String? errorDrill = '',
      int? depth = 2,
      int? errorDepth = 1}) async {
    try {
      isLoading = true;
      isError = false;
      Response? _response;
      if (requestType == RequestType.post) {
        debugPrint(dio.options.baseUrl);
        _response =
            await dio.post(path, data: data, queryParameters: query ?? {});
      } else if (requestType == RequestType.delete) {
        _response =
            await dio.delete(path, data: data, queryParameters: query ?? {});
      } else if (requestType == RequestType.put) {
        _response =
            await dio.put(path, data: data, queryParameters: query ?? {});
      } else {
        _response = await dio.get(path, queryParameters: query ?? {});
      }
      response = !drill.has()
          ? _response.data
          : flatten(_response.data as Map<String, dynamic>,
              maxDepth: depth)[drill];
      isLoading = false;
    } catch (e) {
      isError = true;
      isLoading = false;
      if (e.runtimeType == DioError) {
        e as DioError;
        debugPrint(e.response.toString());
        error = !errorDrill.has()
            ? (e.response?.data['message'] ??
                    'Network error, please check your internet connection')
                .toString()
            : (flatten(e.response?.data,
                        maxDepth: errorDepth)[errorDrill ?? 'message'] ??
                    'Network error, please check your internet connection')
                .toString();
      } else {
        error = "Network Error!!!";
      }
      throw error;
    }
  }
}
