// import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:paquetes/classes/reqres_respuesta.dart';
import 'package:paquetes/paquetes.dart' as paquetes;

void main(List<String> arguments) {
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
