import 'package:http/http.dart' as http;

Future Getprediction ( url) async{
  http.Response Response = await http.get(url) ;
  return Response.body;
}
