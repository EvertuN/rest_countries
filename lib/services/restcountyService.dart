import 'package:dio/dio.dart';
import '../model/modelCountries.dart';

class CountryService {
  final Dio _dio = Dio();

  Future<List<CountryList>> fetchCountries() async {
    try {
      final response = await _dio.get(
        'https://restcountries.com/v3.1/lang/portuguese',
        // queryParameters: {
        //   'api-key': 'COLOQUE_SUA_API_KEY_AQUI',
        // },
      );

      if (response.statusCode == 200) {
        print(response.data);

        final data = response.data;
        // final countryData = data['results']['lists'][0]['books'] as List;
        final countryData = data['name']['nativeName'][0]['por'] as List;

        List<CountryList> countries = countryData.map((item) {
          return CountryList(
            // nativeName: item['nativeName'] ?? 'NN Indisponível',
            common: item['common'] ?? 'CN Indisponível',
            // contributor: item['contributor'] ?? 'Contribuinte Indisponível',
            // publisher: item['publisher'] ?? 'Publisher Indisponível',
            // description: item['description'] ?? '',
            // thumbnail: item['book_image'] ?? '',
            // amazon_product_url: item['amazon_product_url'] ?? '',
          );
        }).toList();

        return countries;
      } else {
        throw Exception('Erro ao carregar a lista: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Erro de resposta: ${e.response?.data}');
      } else {
        print('Erro de requisição: ${e.message}');
      }
      throw Exception('Falha ao carregar a lista');
    }
  }
}
