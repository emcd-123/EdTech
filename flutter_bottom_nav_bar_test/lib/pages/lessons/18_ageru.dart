import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../project/libraries/page_templates.dart';

class LessonAgeru extends StatelessWidget {
  const LessonAgeru({super.key});

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
            templateTitlePage(
                context, "assets/irasutoya/study_nihongo.png", "あげる・くれる・もらう"),
            templateWorkInProgress(context),
          ],
        ),
      ),
    );
  }
}
