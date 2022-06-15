import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'loading.dart';

abstract class BaseBloc {
  Stream<Loading> get loading => _loadingSubject.stream;
  final _loadingSubject = BehaviorSubject<Loading>();
  BehaviorSubject<Loading> get loadingSubject => _loadingSubject;

  void dispose() {
    _loadingSubject.close();
  }
}

restcountries(String CityName) {
  print("we are in the restCountries API");
  final response = /* await */ http.get(
    Uri.parse('https://restcountries.com/v3.1/name/' + CityName),
    /* body: {
          "username": user.username,
          "password": user.password,
        } */
  );
  print(response);
}
