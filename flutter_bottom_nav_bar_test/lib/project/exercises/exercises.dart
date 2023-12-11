import 'package:flutter/material.dart';

import '../classes/questions/chat_exercise.dart';

final Map<String, List<Map<String, Object>>> exercises = {
  'What is Keigo?': [
    {
      'question':
          'The aspect of Japanese grammar that conveys respect is called: ___.',
      'questionType': "fillInTheBlank",
      'answers': ['敬語', 'けいご', 'keigo'],
      'image': ''
    },
  ],
  'Levels of Respect': [
    {
      'question': 'Use this keigo for talking about yourself: ___.',
      'questionType': "fillInTheBlank",
      'answers': ['謙譲語', 'けんじょうご', 'kenjougo', 'humble', 'humble form'],
      'image': ''
    },
    {
      'question':
          'Use this form for talking to people you are close with: ___.',
      'questionType': "fillInTheBlank",
      'answers': [
        'タメ語',
        'ためご',
        'タメご',
        'tamego',
        'タメ口',
        'ためぐち',
        'タメぐち',
        'tameguchi',
        'casual',
        'casual form',
        'plain',
        'plain form'
      ],
      'image': ''
    },
  ],
  'When to Use Keigo': [
    {
      'question': 'Which form to your boss (not about you)? ___.',
      'questionType': "fillInTheBlank",
      'answers': ['尊敬語', 'そんけいご', 'sonkeigo', 'respectful', 'respectful form'],
      'image': ''
    },
    {
      'question': 'Which form with your customer (not about you)? ___.',
      'questionType': "fillInTheBlank",
      'answers': ['尊敬語', 'そんけいご', 'sonkeigo', 'respectful', 'respectful form'],
      'image': ''
    },
    {
      'question': 'Which form with a stranger? ___.',
      'questionType': "fillInTheBlank",
      'answers': ['丁寧語', 'ていねいご', 'teineigo', 'polite', 'polite form'],
      'image': ''
    },
    {
      'question': 'Which form with an older person? ___.',
      'questionType': "fillInTheBlank",
      'answers': ['丁寧語', 'ていねいご', 'teineigo', 'polite', 'polite form'],
      'image': ''
    },
    {
      'question': 'Which form to your boss (about you)? ___.',
      'questionType': "fillInTheBlank",
      'answers': ['謙譲語', 'けんじょうご', 'kenjougo', 'humble', 'humble form'],
      'image': ''
    },
    {
      'question': 'Which form with your customer (about you)? ___.',
      'questionType': "fillInTheBlank",
      'answers': ['謙譲語', 'けんじょうご', 'kenjougo', 'humble', 'humble form'],
      'image': ''
    },
    {
      'question': 'Which form with your friend? ___.',
      'questionType': "fillInTheBlank",
      'answers': [
        'タメ語',
        'ためご',
        'タメご',
        'tamego',
        'タメ口',
        'ためぐち',
        'タメぐち',
        'tameguchi',
        'casual',
        'casual form',
        'plain',
        'plain form'
      ],
      'image': ''
    },
    {
      'question': 'Which form with your family? ___.',
      'questionType': "fillInTheBlank",
      'answers': [
        'タメ語',
        'ためご',
        'タメご',
        'tamego',
        'タメ口',
        'ためぐち',
        'タメぐち',
        'tameguchi',
        'casual',
        'casual form',
        'plain',
        'plain form'
      ],
      'image': ''
    },
    {
      'question': 'Which form to kids? ___.',
      'questionType': "fillInTheBlank",
      'answers': [
        'タメ語',
        'ためご',
        'タメご',
        'tamego',
        'タメ口',
        'ためぐち',
        'タメぐち',
        'tameguchi',
        'casual',
        'casual form',
        'plain',
        'plain form'
      ],
      'image': ''
    },
  ],
  'Honorific Prefixes': [
    {
      'question': 'Fill in the correct prefix: ___水.',
      'questionType': "fillInTheBlank",
      'answers': ['お', '御', 'o'],
      'image': ''
    },
    {
      'question': 'Fill in the correct prefix: ___満足.',
      'questionType': "fillInTheBlank",
      'answers': ['ご', '御', 'go'],
      'image': ''
    },
    {
      'question': 'Fill in the correct prefix: ___名前.',
      'questionType': "fillInTheBlank",
      'answers': ['お', '御', 'o'],
      'image': ''
    },
    {
      'question': 'Fill in the correct prefix: ___米.',
      'questionType': "fillInTheBlank",
      'answers': ['お', '御', 'o'],
      'image': ''
    },
    {
      'question': 'Fill in the correct prefix: ___気分.',
      'questionType': "fillInTheBlank",
      'answers': ['ご', '御', 'go'],
      'image': ''
    },
    {
      'question': 'Fill in the correct prefix: ___質問.',
      'questionType': "fillInTheBlank",
      'answers': ['ご', '御', 'go'],
      'image': ''
    },
  ],
  '食べる・飲む': [
    {
      'question': 'You are speaking to your boss: コーヒーを___ますか。',
      'questionType': "fillInTheBlank",
      'answers': ['召し上がり', 'めしあがり', 'meshiagari'],
      'image': 'boss'
    },
    {
      'question': 'You are speaking to your boss: 私はコーヒーを___ます。',
      'questionType': "fillInTheBlank",
      'answers': ['頂き', 'いただき', 'itadaki'],
      'image': 'me'
    },
    {
      'question': 'You are speaking to an older stranger: コーヒーを___ますか。',
      'questionType': "fillInTheBlank",
      'answers': ['飲み', 'のみ', 'nomi'],
      'image': 'stranger'
    },
    {
      'question': 'You are speaking to a close friend: コーヒーを___?',
      'questionType': "fillInTheBlank",
      'answers': ['飲む', 'のむ', 'nomu'],
      'image': 'friend'
    },
    {
      'question': 'You are speaking to your boss: お寿司を___ますか。',
      'questionType': "fillInTheBlank",
      'answers': ['召し上がり', 'めしあがり', 'meshiagari'],
      'image': 'boss'
    },
    {
      'question': 'You are speaking to your boss: 私はお寿司を___ます。',
      'questionType': "fillInTheBlank",
      'answers': ['頂き', 'いただき', 'itadaki'],
      'image': 'me'
    },
    {
      'question': 'You are speaking to an older stranger: お寿司を___ますか。',
      'questionType': "fillInTheBlank",
      'answers': ['食べ', 'たべ', 'tabe'],
      'image': 'stranger'
    },
    {
      'question': 'You are speaking to a close friend: すしを___?',
      'questionType': "fillInTheBlank",
      'answers': ['食べる', 'たべる', 'taberu'],
      'image': 'friend'
    },
    {
      'question': const [
        ChatBubble(
          text: '今日は誘ってくれてありがとう',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'いえいえ、今日は君の誕生日だから、僕がおごる（お金を払う）よ。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'ありがとう！ じゃあ...',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'このステーキを食べてもいい？',
          isCurrentUser: true,
        ),
        ChatBubble(text: "もちろん。", isCurrentUser: false)
      ],
      'answerBubble': 3,
      'affixes': ['このステーキを', 'てもいい？'],
      'questionType': 'chat',
      'answers': ['食べ', 'たべ', 'tabe'],
      'image': 'assets/irasutoya/restaurant.png'
    },
    {
      'question': const [
        ChatBubble(
          text: '部長、旅行に行ったので、よかったらお土産いかがですか。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'ありがとう。これは何？',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: '沖縄の海ブドウです。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: '部長は召し上がったことはありますか？',
          isCurrentUser: true,
        ),
        ChatBubble(text: "初めて食べるよ、ありがとう。", isCurrentUser: false)
      ],
      'answerBubble': 3,
      'affixes': ['部長は', 'ことはありますか？'],
      'questionType': 'chat',
      'answers': ['召し上がった', 'めしあがった', 'meshiagatta'],
      'image': 'boss'
    },
    {
      'question': const [
        ChatBubble(
          text: '今日はお食事にお誘いいただきありがとうございます。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'こちらこそ来てくれてありがとう。お金は私が払うから、好きなものを食べて。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'ありがとうございます。では...',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'このステーキをいただいてもいいですか。',
          isCurrentUser: true,
        ),
        ChatBubble(text: "もちろん！", isCurrentUser: false)
      ],
      'answerBubble': 3,
      'affixes': ['このステーキを', 'てもいいですか。'],
      'questionType': 'chat',
      'answers': ['いただい', '頂い', 'itadai'],
      'image': 'boss_eat'
    },
  ],
  'To Be: だ': [
    {
      'question': const [
        ChatBubble(
          text: '田中、久しぶり！',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: '久しぶり。元気だった？',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'うん。元気だよ。そっちは？',
          isCurrentUser: true,
        ),
        ChatBubble(text: "元気にしてたよ。", isCurrentUser: false)
      ],
      'answerBubble': 2,
      'affixes': ['うん。元気', 'よ。そっちは？'],
      'questionType': 'chat',
      'answers': ['だ', 'だ', 'da'],
      'image': 'friend'
    },
    {
      'question': const [
        ChatBubble(
          text: '久しぶり、元気にしていた？',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'はい、おかげさまで元気です。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: '部長は、お元気でいらっしゃいますか？',
          isCurrentUser: true,
        ),
        ChatBubble(text: "元気にしてたよ。", isCurrentUser: false)
      ],
      'answerBubble': 2,
      'affixes': ['部長は、お元気', 'ますか？'],
      'questionType': 'chat',
      'answers': ['でいらっしゃい', 'deirashai', 'deirasshai'],
      'image': 'boss'
    },
    {
      'question': const [
        ChatBubble(
          text: '初めまして、田中と申します。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: '初めまして、よろしくお願いいたします。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'そちらの方はどなたですか。',
          isCurrentUser: false,
        ),
        ChatBubble(text: "こちらは弊社の部長の高橋でございます。", isCurrentUser: true),
        ChatBubble(
          text: 'よろしくお願いいたします。',
          isCurrentUser: false,
        ),
      ],
      'answerBubble': 3,
      'affixes': ['こちらは弊社の部長の高橋', 'ます。'],
      'questionType': 'chat',
      'answers': ['でござい', 'degozai', 'degozai'],
      'image': 'boss'
    },
  ],
  'To Exist: いる': [
    //Maybe have the last entry into this list be the next needed in the message field
    {
      'question': const [
        ChatBubble(
          text: 'もしもし、田中だけど。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'もしもし、どうしたの？',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: '旅行に行ったからお土産を渡したいんだけど、今家にいる？',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'いるよ。',
          isCurrentUser: true,
        ),
        ChatBubble(text: "じゃあ今から行くね。", isCurrentUser: false)
      ],
      'answerBubble': 3,
      'affixes': [' ', 'よ。                                    '],
      'questionType': 'chat',
      'answers': ['いる', 'います', 'iru', 'imasu'],
      'image': 'assets/irasutoya/denwa_kaiwa.png'
    },
    {
      'question': const [
        ChatBubble(
          text: 'ミーティングをしたいのですが、いつがよろしいでしょうか。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: '明日でしたら空いています。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: '承知いたしました。何時ごろでしたら...',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'オフィスにいらっしゃいますか？',
          isCurrentUser: true,
        ),
        ChatBubble(text: "午後2時でお願いいたします。", isCurrentUser: false)
      ],
      'answerBubble': 3,
      'affixes': ['オフィスに', 'ますか？'],
      'questionType': 'chat',
      'answers': ['いらっしゃい', 'irashai', 'irasshai'],
      'image': 'assets/irasutoya/bowing_women.png'
    },
    {
      'question': const [
        ChatBubble(
          text: '高橋部長はいらっしゃいますでしょうか。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: '申し訳ございません、今は席を外しております。何時ごろでしたらいらっしゃいますか。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: '4時にはオフィスにおります。',
          isCurrentUser: true,
        ),
        ChatBubble(text: "わかりました、では４時ごろにまたお電話いたします。", isCurrentUser: false)
      ],
      'answerBubble': 2,
      'affixes': ['4時にはオフィスに', 'ます。'],
      'questionType': 'chat',
      'answers': ['おり', 'ori', 'ori'],
      'image': 'assets/irasutoya/kaisha_denwa.png'
    },
  ],
  'To Do: する': [
    //Maybe have the last entry into this list be the next needed in the message field
    {
      'question': const [
        ChatBubble(
          text: '二人は初めて会うよね。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'そうだね。初めまして、田中君の同僚です。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'こっちは、佐藤。大学のころの友達。',
          isCurrentUser: false,
        ),
        ChatBubble(text: "へぇ。何の仕事をしているの？", isCurrentUser: true),
        ChatBubble(
          text: '教師だよ。',
          isCurrentUser: false,
        ),
      ],
      'answerBubble': 3,
      'affixes': ['へぇ。何の仕事を', 'るの？'],
      'questionType': 'chat',
      'answers': ['してい', 'す', 'shitei', 'su'],
      'image': 'assets/irasutoya/friend_shoukai.png'
    },
    {
      'question': const [
        ChatBubble(
          text: 'プロジェクトの成功を祝して、食事会を開きたいのですがいかがでしょうか。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'わかりました。社内のものに伝えておきます。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: '店の予約は私がいたしますので、よろしくお願いします。',
          isCurrentUser: true,
        ),
        ChatBubble(text: "こちらこそよろしくお願いいたします。", isCurrentUser: false),
      ],
      'answerBubble': 3,
      'affixes': ['店の予約は私が', 'ますので...'],
      'questionType': 'chat',
      'answers': ['いたし', 'itasi', 'itashi'],
      'image': 'assets/irasutoya/kaisha_phone.png'
    },
  ],
  '行く・来る': [
    //Maybe have the last entry into this list be the next needed in the message field
    {
      'question': const [
        ChatBubble(
          text: '部長に聞いたんだけど、駅前にできたカレー屋さんがすごくおいしいらしいよ。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'そうなんだ。行ってみたいな。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'じゃあ、今日のランチ、その店に一緒に行く？',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'うん、行くぞ。',
          isCurrentUser: false,
        ),
      ],
      'answerBubble': 2,
      'affixes': ['今日のランチ、その店に一緒に', '?'],
      'questionType': 'chat',
      'answers': ['行く', 'いく', 'iku'],
      'image': 'assets/irasutoya/friend.jpg'
    },
    {
      'question': ListView(children: const [
        ChatBubble(
          text: '雪が好きので、来月北海道に参ります',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: '本当ですか。先週北海道に行きました',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'どうして北海道に___ましたか。',
          isCurrentUser: true,
        ),
        ChatBubble(text: "家族が北海道に住むからです", isCurrentUser: false)
      ]),
      'answerBubble': 2,
      'questionType': 'chat',
      'answers': ['いらっしゃい', 'irashai', 'irasshai'],
      'image': 'boss'
    },
    {
      'question': const [
        ChatBubble(
          text: '何時にオフィスにいらっしゃいますか。',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: '3時でしたら大丈夫です。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'では、3時に伺います。',
          isCurrentUser: true,
        ),
        ChatBubble(text: "はい、よろしくお願いいたします。", isCurrentUser: false)
      ],
      'answerBubble': 2,
      'affixes': ['では、3時に', 'ます。'],
      'questionType': 'chat',
      'answers': ['伺い', 'うかがい', 'ukagai'],
      'image': 'assets/irasutoya/bowing_women.png'
    },
  ]
};
