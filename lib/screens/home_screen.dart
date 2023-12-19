import 'package:cubit_tutorial/screens/home_cubit.dart';
import 'package:cubit_tutorial/widgets/item_person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = BlocProvider.of(context);
  }

  void _showLoadingDialog() {
    //set up the AlertDialog
    AlertDialog alert = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(),
      ),
    );
    showDialog(
      //prevent outside touch
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        //prevent Back button press
        return WillPopScope(onWillPop: () async => false, child: alert);
      },
    );
  }

  _isThereCurrentDialogShowing() => ModalRoute.of(context)?.isCurrent != true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.resource is Loading) {
          _showLoadingDialog();
        }

        if (state.resource is Success) {
          if (_isThereCurrentDialogShowing()) {
            Navigator.of(context).pop();
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: _buildList(state),
        );
      },
    );
  }

  _buildCount(HomeState state) => Center(
        child: Column(
          children: [
            Text('Count: ${state.count}'),
            ElevatedButton(
              onPressed: () {
                _homeCubit.plusCount();
              },
              child: const Text('Plus'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                _homeCubit.minusCount();
              },
              child: const Text('Minus'),
            ),
          ],
        ),
      );

  _buildList(HomeState state) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ItemPerson();
      },
    );
  }
}
