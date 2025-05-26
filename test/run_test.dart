import 'dart:convert' as dart_convert;
import 'package:test/test.dart';
import 'package:output/output.dart';
import 'package:run/run.dart';

void main() {
  group('Run', () {
    test('run1', () async {
      final run = Run(
        /*encoding: SystemEncoding(),*/ useUnixShell: true,
        unixShell: 'sh',
      );
      await run.run$(
        ['ls'],
        encoding: dart_convert.utf8,
        workingDirectory: '~/',
      );
      await run.run$(
        ['ls', '-l'],
        encoding: dart_convert.utf8,
        autoQuote: false,
      );
      String find = await run.run$(
        ['find', '.', '-name', '"*.dart"'],
        autoQuote: false,
        silent: true,
      );
      echo(find, r'find');
      int ls1 = await run.run$(
        ['ls', 'xyz'],
        encoding: dart_convert.utf8,
        silent: true,
        returnCode: true,
      );
      echo(ls1, r'ls1');
      await run.run('dart pub deps --no-dev --style list | sed "/^ .*/d"');
      final run2 = Run(/*encoding: SystemEncoding()*/);
      //await run2.run$(['dart', 'pub', 'deps']);
      //await run2.run('"dart" "pub" "deps"');
      await run2.run('ping -n 2 www.youtube.com');
    });
  });
}
