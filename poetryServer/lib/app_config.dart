import 'poetry.dart';

class AppConfig extends Configuration{
  AppConfig(String path):super.fromFile(File(path));

  int port;

  DatabaseConfiguration database;
}