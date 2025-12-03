import 'dart:io';

void main() {
  // Path to the problematic Firebase file
  var path = r'build\windows\x64\extracted\firebase_cpp_sdk_windows\CMakeLists.txt';
  var file = File(path);

  if (file.existsSync()) {
    var content = file.readAsStringSync();
    // Check if it's the old version
    if (content.contains('VERSION 3.1')) {
      // Replace it with the new version
      file.writeAsStringSync(content.replaceAll('VERSION 3.1', 'VERSION 3.10'));
      print('✅ SUCCESS: Firebase CMake file fixed to VERSION 3.10');
    } else {
      print('ℹ️  File is already fixed.');
    }
  } else {
    print('❌ ERROR: File not found. You must run "flutter run -d windows" once first.');
  }
}