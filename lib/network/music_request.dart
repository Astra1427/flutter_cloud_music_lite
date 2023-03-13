import 'package:flutter_cloud_music_lite/network/RequestClient.dart';

import '../models/music/music_search_result_model.dart';
import '../models/music/song_urls_model.dart';
import 'apis.dart';

class MusicRequest {


  Future<MusicSearchModel> search(
    String keywords, {
    int? limit = 30,
    int? offset = 0,
  }) async {
    var result = await RequestClient.instance.get(Apis.search, queryParameters: {
      'keywords': keywords,
      'limit': limit,
      'offset': offset,
    });
    return MusicSearchModel.fromJson(result);
  }

  Future<SongUrlsModel> getMusicUrlsByIds(List<int> musicIds,{int br = 999000})async{
    var result = await RequestClient.instance.get(Apis.song_url,queryParameters: {
      'id':musicIds.join(','),
      'br': br
    });
    return SongUrlsModel.fromJson(result);
  }
}
