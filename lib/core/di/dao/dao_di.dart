import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/data/dao/user_dao.dart';

part 'dao_di.g.dart';

@riverpod
UserDao userDao(UserDaoRef ref) {
  return UserDao();
}

