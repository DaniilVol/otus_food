List<Recipes> myRecipes = [
  Recipes(
      nameRecipes: 'Лосось в соусе терияки',
      timeRecipes: '45 минут',
      imgRecipes: 'assets/img/salmon.jpg',
      stepTimeRecipes: [
        '06:00',
        '07:00',
        '06:00',
        '01:00',
        '06:00',
        '15:00',
        '04:00'
      ],
      stepTextRecipes: [
        'В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.',
        'Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.',
        'Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.',
        'Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.',
        'Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.',
        'Поставьте в разогретую до 200 °C духовку примерно на 15 минут.',
        'Перед подачей полейте соусом из формы и посыпьте кунжутом.',
      ]),
  Recipes(
      nameRecipes: 'Поке боул с сыром тофу',
      timeRecipes: '30 минут',
      imgRecipes: 'assets/img/poke.jpeg'),
  Recipes(
      nameRecipes: 'Стейк из говядины по-грузински с картошкой',
      timeRecipes: '1 час 15 минут',
      imgRecipes: 'assets/img/steak.jpg'),
  Recipes(
      nameRecipes: 'Тосты с голубикой и бананом',
      timeRecipes: '45 минут',
      imgRecipes: 'assets/img/toast.jpg'),
  Recipes(
      nameRecipes: 'Паста с морепродуктами',
      timeRecipes: '25 минут',
      imgRecipes: 'assets/img/pasta.jpg'),
  Recipes(
      nameRecipes: 'Бургер с двумя котлетами',
      timeRecipes: '1 час',
      imgRecipes: 'assets/img/burger.jpg'),
  Recipes(
      nameRecipes: 'Пицца Маргарита домашняя',
      timeRecipes: '25 минут',
      imgRecipes: 'assets/img/pizza.jpg'),
];

class Recipes {
  final String nameRecipes;
  final String timeRecipes;
  final String imgRecipes;
  final List<String> stepTextRecipes;
  final List<String> stepTimeRecipes;
  final List<String> ingredientName;
  final List<String> ingredientValue;

  Recipes({
    required this.nameRecipes,
    required this.timeRecipes,
    required this.imgRecipes,
    this.stepTextRecipes = const [
      'В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.',
      'Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.',
      'Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.',
      'Готовьте, непрерывно помешивая венчиком, 1 минуту. Снимите с огня и немного остудите.',
      'Смажьте форму маслом и выложите туда рыбу. Полейте её соусом.',
      'Поставьте в разогретую до 200 °C духовку примерно на 15 минут.',
      'Перед подачей полейте соусом из формы и посыпьте кунжутом.',
    ],
    this.stepTimeRecipes = const [
      '06:00',
      '07:00',
      '06:00',
      '01:00',
      '06:00',
      '15:00',
      '04:00',
    ],
    this.ingredientName = const [
      'Соевый соус',
      'Вода',
      'Мёд',
      'Коричневый сахар',
      'Чеснок',
      'Тёртый свежий имбирь',
      'Лимонный сок',
      'Кукурузный крахмал',
      'Растительное масло',
      'Филе лосося или сёмги',
      'Кунжут'
    ],
    this.ingredientValue = const [
      '8 ст. ложек',
      '8 ст. ложек',
      '3 ст. ложки',
      '2 ст. ложки',
      '3 зубчика',
      '1 ст. ложка',
      '1¹⁄₂ ст. ложки',
      '1 ст. ложка',
      '1 ч. ложка',
      '680 г.',
      'по вкусу',
    ],
  });

  Map<String, dynamic> toMap() {
    return {
      'nameRecipes': nameRecipes,
      'timeRecipes': timeRecipes,
      'imgRecipes': imgRecipes,
      'stepTextRecipes': stepTextRecipes.toList(),
      'stepTimeRecipes': stepTimeRecipes.toList(),
    };
  }
}
