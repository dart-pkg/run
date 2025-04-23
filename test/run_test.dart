import 'package:test/test.dart';
import 'package:output/output.dart';
import 'package:run/run.dart';

void main() {
  group('Run', () {
    test('run1', () async {
      final run = Run(useUnixShell: true, unixShell: 'sh');
      await run.$$('ls');
      await run.$$('ls', arguments: ['-l']);
      String find = await run.$$(
        'find',
        arguments: ['.', '-name', '*.dart'],
        silent: true,
      );
      echo(find, r'find');
      String ls1 = await run.$$(
        'ls',
        arguments: ['xyz'],
        silent: true,
        ignoreError: true,
      );
      echo(ls1, r'ls1');
      await run.$('dart pub deps --no-dev --style list | sed "/^ .*/d"');
      // String ls2 = await run.$('ls', arguments: ['xyz'], silent: true, ignoreError: false);
      // echo(ls2, r'ls2');
      //final run2 = Run();
      //await run2.$$('dart', arguments: ['pub', 'deps']);
    });
  });
}
