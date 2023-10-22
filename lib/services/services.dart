import 'dart:io';



import 'package:http/http.dart';

import '../models/channel_info.dart';
import '../models/videos_list.dart';
import '../utils/constants.dart';

class Services{
  static const CHANNEL_ID = 'UCG2u5b1o_h99MZmaqJEPJXA';
  static const _baseUrl = 'www.googleapis.com';


  /*
  'https://youtube.googleapis.com/youtube/v3/channels?part=snippet%2CcontentDetails%2Cstatistics&id=UCG2u5b1o_h99MZmaqJEPJXA&access_token=AIzaSyAtZU6lHBaVtmylAMflKXGmBoy6evkmwXw&key=[YOUR_API_KEY]' \
  --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  --header 'Accept: application/json' \
  --compressed

  */

  static Future<ChannelInfo> getChannelInfo() async {
    Map<String, String> parameters = {
      'part' : 'snippet,contentDetails,statistics',
      'id' : CHANNEL_ID,
      'key' : Constants.API_KEY,
    };
    Map<String,String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Response response = await get(uri, headers: headers);
    //print(response.body);

    ChannelInfo channelInfo = channelInfoFromJson(response.body);
    return channelInfo;
  }

  static Future<VideosList> getVideosList({required String playlistId, required String pageToken}) async{
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': '8',
      'pageToken': pageToken,
      'key': Constants.API_KEY,
    };
    Map<String,String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );

    Response response = await get(uri, headers: headers);
    //print(response.body);
    VideosList videosList = videosListFromJson(response.body);
    return videosList;
  }
}