import 'package:poetry/poetry.dart';

Future main() async {
  final app = Application<PoetryChannel>()
      ..options.configurationFilePath = "config.yaml";

  final count = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: count > 0 ? count : 1);

  print("项目启动");
}