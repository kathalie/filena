import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../common/data/db/database.dart';

part 'db_di.g.dart';

@riverpod
Future<Isar> isarDb(IsarDbRef ref) async {
  return isarDbConnection();
}