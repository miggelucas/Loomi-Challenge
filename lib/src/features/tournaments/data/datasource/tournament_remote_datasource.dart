import 'package:loomi_challenge/src/core/error/failure.dart';
import 'package:loomi_challenge/src/features/tournaments/data/model/tournament_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class TournamentDataSourceProtocol {
  Future<List<TournamentModel>> fetchTournaments();
}

class TournamentRemoteDataSource implements TournamentDataSourceProtocol {
  final String baseUrl =
      "https://6569cc7dde53105b0dd7af5c.mockapi.io/championships";

  TournamentRemoteDataSource();

  @override
  Future<List<TournamentModel>> fetchTournaments() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => TournamentModel.fromJson(json)).toList();
    } else {
      throw ServerFailure(message: 'Failed to load tournaments');
    }
  }
}
