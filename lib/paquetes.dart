import 'package:http/http.dart' as http;

import 'package:paquetes/classes/pais.dart';
import 'package:paquetes/classes/reqres_respuesta.dart';
// import 'classes/reqres_respuesta.dart';

void getReqResp_service() {
  final url = 'https://reqres.in/api/users?page=2';

  http.get(url).then((resp) {
    final resReqRes = reqResRespuestaFromJson(resp.body);
    // print(resp);
    // final body = jsonDecode(resp.body);
    // print(body);
    // print('Page: ${body['page']}');
    // print('per_page: ${body['per_page']}');
    // print('id del tercer elemento: ${body['data'][2]['id']}');

    print('Page: ${resReqRes.page}');
    print('per_page: ${resReqRes.perPage}');
    print('id del tercer elemento: ${resReqRes.data[2].id}');
  });
}

void getPais() {
  final url = 'https://restcountries.eu/rest/v2/alpha/col';

  http.get(url).then((resp) {
    final respPais = paisFromJson(resp.body);

    print('===========================================');
    print('País: ${respPais.name}');
    print('Población: ${respPais.population}');
    print('Fronteras: ');
    for (String frontera in respPais.borders) {
      print(' $frontera');
    }
    print('Lenguajes: ${respPais.languages[0].nativeName}');
    print('Latitud: ${respPais.latlng[0]}');
    print('Longuitud: ${respPais.latlng[1]}');
    print('Moneda: ${respPais.currencies[0].name}');
    print('Bandera: ${respPais.flag}');
    print('===========================================');
  }).catchError((error) => print(error));
}
