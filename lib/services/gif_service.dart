import 'dart:io';
import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:sprintf/sprintf.dart';

var requestApi = "https://api.giphy.com/v1/gifs/trending?"
    "api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&limit=60&rating=g";

class GifService {
  Future<Map>  getGifs({String search, String animals, int offset = 0}) async {
    http.Response response;
    if(search == null || search.isEmpty){
      response = await http.get(requestApi);
    }else{
      requestApi = sprintf("https://api.giphy.com/v1/gifs/search?"
          "api_key=hBi2nnMdfQ0SEGo9g8stCn38mkjveh1o&q=$search&limit=59&"
          "offset=$offset&rating=g&lang=en", [search, offset]);
      response = await http.get(requestApi);
    }

    return json.decode( response.body );
  }

  void onImageShared( Map _gifData) async {
    var request = await HttpClient().getUrl(Uri.parse(_gifData['images']['fixed_height']['url']));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    await Share.file(_gifData['title'], 'gifind.gif', bytes, 'image/gif');
  }

}