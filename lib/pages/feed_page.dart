import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; //追加部分
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; //追加部分
import 'package:readmore/readmore.dart'; //追加部分

class Feedpage extends StatefulWidget {
  const Feedpage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FeedpageState createState() => _FeedpageState();
}

class _FeedpageState extends State<Feedpage> {
  int activeIndex = 0;

  final images = [
    'https://pbs.twimg.com/profile_images/1651020166422200320/dn4giyXo_400x400.png',
    'https://cdn-ak.f.st-hatena.com/images/fotolife/c/chobineco/20230811/20230811124416.jpg',
    'https://prcdn.freetls.fastly.net/release_image/38608/20/38608-20-c2c756b340c6fcfd69b798f1fe8621a9-2048x2048.jpg?format=jpeg&auto=webp&quality=85%2C65&width=1950&height=1350&fit=bounds',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('フィード'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Image.network(
                        'https://i1.wp.com/www.globemart.co.jp/newwp/wp-content/uploads/2020/07/png-transparent-instagram-application-logo-logo-computer-icons-instagram-miscellaneous-text-trademark.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Instagram',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(width: 2),
                        Icon(
                          Icons.check_circle_outline,
                          color: Colors.blue,
                          size: 15,
                        )
                      ],
                    ),
                    Text(
                      'サンディエゴ',
                      style: TextStyle(
                        fontSize: 12,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                    )
                  ],
                ),
                const Spacer(),

                IconButton(
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: (){},
                ),
                const SizedBox(width: 10,),
                ],
                ),
                
                Stack(
                  children: [
                    Row(
                    children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ 
                          //画像表示
                          CarouselSlider.builder( 
                            options: CarouselOptions(
                              height: 460,
                              initialPage: 0,
                              viewportFraction: 1,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activeIndex = index;
                                });
                              },
                            ),
                            itemCount: images.length,
                            itemBuilder: (context, index, realIndex) {
                              final path = images[index];
                              return InstagramPostItem(imageUrl: path);
                            },
                          ),
                          const SizedBox(height: 10),
                          
                          //アイコン、インジケーターの表示
                          Row(                            
                            children: [
                              const SizedBox(width: 10),
                                      
                              IconButton(
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: (){},
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.chat_bubble_outline,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: (){},
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.send_outlined,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: (){},
                              ),
                              const SizedBox(width: 35),
                                      
                              Expanded(
                                child: 
                                buildIndicator()
                              ),
                                      
                              const SizedBox(width: 80),
                              IconButton(
                                icon: const Icon(
                                  Icons.bookmark_border,
                                  color: Colors.black,
                                  size: 35,
                                ),
                                onPressed: (){},
                              ),
                              const SizedBox(width: 20),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                  ),

                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: 
                        Container(
                          width: 70,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          
                          
                        ),
                      ),
                    ),

                  Positioned(
                      right: -1,
                      top: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          '${activeIndex + 1}/3   ',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white,
                          ),),
                          
                      ),
                    ),
                  ]
                )
              ],
            ), 
            const SizedBox(height: 10),

            const Row(
              children: [
                SizedBox(width: 20),
                Text(
                  '「  いいね！」 704,899件',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),                  
                  ),
              ],
            ),
            const SizedBox(height: 10,),

            // ignore: prefer_const_constructors
            Row(
              children: const [
                SizedBox(width: 20),
                Expanded(
                  child: ReadMoreText(
                    'あぁああああああ！！！ねこねこねこぅううぁわぁああああ！！！あぁクンカクンカ！クンカクンカ！スーハースーハー！スーハースーハー！いい匂いだなぁ…くんくんんはぁっ！ねこたんのふわふわもふもふな毛をクンカクンカしたいお！クンカクンカ！あぁあ！！間違えた！モフモフしたいお！モフモフ！モフモフ！モフモフ！カリカリモフモフ…きゅんきゅんきゅい！！',
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '続きを読む',
                    trimExpandedText: '閉じる',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
             
          ],
        ),
      ),
    );
  }
  //インジケーター
  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: images.length,
      effect: const WormEffect(
        dotColor: Colors.grey,
        activeDotColor: Colors.blue,
        dotHeight: 8,
        dotWidth: 8,
        spacing: 6,
      ),
    );
  }
}

//画像表示
class InstagramPostItem extends StatelessWidget {
  final String imageUrl;

  const InstagramPostItem({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }
}
