import 'package:loomi_challenge/src/core/error/exception.dart';
import 'package:loomi_challenge/src/features/tips/data/Model/tip_model.dart';
import 'package:loomi_challenge/src/features/tips/data/repository/tip_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TipRemoteDatasource implements TipDataSourceProtocol {
  final String baseUrl = "https://6569cc7dde53105b0dd7af5c.mockapi.io/tips";

  TipRemoteDatasource();

  @override
  Future<List<TipModel>> fetchTips() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => TipModel.fromJson(json)).toList();
    } else {
      throw ServerException();
    }
  }
}
