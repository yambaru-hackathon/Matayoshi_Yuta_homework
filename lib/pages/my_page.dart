import 'package:flutter/material.dart';

class Mypage extends StatelessWidget {
  Mypage({super.key});

  final images = [
    'https://pbs.twimg.com/profile_images/1651020166422200320/dn4giyXo_400x400.png',
    'https://cdn-ak.f.st-hatena.com/images/fotolife/c/chobineco/20230811/20230811124416.jpg',
    'https://prcdn.freetls.fastly.net/release_image/38608/20/38608-20-c2c756b340c6fcfd69b798f1fe8621a9-2048x2048.jpg?format=jpeg&auto=webp&quality=85%2C65&width=1950&height=1350&fit=bounds',
    'https://www.petio.com/wp-content/uploads/2023/01/09a4944cc5a63e38288901c432612f18-4.jpg',
    'https://pbs.twimg.com/profile_images/1651020166422200320/dn4giyXo_400x400.png',
    'https://cdn-ak.f.st-hatena.com/images/fotolife/c/chobineco/20230811/20230811124416.jpg',
    'https://prcdn.freetls.fastly.net/release_image/38608/20/38608-20-c2c756b340c6fcfd69b798f1fe8621a9-2048x2048.jpg?format=jpeg&auto=webp&quality=85%2C65&width=1950&height=1350&fit=bounds',
    'https://www.petio.com/wp-content/uploads/2023/01/09a4944cc5a63e38288901c432612f18-4.jpg',
    'https://pbs.twimg.com/profile_images/1651020166422200320/dn4giyXo_400x400.png',
    'https://cdn-ak.f.st-hatena.com/images/fotolife/c/chobineco/20230811/20230811124416.jpg',
    'https://prcdn.freetls.fastly.net/release_image/38608/20/38608-20-c2c756b340c6fcfd69b798f1fe8621a9-2048x2048.jpg?format=jpeg&auto=webp&quality=85%2C65&width=1950&height=1350&fit=bounds',
    'https://www.petio.com/wp-content/uploads/2023/01/09a4944cc5a63e38288901c432612f18-4.jpg',

  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true, //中央寄せの指定
        title: const Text('マイページ')
        
        ),

      body: SingleChildScrollView(
        child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
        
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  //Container使わなくてもサイズ指定できるんですね！
                  /*Container(
                    width:100,
                    height:100,
                    child: Image.network('https://i1.wp.com/www.globemart.co.jp/newwp/wp-content/uploads/2020/07/png-transparent-instagram-application-logo-logo-computer-icons-instagram-miscellaneous-text-trademark.png'),
                  ), */
                  const SizedBox(width:16),
                  Image.network(
                    'https://i1.wp.com/www.globemart.co.jp/newwp/wp-content/uploads/2020/07/png-transparent-instagram-application-logo-logo-computer-icons-instagram-miscellaneous-text-trademark.png', 
                    width: 70,
                    height: 70,
                    ),
                  const Spacer(), //space埋めてくれるやつ
                  const Column(
                    children:  [
                       Text(
                        '7,401', 
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          ),                     
                        ),
                       Text('投稿'),
                    ],
                  ),
                  const SizedBox(width:16),
                  const Column(
                    children:  [
                       Text(
                        '4.6億',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          ),
                        ),
                       Text('フォロワー')
                    ],
                  ),
                  const SizedBox(width:16),
                  const Column(
                    children:  [
                       Text(
                        '99',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          ),
                        ),
                       Text('フォロー中')
                    ],
                  ),
                  const SizedBox(width:16),
                ],
              ),
            ),
            const SizedBox(height:16),

            const Padding(
              padding: EdgeInsets.only(top: 0, right: 8, bottom: 8, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                'Instagram',
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                ),
              ),
              Text(
                '#YoursToMake',
                style: TextStyle(
                color: Colors.blue,
                ),
              ),
              Text(
                'help.instagram.com',
                style: TextStyle(
                color: Colors.blue,
                ),
              ),
                ],
              ),
            ),
            //フォロー中・メッセージ・プルダウンボタン
            const SizedBox(height: 8),
            Row( 
              children: [
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),//角の丸み
                      ),
                    ),
                    onPressed: (){}, 
                    child: const Text(
                      'フォロー中',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    )
                  ),
                ),
        
                const SizedBox(width: 4),
        
                Expanded(
                  flex: 2,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),//角の丸み
                      ),
                    ),
                    onPressed: (){}, 
                    child: const Text(
                      'メッセージ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    )
                  ),
                ),
        
                const SizedBox(width: 4),
                
                Expanded(
                  flex: 1,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),//角の丸み
                      ),
                    ),
                    onPressed: (){}, 
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      ),
                    ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(width: 8),
            //画像グリッドビュー
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              crossAxisCount: 3,
              // ignore: non_constant_identifier_names
              children: images.map((ImageUrl){
                return InstagramPostItem(ImageUrl: ImageUrl);
              }).toList(),
            )
          ],
        )
      )
    );
  }
}

class InstagramPostItem extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const InstagramPostItem({super.key, required this.ImageUrl});

  // ignore: non_constant_identifier_names
  final String ImageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      ImageUrl,
      fit: BoxFit.cover,
      );
  }
}
