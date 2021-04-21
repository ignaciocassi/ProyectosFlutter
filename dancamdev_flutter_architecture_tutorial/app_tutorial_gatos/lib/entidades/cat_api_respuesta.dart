//Entidad o modelo, serialización, transforma JSON que devuelve la llamada a la API en entidad
//Null Safe code, la palabra clave required especifica que dicha variable no puede ser null
//Ejemplo Respuesta de la API (map):
//  {
//    "url":""     cadena
//    "webport":"" cadena
//    "id":        entero
//  }

//Clase respuesta
class RespuestaCatApi {
  //3 parámetros, (lo que devuelve la API)
  final String url;
  final String webpurl;
  final int id;

  //Constructor, (llamado al instanciar la clase)
  RespuestaCatApi({
    //Required, asegura que no pueden ser null
    required this.url,
    required this.webpurl,
    required this.id,
  });

  //Método factory, accede al map (JSON representación de JSON en Dart) de cadenas dinámico llamado data, y devuelve un objeto RespuestaCatApi
  //Con los atributos de dicho map. (Lo que devuelve la API)
  factory RespuestaCatApi.fromJson(Map<String, dynamic> data) {
    return RespuestaCatApi(
        url: data["url"] ?? "",
        webpurl: data["webpurl"] ?? "",
        id: data["id"] ?? 0);
  }
}
