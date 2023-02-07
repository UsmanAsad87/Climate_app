import 'package:http/http.dart' as Http;
import 'dart:convert';

class NetworkHelper{
  final String url;
  NetworkHelper({this.url});

  Future<dynamic> getData() async{
    Http.Response response= await Http.get(Uri.parse(url));
    if(response.statusCode==200)
    {
      String data= response.body;
      var decodedData=jsonDecode(data);
      return decodedData;
    }
    else{
      print(response.statusCode);
    }
  }
}