import 'package:poetry/poetry.dart';

class PoetryEntity extends ManagedObject<_PoetryEntity> implements _PoetryEntity {}

class _PoetryEntity {
  @primaryKey//作为主键 == @
  int id;

  String name;//作品名

  String dynasty;//朝代

  String author;//作者

  String content;//内容

  String translatedText;//翻译

  String genre;//体裁

  String tag;//标签

  String keyword;//关键字

  int time;//搜索次数
}