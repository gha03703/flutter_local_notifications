import 'enums.dart';
import 'icon.dart';

/// Details of a person e.g. someone who sent a message.
class Person {
  const Person({
    this.bot,
    this.icon,
    this.important,
    this.key,
    this.name,
    this.uri,
  });

  /// Whether or not this person represents a machine rather than a human.
  final bool bot;

  /// Icon for this person.
  final AndroidIcon icon;

  /// Whether or not this is an important person.
  final bool important;

  /// Unique identifier for this person.
  final String key;

  /// Name of this person.
  final String name;

  /// Uri for this person.
  final String uri;

  /// Creates a [Map] object that describes the [Person] object.
  ///
  /// Mainly for internal use to send the data over a platform channel.
  Map<String, Object> toMap() {
    return <String, Object>{
      'bot': bot,
      'important': important,
      'key': key,
      'name': name,
      'uri': uri
    }..addAll(_convertIconToMap());
  }

  Map<String, Object> _convertIconToMap() {
    if (icon is DrawableResourceAndroidIcon) {
      return <String, Object>{
        'icon': icon.icon,
        'iconSource': AndroidIconSource.DrawableResource.index,
      };
    } else if (icon is BitmapFilePathAndroidIcon) {
      return <String, Object>{
        'icon': icon.icon,
        'iconSource': AndroidIconSource.BitmapFilePath.index,
      };
    } else if (icon is ContentUriAndroidIcon) {
      return <String, Object>{
        'icon': icon.icon,
        'iconSource': AndroidIconSource.ContentUri.index,
      };
    } else if (icon is FlutterBitmapAssetAndroidIcon) {
      return <String, Object>{
        'icon': icon.icon,
        'iconSource': AndroidIconSource.FlutterBitmapAsset.index,
      };
    } else {
      return <String, Object>{};
    }
  }
}
