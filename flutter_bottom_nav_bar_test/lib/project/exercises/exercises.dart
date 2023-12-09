import 'package:flutter/material.dart';

import '../classes/questions/chat_exercise.dart';

final Map<String, List<Map<String, Object>>> exercises = {
  'what_is_keigo': [
    {
      'question':
          'The aspect of Japanese grammar that conveys respect is called: ___.',
      'questionType': "fillInTheBlank",
      'answers': ['敬語', 'けいご', 'keigo'],
      'image': ''
    },
  ],
  'levels_of_respect': [
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
  'when_keigo': [
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
  'meishi': [
    {
      'question': 'Fill in the correct prefix: ___水.',
      'questionType': "fillInTheBlank",
      'answers': ['お', 'o'],
      'image': ''
    },
    {
      'question': 'Fill in the correct prefix: ___満足.',
      'questionType': "fillInTheBlank",
      'answers': ['ご', 'go'],
      'image': ''
    },
    {
      'question': 'Fill in the correct prefix: ___名前.',
      'questionType': "fillInTheBlank",
      'answers': ['お', 'o'],
      'image': ''
    },
    {
      'question': 'Fill in the correct prefix: ___米.',
      'questionType': "fillInTheBlank",
      'answers': ['お', 'o'],
      'image': ''
    },
    {
      'question': 'Fill in the correct prefix: ___気分.',
      'questionType': "fillInTheBlank",
      'answers': ['ご', 'go'],
      'image': ''
    },
    {
      'question': 'Fill in the correct prefix: ___質問.',
      'questionType': "fillInTheBlank",
      'answers': ['ご', 'go'],
      'image': ''
    },
  ],
  'taberu_nomu': [
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
  ],
  'だ: To Be': [
    //Maybe have the last entry into this list be the next needed in the message field
    {
      'question': ListView(children: const [
        ChatBubble(
          text: '先週、北海道に行きました。',
          isCurrentUser: false,
        ),
        ChatBubble(
          text: 'Awesome! Next time you gotta come as well!',
          isCurrentUser: true,
        ),
        ChatBubble(
          text: 'Ok, when is the next date?',
          isCurrentUser: false,
        ),
      ]),
      'questionType': 'chat',
      'answers': [],
      'image': 'boss'
    }
  ],
  '行く: To Go': [
    //Maybe have the last entry into this list be the next needed in the message field
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
      'answers': ['いらっしゃい', 'irasshai', 'irashai'],
      'image': 'boss'
    }
  ]
};
