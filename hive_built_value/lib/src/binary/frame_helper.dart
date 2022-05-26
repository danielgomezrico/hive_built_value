import 'dart:typed_data';

import 'package:hive_built_value/hive.dart';
import 'package:hive_built_value/src/binary/binary_reader_impl.dart';
import 'package:hive_built_value/src/box/keystore.dart';

/// Not part of public API
class FrameHelper {
  /// Not part of public API
  int framesFromBytes(
    Uint8List bytes,
    Keystore? keystore,
    TypeRegistry registry,
    HiveCipher? cipher,
  ) {
    var reader = BinaryReaderImpl(bytes, registry);

    while (reader.availableBytes != 0) {
      var frameOffset = reader.usedBytes;

      var frame = reader.readFrame(
        cipher: cipher,
        lazy: false,
        frameOffset: frameOffset,
      );
      if (frame == null) return frameOffset;

      keystore!.insert(frame, notify: false);
    }

    return -1;
  }
}
