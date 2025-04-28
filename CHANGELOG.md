# CHANGELOG.md

## 2025.423.2059

- Initial release

## 2025.423.2121

- Run.$() method now sets runInShell falg to true when useUnixShell is false

## 2025.423.2250

- Introduced Run.$() and Run.$$()

## 2025.424.19

- Updated dependincy to misc package (v2025.424.12)

## 2025.424.35

- Updated dependincy to misc package (v2025.424.28)

## 2025.424.126

- Updated package dpencencies: misc 2025.424.118 (was 2025.424.56)

## 2025.424.154

- Introduced autoQuote parameter to Run.$$()

## 2025.424.220

- Introduced _unquote()

## 2025.424.1258

- Updated package dependencies: misc 2025.424.1249 (was 2025.424.118)

## 2025.424.1312

- Modified _quote()

## 2025.424.1501

- Run.$() and Run.$$() accept returnCode named parameter and return int exitCode

## 2025.424.1840

- Removed dependency to misc package

## 2025.426.409

- Renamed Run.$() to Run.run() and Run.$$() to Run.run$()

## 2025.426.1714

- Backport from std/command_runner.dart

## 2025.426.2300

- Backport from std/command_runner.dart. Changed signature of Run.run$()

## 2025.426.2330

- Added: example/example.dart

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-version: 2025.426.2300
+version: 2025.426.2330
```

## 2025.426.2344

- Added `platform:' to pubspec.yaml

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-description: run project
-version: 2025.426.2330
+description: Wrapper over `dart:io` [Process] API's that supports additional features.
+version: 2025.426.2344
+platforms:
+  android:
+  ios:
+  linux:
+  macos:
+  #web:
+  windows:
```

## 2025.427.41

- Added topics to pubspec.yaml

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-version: 2025.426.2344
+version: 2025.427.41
+topics:
+  - cli
+  - process
-#executables:
-#  run: main
```

## 2025.427.1715

- Update dependencies

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-version: 2025.427.41
+version: 2025.427.1715
-  std: ^2025.426.2248
+  std: ^2025.427.52
```

## 2025.428.1657

- Changed default encoding from utf8 to SystemEncoding()

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-version: 2025.427.1715
+version: 2025.428.1657
```

## 2025.428.1720

- Update dpendency to std package

```
--- a/pubspec.yaml
+++ b/pubspec.yaml
-version: 2025.428.1657
+version: 2025.428.1720
-  std: ^2025.427.52
+  std: ^2025.428.1703
```
