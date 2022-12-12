import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kidney/core/utils/app_colors.dart';
import 'package:kidney/view/widgets/one_question.dart';
import 'package:kidney/view/widgets/two_question.dart';

import 'package:kidney/core/utils/media_query_values.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LearnMoreScreen extends StatefulWidget {
  const LearnMoreScreen({super.key});

  @override
  State<LearnMoreScreen> createState() => _LearnMoreScreenState();
}

class _LearnMoreScreenState extends State<LearnMoreScreen> {
  final _videoUrl = 'https://youtu.be/Btm5nrrSsRA';
  late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(_videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'video ready to play',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16.0,
                color: AppColors.white,
              ),
            ),
            duration: const Duration(milliseconds: 1000),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ),
      builder: (context, player) => Scaffold(
        body: PageView(
          children: [
            OneQuestionItem(
              numberOfLines: 11,
              answer: '''
    هدف الغسيل الكلوي البريتوني إلى إزالة الفضلات من الدم عندما تعجز الكليتان عن القيام بوظيفتهما على نحو سليم. وخلال الغسيل الكلوي البريتوني، ينساب سائل التنقية عبر قسطرة (أنبوب) إلى جزء من البطن
    
    ويعمل الغشاء البريتوني (الصفاق) الموجود بالبطن كمرشح، ويزيل الفضلات من الدم. بعد فترة زمنية محددة، يتدفق السائل مع الفضلات المصفاة خارج البطن، ويتم التخلص منه. يمكن للمريض القيام بالغسيل الكلوي البريتوني في المنزل، أو في العمل، أو حتى في أثناء السفر.
    ''',
              question: 'الغسيل الكلوي البريتون',
              widget: Padding(
                padding: EdgeInsets.only(top: context.height * 0.01),
                child: Text(
                  'اسحب الشاشه لليمين',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ),
            const TwoQuestionItem(
              answer1: '''
    عند رغبة المريض بتجنب الوخز بالإبر، والتعامل مع الدم.
    عند عدم الرغبة بتعطيل الأنشطة اليومية.
    عند الرغبة بالعمل، أو السفر بسهولة أكبر.
    عند قيام الكُلى ببعض وظائفها.
    ''',
              question1: 'الحالات التي ينصح فيها باستخدام الغسيل البريتوني:',
              numberOfLines: 14,
              answer2: '''
    وجود ندبات جراحية واسعة في البطن.
    إجراء المريض عدة جراحات في منطقة البطن.
    ضعف عضلات البطن.
    التهاب الأمعاء، أو نوبات متكررة من الانسدادات المعوية.
    سوء التغذية، ونقص البروتينات.
    إذا كان المريض مصابًا بالسمنة المفرطة
    ''',
              question2: 'موانع استخدام الغسيل الكلوي البريتوني:',
            ),
            OneQuestionItem(
              numberOfLines: 12,
              answer: '''
    1:التأكد من نظافة المكان.
    2:تجهيز جميع المعدات قبل بدء جلسة الغسيل.
    غسل اليدين جيدًا بالماء والصابون قبلبدء جلسة الغسيل.
    3:تجفيف اليدين، وعدم لمس أي شيء لا يتعلق بعملية الغسيل البريتوني.
    4:تجنب العطاس، والكحة على معدات الغسيل البريتوني، والتخلص منها جميعًا في حال حدث ذلك.
    5:الحرص على اتباع جميع التعليمات كما هي، وعدم محاولة تجربة أي شيء قبل إخبار مقدم الرعايه به
    ''',
              question:
                  'ارشادات عند القيام بالغسيل الكلوي البريتوني في المنزل:',
              widget: player,
            ),
            const TwoQuestionItem(
              answer1: '''
    
    مكونات محلول الغسيل البريتوني 
    
    يحتوي محلول الغسيل الكلوي البريتوني على عدد من الأملاح، والكهارل، بالإضاافة إلى الجلوكوز، فهو  محلول معقم، خال من البييروجين، يحتوي على سكر الدكستروز.
    ''',
              question1: 'ما هو مكونات محلول الغسيل الكلوي البريتوني؟',
              numberOfLines: 14,
              answer2: '''
    
    يحفظ بدرجة حرارة أقل من 25 مئوية، بعيداً عن الرطوبة وأشعة الشمس المباشرة.
    يستعمل على الفور. 
    ''',
              question2: 'ما هي ظروف تخزين محلول الغسيل الكلوي البريتوني؟',
            ),
            const OneQuestionItem(
              numberOfLines: 8,
              answer: '''
    في الغسيل البريتوني يحقن محلول الغسيل الكلوي البريتوني في الغشاء المبطن للبطن،وهو الغشاء البريتوني، حيث تعبر المواد السامة والضارة بالجسم من خلال الغشاء البريتوني الذي يعمل كمصفاة من الدم غلى المحلول.تستغرق تلك العملية وقتاً طويلاً يتراوح من 24 إلى 48 ساعة، ولكن يمكن للمريض ممارسة حياته الطبيعية في تلك الأثناء.
    ''',
              question: 'ما الفرق بين الغسيل البريتوني والدموي',
            ),
            const OneQuestionItem(
              numberOfLines: 8,
              answer: '''
    التهاب الغشاء البيريتوني
    
    ألم البطن
    
    نزيف
    
    عدوى جلدية
    
    انسداد القسطرة
    
    انسداد الأمعاء الغليطة
    
    فرط/ نقص حجم الدم
    
    ارتفاع/انخفاض ضغط الدم
    ''',
              question: 'الاثار الجانبية للغسيل الكلوي البريتوني.',
            ),
          ],
        ),
      ),
    );
  }
}
