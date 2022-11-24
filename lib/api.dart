import 'package:http/http.dart' as http;

Future getprediction ( url) async{
  http.Response response = await http.get(url) ;
  return response.body;
}

Future getfertilizer (url) async{
  http.Response  response = await http.get(url) ;
  return response.body ;
}
