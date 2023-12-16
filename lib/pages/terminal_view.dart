import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pty/flutter_pty.dart';
import 'package:xterm/xterm.dart';

class MockRepl {
  MockRepl(this.onOutput) {
    onOutput('Welcome to xterm.dart!\r\n');
    onOutput('Type "help" for more information.\r\n');
    onOutput('\n');
    onOutput('\$ ');
  }

  final void Function(String data) onOutput;

  void write(String input) {
    for (var char in input.codeUnits) {
      switch (char) {
        case 13: // carriage return
          onOutput.call('\r\n');
          onOutput.call('\$ ');
          break;
        case 127: // backspace
          onOutput.call('\b \b');
          break;
        default:
          onOutput.call(String.fromCharCode(char));
      }
    }
  }
}

class MockTerminalView extends StatefulWidget {
  MockTerminalView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MockTerminalViewState createState() => _MockTerminalViewState();
}

class _MockTerminalViewState extends State<MockTerminalView> {
  final terminal = Terminal(
    maxLines: 1000,
  );

  late final MockRepl pty;

  @override
  void initState() {
    super.initState();

    pty = MockRepl(terminal.write);

    terminal.onOutput = pty.write;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: TerminalView(
          terminal,
          backgroundOpacity: 0.9,
        ),
      ),
    );
  }
}

bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

class HostTerminalView extends StatefulWidget {
  HostTerminalView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HostTerminalViewState createState() => _HostTerminalViewState();
}

class _HostTerminalViewState extends State<HostTerminalView> {
  final terminal = Terminal(
    maxLines: 10000,
  );

  final terminalController = TerminalController();

  late final Pty pty;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.endOfFrame.then(
      (_) {
        if (mounted) _startPty();
      },
    );
  }

  void _startPty() {
    pty = Pty.start(
      shell,
      columns: terminal.viewWidth,
      rows: terminal.viewHeight,
      workingDirectory: '/data/data/app.pocketdot/files',
    );

    pty.output
        .cast<List<int>>()
        .transform(Utf8Decoder())
        .listen(terminal.write);

    pty.exitCode.then((code) {
      terminal.write('the process exited with exit code $code');
    });

    terminal.onOutput = (data) {
      pty.write(const Utf8Encoder().convert(data));
    };

    terminal.onResize = (w, h, pw, ph) {
      pty.resize(h, w);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: TerminalView(
          terminal,
          controller: terminalController,
          autofocus: true,
          backgroundOpacity: 0.7,
          onSecondaryTapDown: (details, offset) async {
            final selection = terminalController.selection;
            if (selection != null) {
              final text = terminal.buffer.getText(selection);
              terminalController.clearSelection();
              await Clipboard.setData(ClipboardData(text: text));
            } else {
              final data = await Clipboard.getData('text/plain');
              final text = data?.text;
              if (text != null) {
                terminal.paste(text);
              }
            }
          },
        ),
      ),
    );
  }
}

String get shell {
  if (Platform.isMacOS || Platform.isLinux) {
    return Platform.environment['SHELL'] ?? 'bash';
  }

  if (Platform.isWindows) {
    return 'cmd.exe';
  }

  return 'sh';
}
