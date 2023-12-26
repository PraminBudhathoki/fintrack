import 'package:http/http.dart' as http;

future <String> register() async {
  final response = await http.post(Api.signup_API, body:{});
}