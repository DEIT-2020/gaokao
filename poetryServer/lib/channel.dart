import 'poetry.dart';
import 'app_config.dart';
import 'poetryEntity.dart';


class PoetryChannel extends ApplicationChannel {
  ManagedContext context;//可通过该实例操作数据库

  @override
  Future prepare() async {
    final AppConfig _config = AppConfig(options.configurationFilePath);
    options.port = _config.port;
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();//描述应用程序的数据模型
    final psc = PostgreSQLPersistentStore.fromConnectionInfo(
        _config.database.username,
        _config.database.password,
        _config.database.host,
        _config.database.port,
        _config.database.databaseName);//管理与单个数据库的连接
    context=ManagedContext(dataModel, psc);
  }

  @override
  Controller get entryPoint {
    final router = Router();



    router.route('/queryPoetry/:id').linkFunction((request) async {
      final id = request.path.variables['id']; //获取路径上的id变量
      if (int.tryParse(id) != null) {//判断是否为int类型
        final query = Query<PoetryEntity>(context)
          ..where((a) => a.id).equalTo(int.parse(id));//查询id对应的文章
        final poetry = await query.fetchOne();//查询第一条
        final poetryClone = Query<PoetryEntity>(context)
          ..values.time = poetry.time+1
          ..where((a) => a.id).equalTo(int.parse(id));
        final res = await poetryClone.updateOne();
        if(poetry!=null){ //判断是否存在
          return Response.ok(poetry); //查询成功，返回文章
        }else{
          return Response.ok({"msg":"no exist"});//不存在该文章
        }
      }else{
        return Response.badRequest(body:{"msg":"error"});//查询失败，id不是int类型
      }
    });



    return router;
  }
}