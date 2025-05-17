import 'package:objectbox/objectbox.dart';
// @Index() for searched columns
@Entity()
class File {
  @Id()
  int id = 0;

  late String name;

  late String hash;

  late String mimeType;

  late int sizeInBytes;

  @Property(type: PropertyType.date)
  late DateTime timeCreated;

  int get dbTimeCreated => timeCreated.millisecondsSinceEpoch;

  set dbTimeCreated(int value) {
    timeCreated = DateTime.fromMillisecondsSinceEpoch(value, isUtc: true);
  }

  @Property(type: PropertyType.date)
  late DateTime timeLastModified;

  int get dbTimeLastModified => timeLastModified.millisecondsSinceEpoch;

  set dbTimeLastModified(int value) {
    timeLastModified = DateTime.fromMillisecondsSinceEpoch(value, isUtc: true);
  }
}
