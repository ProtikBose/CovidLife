import 'package:http/http.dart';

class ApiServices {
  final String baseUrl = "https://corona-bd.herokuapp.com";
  final String historyUrl =
      "https://api.covid19tracking.narrativa.com/api/country/Bangladesh?";
  Client client = Client();
}
