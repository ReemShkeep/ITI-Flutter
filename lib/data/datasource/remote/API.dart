import 'package:dio/Dio.dart';
import 'package:iti_flutter_project/data/datasource/remote/config.dart';
import 'package:iti_flutter_project/data/model/MovieResponse.dart';

class APIService {
  APIService._();

  static final APIService api = APIService._();
  Map<String, dynamic> params = {"api_key": api};
  String url = "popular";

  Future<MovieResponse> showMovieData() async {
    Dio dio = Config.getdio();
    Response respone = await dio.get(url, queryParameters: params);
    if (respone.statusCode == 200) {
      return MovieResponse.fromJson(respone.data);
    } else {
      throw Exception("unable to fitch data from db");
    }
  }
}
