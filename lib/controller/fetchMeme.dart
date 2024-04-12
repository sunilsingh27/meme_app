import 'dart:convert';

import 'package:http/http.dart';

// class FetchMeme {
//   // https://api.imgflip.com/get_memes
//
//   fetchNewMeme() async {
//    Response response = await get(Uri.parse("https://api.imgflip.com/get_memes"));
//     // print(response.body);
//
//     Map body_data = jsonDecode(response.body);
//     print(body_data["url"]);
//
//   }
//
//
// }

import 'dart:convert';
import 'package:http/http.dart';

class FetchMeme {
  // https://api.imgflip.com/get_memes

  static fetchNewMeme() async {
    Response response = await get(Uri.parse("https://api.imgflip.com/get_memes"));

    if (response.statusCode == 200) {
      Map<String, dynamic> bodyData = jsonDecode(response.body);
      List<dynamic> memes = bodyData["data"]["memes"];

      // Randomly select a meme index
      int randomIndex = memes.length > 0 ? DateTime.now().microsecondsSinceEpoch % memes.length : 0;

      // Access the URL of the selected meme
      String memeUrl = memes[randomIndex]["url"];
      return memeUrl;

    } else {
      print("Failed to fetch meme: ${response.statusCode}");
    }
  }
}

void main() {
  FetchMeme.fetchNewMeme();
}
