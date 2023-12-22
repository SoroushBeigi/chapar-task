import 'package:chapar_task/features/feature_list/presentation/bloc/list_bloc.dart';
import 'package:chapar_task/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ListBloc>(),
      child: const _ListScreen(),
    );
  }
}

class _ListScreen extends StatefulWidget {
  const _ListScreen();

  @override
  State<_ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<_ListScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListBloc>(context).add(LoadListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(children: []),
    );
  }
}
