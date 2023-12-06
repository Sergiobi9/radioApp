import 'package:share_plus/share_plus.dart';

class ShareUtils {
  static share(url, {String subject = "Look what I am listening to"}) async {
    await Share.share(url, subject: subject);
  }
}
