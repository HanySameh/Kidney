import 'package:flutter/material.dart';
import 'package:kidney/core/utils/app_colors.dart';
import 'package:kidney/core/utils/media_query_values.dart';
import 'package:kidney/view/widgets/frame.dart';
import 'package:readmore/readmore.dart';

class TreatmentScreen extends StatelessWidget {
  const TreatmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Frame(
          widget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'ما هي التداخلات الدوائية لمحلول الغسيل الكلوي البريتوني؟',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 25.0,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: context.width * 0.8,
                  child: ReadMoreText(
                    '''
      1:يفضل إخبار الطبيب أو الصيدلاني عن جميع الأدوية، والأعشاب، والفيتامينات،والمكملات الغذائية قبل البدء بالعلاج.  
      2:يوصى بعدم التزامن مع الأدوية التالية:
      الباربيتورات/الساليسيلات/ الليثيوم: يزيد استخدام هذا المحلول من طرح الجسم لهذه الأدوية عن طريق البول.
الإفيدرين/ السيدوإفدرين/ ديكسامفيتامين: يقلل استخدام هذا المحلول من طرح الجسم لهذه الأدوية عن طريق البول.
      المكملات الغذائية التي تحتوي على الصوديوم، والمغنيسيوم، والكالسيوم.
      الأدوية التي تقوم بحبس السوائل أو رفع التركيز في الدم لأحد الأيونات المتواجدة في المحلول مثلاً الفيتامين د الذي يقوم بزيادة مستوى الكالسيوم.
      الاستخدام المتزامن مع أدوية جلايكوسيدات القلب يتطلب المراقبة المستمرة لمستويات الكهارل كالبوتاسيوم والكالسيوم والصوديوم التي تؤثر على فعالية هذه الأدوية.
      ''',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                    trimLines: 15,
                    colorClickableText: AppColors.primary,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'اكثر',
                    trimExpandedText: 'اقل',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
