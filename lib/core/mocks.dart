import 'package:equatable/equatable.dart';

class CardData extends Equatable{
  const CardData({
    required this.imageId,
    required this.title,
    required this.subtitle,
  });

  final int imageId;
  final String title;
  final String subtitle;

  @override
  List<Object?> get props => [imageId, title, subtitle];
}

const List<CardData> homeMocks = [
  CardData(
    imageId: 10,
    title: 'Горные вершины',
    subtitle: 'Захватывающие пейзажи высокогорных хребтов',
  ),
  CardData(
    imageId: 20,
    title: 'Городские огни',
    subtitle: 'Ночная жизнь мегаполисов со всего мира',
  ),
  CardData(
    imageId: 30,
    title: 'Океанский рассвет',
    subtitle: 'Первые лучи солнца над бескрайним океаном',
  ),
  CardData(
    imageId: 40,
    title: 'Северный лес',
    subtitle: 'Тишина и величие таёжных просторов',
  ),
  CardData(
    imageId: 50,
    title: 'Пустынные дюны',
    subtitle: 'Бесконечные золотые пески под палящим солнцем',
  ),
  CardData(
    imageId: 60,
    title: 'Цветущие сады',
    subtitle: 'Яркие краски весны в ботанических садах',
  ),
  CardData(
    imageId: 70,
    title: 'Подводный мир',
    subtitle: 'Тайны и красота глубин мирового океана',
  ),
  CardData(
    imageId: 80,
    title: 'Арктические льды',
    subtitle: 'Суровая красота полярных широт',
  ),
  CardData(
    imageId: 90,
    title: 'Старинные замки',
    subtitle: 'Архитектура и история средневековой Европы',
  ),
  CardData(
    imageId: 100,
    title: 'Дикая природа',
    subtitle: 'Животные в их естественной среде обитания',
  ),
  CardData(
    imageId: 110,
    title: 'Вулканические острова',
    subtitle: 'Молодые земли, рождённые из огня и воды',
  ),
  CardData(
    imageId: 120,
    title: 'Речные долины',
    subtitle: 'Спокойное течение среди живописных берегов',
  ),
  CardData(
    imageId: 130,
    title: 'Звёздное небо',
    subtitle: 'Млечный путь над тёмными горизонтами',
  ),
  CardData(
    imageId: 140,
    title: 'Туманные горы',
    subtitle: 'Мистика утренних туманов в предгорьях',
  ),
  CardData(
    imageId: 150,
    title: 'Морские скалы',
    subtitle: 'Вечный поединок волн и камня у берегов',
  ),
  CardData(
    imageId: 160,
    title: 'Осенний лес',
    subtitle: 'Золото и багрянец листопада',
  ),
  CardData(
    imageId: 170,
    title: 'Тропические джунгли',
    subtitle: 'Буйство жизни в экваториальных лесах',
  ),
  CardData(
    imageId: 180,
    title: 'Степные просторы',
    subtitle: 'Бесконечные равнины под облачным куполом',
  ),
  CardData(
    imageId: 190,
    title: 'Ледниковые озёра',
    subtitle: 'Кристально чистая вода высокогорных озёр',
  ),
  CardData(
    imageId: 200,
    title: 'Закат в саванне',
    subtitle: 'Последние лучи солнца над африканской равниной',
  ),
];
