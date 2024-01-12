import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

final Uri _amazonLink = Uri.parse('https://www.amazon.co.jp/s?k=%E5%8D%B5&__mk_ja_JP=%E3%82%AB%E3%82%BF%E3%82%AB%E3%83%8A&ref=nb_sb_noss_1');
final Uri _rakutenLink = Uri.parse('https://search.rakuten.co.jp/search/mall/%E5%8D%B5/');

class ShoppingPage extends StatelessWidget {

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            'このページでは卵の購入ができます。',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 30),
          child: ElevatedButton(
            onPressed: () {
              _launchUrl(_amazonLink);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: Image.asset('images/amazon_logo.png')
                ),
                SizedBox(width: 8),
                Text(
                  'で卵を購入する',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 30),
          child: ElevatedButton(
            onPressed: () {
              _launchUrl(_rakutenLink);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: Image.asset('images/rakuten_logo.png')
                ),
                SizedBox(width: 8),
                Text(
                  'で卵を購入する',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}