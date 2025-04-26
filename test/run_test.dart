import 'package:test/test.dart';
import 'package:output/output.dart';
import 'package:run/run.dart';

void main() {
  group('Run', () {
    test('run1', () async {
      final run = Run(useUnixShell: true, unixShell: 'sh');
      await run.run$(['ls']);
      await run.run$(['ls', '-l'], autoQuote: false);
      String find = await run.run$(
        ['find', '.', '-name', '"*.dart"'],
        autoQuote: false,
        silent: true,
      );
      echo(find, r'find');
      int ls1 = await run.run$(['ls', 'xyz'], silent: true, returnCode: true);
      echo(ls1, r'ls1');
      await run.run('dart pub deps --no-dev --style list | sed "/^ .*/d"');
      final run2 = Run();
      await run2.run$(['dart', 'pub', 'deps']);
      await run2.run('"dart" "pub" "deps"');
    });
  });
}
