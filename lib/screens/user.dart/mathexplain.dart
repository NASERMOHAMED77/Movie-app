import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MathEx extends StatefulWidget {
  const MathEx({Key? key}) : super(key: key);

  @override
  State<MathEx> createState() => _MathExState();
}

class _MathExState extends State<MathEx> {
  var x = 0;

  List<YoutubePlayerController> _controller = [
    
    YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
              'https://www.youtube.com/watch?v=tbImdEKjaD4')
          .toString(),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    ),
    YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
              'https://www.youtube.com/watch?v=dop2HHRJckU')
          .toString(),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    ),
  ];
  List<Widget> video = [
    YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
                'https://www.youtube.com/watch?v=dop2HHRJckU')
            .toString(),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      ),
      showVideoProgressIndicator: true,
      onReady: (() => print('object')),
      onEnded: (metaData) {},
      //onReady: () =>;
    ),
    YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
                'https://www.youtube.com/watch?v=tbImdEKjaD4')
            .toString(),
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      ),
      showVideoProgressIndicator: true,
      onReady: (() => print('object')),
      onEnded: (metaData) {},
      //onReady: () =>;
    ),
  ];

  var index = 0;
  List imagesofmathex = [
    'https://modo3.com/thumbs/fit630x300/156978/1526200867/%D9%82%D8%A7%D9%86%D9%88%D9%86_%D9%85%D8%AD%D9%8A%D8%B7_%D8%A7%D9%84%D9%85%D8%AB%D9%84%D8%AB_%D9%88%D9%85%D8%B3%D8%A7%D8%AD%D8%AA%D9%87.jpg',
    'https://i0.wp.com/www.annuair.ma/wp-content/uploads/2021/02/%D9%85%D8%B3%D8%AA%D8%B7%D9%8A%D9%84.gif?fit=855%2C1024&ssl=1'
  ];
  List textmathex = [
    '''
  مساحه = نصف طول القاعده * الارتفاع 
اذن مساحه المثلث هتساوي =اب * ب ج * .5

''',
    '''
      مساحه = طول الضلع * نفسه   
اذن مساحه المربع هتساوي =اب * ب 

'''
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (index > 0) {
                          index--;
                          x++;
                        }
                      });
                    },
                    icon: Icon(Icons.arrow_back_ios_rounded)),
                Text('$index'),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (index < (textmathex.length - 1)) {
                          index++;
                          x++;
                        }
                      });
                    },
                    icon: Icon(Icons.arrow_forward_ios_outlined)),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 50),
              width: double.infinity,
              height: 200,
              child: Image.network(imagesofmathex[index]),
            ),
            Center(
              child: Text(
                textmathex[index],
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.amber, width: 5)),
                  child: video[index]),
            ),
          ],
        ),
      ),
    );
  }
}
