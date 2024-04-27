import 'package:path/path.dart' as p;
import 'package:flutter_note/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class AppObjectBox {
  late final Store store;

  AppObjectBox._create(this.store);

  static Future<AppObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path));
    return AppObjectBox._create(store);
  }
}
