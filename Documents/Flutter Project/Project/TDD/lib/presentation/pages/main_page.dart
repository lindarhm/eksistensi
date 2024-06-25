import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd/presentation/bloc/product_bloc.dart';
import 'package:tdd/presentation/bloc/product_event.dart';
import 'package:tdd/presentation/bloc/product_state.dart';
import 'package:tdd/presentation/global_widget/grid_card_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    context.read<ProductBloc>().add(GetAllProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Example List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if(state is ProductLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if (state is ProductData) {
              return GridView.builder(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                  itemBuilder: (BuildContext context, int index) {
                    return const GirdCardWidget();
                  });
            } else {
              return const Text('Data Gagal Dimuat');
            }
          },
        ),
      ),
    );
  }
}
