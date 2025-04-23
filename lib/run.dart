import 'dart:io' as io__;
import 'dart:async' as async__;
import 'dart:convert' as convert__;
import 'package:misc/misc.dart' as misc__;

class Run {
  bool useUnixShell;
  String unixShell;
  convert__.Encoding encoding;

  Run({
    this.useUnixShell = false,
    this.unixShell = 'bash',
    this.encoding = convert__.utf8,
  });

  /// Execute command in bash
  Future<String> $(
    String command, {
    String? workingDirectory,
    Map<String, String>? environment,
    bool includeParentEnvironment = true,
    bool silent = false,
    bool ignoreError = false,
  }) async {
    List<String> split = misc__.splitCommandLine(command);
    return $$(
      split[0],
      arguments: split.sublist(1),
      workingDirectory: workingDirectory,
      environment: environment,
      silent: silent,
      ignoreError: ignoreError,
    );
  }

  /// Execute command in bash
  Future<String> $$(
    String executable, {
    List<String> arguments = const [],
    String? workingDirectory,
    Map<String, String>? environment,
    bool includeParentEnvironment = true,
    bool silent = false,
    bool ignoreError = false,
  }) async {
    workingDirectory ??= io__.Directory.current.absolute.path;
    String display = misc__.makeCommandLine([executable, ...arguments]);
    if (useUnixShell) {
      String command = misc__.makeCommandLine([executable, ...arguments]);
      executable = unixShell;
      arguments = ['-c', command];
    }
    print('[$workingDirectory] \$ $display');
    var completer = async__.Completer<String>();
    String buffer = '';
    io__.Process.start(
      executable,
      arguments,
      workingDirectory: workingDirectory,
      environment: environment,
      includeParentEnvironment: includeParentEnvironment,
      runInShell: !useUnixShell,
    ).then((process) {
      process.stdout.transform(encoding.decoder).listen((data) {
        if (!silent) {
          io__.stdout.write(data);
        }
        buffer += data;
      });
      process.stderr.transform(encoding.decoder).listen((data) {
        io__.stderr.write(data);
      });
      process.exitCode.then((code) {
        if ((!ignoreError) && code != 0) {
          throw 'ShellException($display, exitCode $code, workingDirectory: $workingDirectory)';
        }
        if (buffer.endsWith('\r\n')) {
          buffer = buffer.substring(0, buffer.length - 2);
        } else if (buffer.endsWith('\n')) {
          buffer = buffer.substring(0, buffer.length - 1);
        } else if (buffer.endsWith('\r')) {
          buffer = buffer.substring(0, buffer.length - 1);
        }
        buffer = buffer.replaceAll('\r\n', '\n');
        buffer = buffer.replaceAll('\r', '\n');
        completer.complete(buffer);
      });
    });
    return completer.future;
  }
}
