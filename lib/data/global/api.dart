import 'package:dio/dio.dart';
import 'package:max_way/data/model/data_model.dart';

class Api {
  final Dio dio;

  Api(this.dio);

  Future<PageProps> getAllData() async {
    final response = await dio.get("/uz.json");
    var data = PageProps.fromJson(response.data["pageProps"]);
    return data;
  }
}
