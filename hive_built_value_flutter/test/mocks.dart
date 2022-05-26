library hive_flutter.test.mocks;

import 'package:hive_built_value/hive_built_value.dart';
import 'package:mockito/annotations.dart';

export 'mocks.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<BinaryReader>(returnNullOnMissingStub: true),
  MockSpec<BinaryWriter>(returnNullOnMissingStub: true),
])
// ignore: prefer_typing_uninitialized_variables, unused_element
var _mocks;
