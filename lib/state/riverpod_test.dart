import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Chuck norris joke courtesy of https://api.chucknorris.io/
final testProvider = Provider<String>((_) => 'When Alexander Bell invented the telephone, he had 3 missed calls from Chuck Norris.');