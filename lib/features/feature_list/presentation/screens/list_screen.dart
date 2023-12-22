import 'package:chapar_task/core/utils/constants.dart';
import 'package:chapar_task/core/utils/theme.dart';
import 'package:chapar_task/features/feature_list/presentation/bloc/list_bloc.dart';
import 'package:chapar_task/features/feature_list/presentation/bloc/list_status.dart';
import 'package:chapar_task/features/feature_list/presentation/widgets/tile.dart';
import 'package:chapar_task/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
      appBar: AppBar(
        backgroundColor: AppTheme.lightTheme.primaryColorDark,
          title: const Align(
              alignment: Alignment.centerRight,
              child: Text(Constants.listAppBar))),
      body: SafeArea(
        child: BlocBuilder<ListBloc, ListState>(
          buildWhen: (previous, current) =>
              previous.listStatus != current.listStatus,
          builder: (context, state) {
            if (state.listStatus is ListLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppTheme.lightTheme.primaryIconTheme.color,
                ),
              );
            }
            if (state.listStatus is ListError) {
              return Center(
                child: Text((state.listStatus as ListError).error),
              );
            }
            //ListView works better with limited, small data but I'm using ListView.builder here,
            //Assuming that the data can potentially grow
            return Padding(
              padding: EdgeInsets.all(5.w),
              child: Container(
                decoration: AppTheme.boxDecoration,
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(3.w, 5.w, 5.w, 5.w),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount:
                      BlocProvider.of<ListBloc>(context).deliveryList.length,
                  itemBuilder: (context, index) => Tile(
                      delivery: (state.listStatus as ListCompleted)
                          .deliveryList[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
