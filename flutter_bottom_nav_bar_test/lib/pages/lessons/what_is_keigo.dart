import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../project/libraries/page_templates.dart';

class LessonWhatIsKeigo extends StatelessWidget {
  const LessonWhatIsKeigo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop(context);
          },
          icon: const Icon(Icons.clear_rounded),
        ),
      ),
      body: Center(
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: [
            templateTitlePage(context, "assets/irasutoya/study_nihongo.png",
                "What is Keigo?"),
            templatePageInfo(context, "assets/irasutoya/study_nihongo.png",
                """Japan is a very hierarchical culture. One's social status is so important that the way you speak can significantly change depending on who you are talking to. The Japanese keigo system is an embodiment of this hierarchy. When talking to someone of a higher social status, you will use keigo to show respect to them."""),
            templatePageInfo(context, "assets/irasutoya/study_nihongo.png",
                """For example, the typical Japanese word for 'to eat' is 食べる. However, if you are asking your boss what they plan on eating, you would use the word 召し上がる for 'to eat' in order to show respect towards your boss. Alternatively, if you are talking to your boss and you are talking about what you yourself plan on eating, you would use the word いただく for 'to eat' since this humbles yourself when talking to your boss."""),
            templatePageInfo(context, "assets/irasutoya/study_nihongo.png",
                """While it's not uncommon for languages to have more formal ways of speaking, what makes Japanese difficult for learners is how much more complicated its rules are."""),
            templatePageInfo(context, "assets/irasutoya/study_nihongo.png",
                """In addition, the way that keigo is often taught in textbooks is usually inadequate for learning. Typically, keigo is presented as a table of different phrases and grammatical rules that the learner is expected to memorize. This ignores the sociocultural context of the conversation that is paramount to using keigo correctly."""),
            templatePageInfo(context, "assets/irasutoya/study_nihongo.png",
                """This app is designed to help intermediate to advanced level Japanese language learners learn and improve their keigo. The philosophy behind its design is that keigo is made unnecessarily more complicated because of the way it's taught. This app presents keigo in small, bite-sized lessons to avoid overwhelming grammar tables. It then reinforces that learning with context based exercises. These exercises are presented in a way that will help keep these grammar rules within long term memory as well."""),
            templateLessonComplete(context,
                "Well Done! You have completed the first step towards mastering keigo!")
          ],
        ),
      ),
    );
  }
}
