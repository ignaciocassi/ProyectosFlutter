import '../entidades/cat_api_respuesta.dart';
import 'package:dio/dio.dart';

class ServicioCatApi {
  //Constructor privado, para tener una instancia estática del servicio
  ServicioCatApi._();
  static final instancia = ServicioCatApi._();
  final url = "https://thatcopy.pw/catapi/rest/";
  Future<RespuestaCatApi> getCatImage() async {
    final response = await Dio().get(url);
    return RespuestaCatApi.fromJson(response.data);
  }
}
