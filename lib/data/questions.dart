import 'package:izi_english_now/models/answer.dart';
import 'package:izi_english_now/models/question.dart';

class Questions {
  static final List<Question> greetings = [
    Question(
      'Hi',
      'audioUrl',
      [
        Answer('Oi', true),
        Answer('Tchau', false),
        Answer('Bom dia', false),
      ],
    ),
    Question(
      'Hello',
      'audioUrl',
      [
        Answer('Boa noite', false),
        Answer('Boa tarde', false),
        Answer('Olá', true),
      ],
    ),
    Question(
      'Hey',
      'audioUrl',
      [
        Answer('Oi/E aí', true),
        Answer('Olá', false),
        Answer('Bom dia', false),
      ],
    ),
    Question(
      'Good Morning',
      'audioUrl',
      [
        Answer('Boa noite', false),
        Answer('Bom dia', true),
        Answer('Boa tarde', false),
      ],
    ),
    Question(
      'Good Evening',
      'audioUrl',
      [
        Answer('Boa tarde', false),
        Answer('Bom dia', false),
        Answer('Boa noite', true),
      ],
    ),
    Question(
      'Good Night',
      'audioUrl',
      [
        Answer('Boa noite', true),
        Answer('Boa tarde', false),
        Answer('Bom dia', false),
      ],
    ),
    Question(
      'Good Afternoon',
      'audioUrl',
      [
        Answer('Boa noite', false),
        Answer('Boa tarde', true),
        Answer('Bom dia', false),
      ],
    ),
  ];

  static final List<Question> animals = [
    Question(
      'Monkey',
      'audioUrl',
      [
        Answer('Macaco', true),
        Answer('Baleia', false),
        Answer('Tubarão', false),
      ],
    ),
    Question(
      'Shark',
      'audioUrl',
      [
        Answer('Cachorro', false),
        Answer('Baleia', false),
        Answer('Tubarão', true),
      ],
    ),
    Question(
      'Dog',
      'audioUrl',
      [
        Answer('Cachorro', true),
        Answer('Baleia', false),
        Answer('Gato', false),
      ],
    ),
    Question(
      'Cat',
      'audioUrl',
      [
        Answer('Baleia', false),
        Answer('Gato', true),
        Answer('Cachorro', false),
      ],
    ),
    Question(
      'Whale',
      'audioUrl',
      [
        Answer('Cachorro', false),
        Answer('Baleia', true),
        Answer('Gato', false),
      ],
    ),
  ];

  static final List<Question> kitchen = [
    Question(
      'Spoon',
      'audioUrl',
      [
        Answer('Garfo', false),
        Answer('Faca', false),
        Answer('Colher', true),
      ],
    ),
    Question(
      'Knife',
      'audioUrl',
      [
        Answer('Garfo', false),
        Answer('Faca', true),
        Answer('Colher', false),
      ],
    ),
    Question(
      'Fork',
      'audioUrl',
      [
        Answer('Garfo', true),
        Answer('Faca', false),
        Answer('Colher', false),
      ],
    ),
  ];
}
