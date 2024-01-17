import 'package:hive_flutter/adapters.dart';
import 'nisis_dto.dart';
import 'nisis_role_model.dart';

const String nisisRoleBox = 'nisisRoleBox';

class NisisRoleRepository {
  NisisRoleRepository._constructor();

  static final NisisRoleRepository _instance =
  NisisRoleRepository._constructor();

  factory NisisRoleRepository() => _instance;

  late Box<NisisRoleModel> _nisisRolesBox;

  Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter<NisisRoleModel>(NisisRoleModelAdapter());
    _nisisRolesBox = await Hive.openBox<NisisRoleModel>(nisisRoleBox);
  }

  NisisRoleDto nisisRoleDtoFromDb(NisisRoleModel nisisRoleModel) =>
      NisisRoleDto(
          dataCapture: nisisRoleModel.dataCapture,
          manager: nisisRoleModel.manager);

  NisisRoleModel nisisRoleToDb(NisisRoleDto? nisisRoleDto) => NisisRoleModel(
      dataCapture: nisisRoleDto?.dataCapture, manager: nisisRoleDto?.manager);
}
