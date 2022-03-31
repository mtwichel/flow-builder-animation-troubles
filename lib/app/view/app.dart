// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flow_builder_error/app/app.dart';
import 'package:flow_builder_error/flow_bloc_builder.dart';
import 'package:flow_builder_error/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider(
        create: (context) => AppCubit(),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlowBlocBuilder<AppCubit, int>(
      onGeneratePages: (state, pages) {
        if (state == 0) {
          return [
            MaterialPage<void>(
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Home'),
                ),
                body: ListView(
                  children: [
                    for (final i in [1, 2, 3, 4, 5, 6])
                      ListTile(
                        title: Text('Item $i'),
                        onTap: () => context.read<AppCubit>().update(i),
                      )
                  ],
                ),
              ),
            ),
          ];
        } else {
          return [
            MaterialPage<void>(
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Item $state'),
                  leading: IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () => context.read<AppCubit>().update(0),
                  ),
                ),
              ),
            ),
          ];
        }
      },
    );
  }
}
