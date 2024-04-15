import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/curved_widget.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(const LoadUserDetails());
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return TCurvedEdgeWidget(
          child: SizedBox(
            height: 350,
            child: Container(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Stack(
                  children: [
                    child,
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
