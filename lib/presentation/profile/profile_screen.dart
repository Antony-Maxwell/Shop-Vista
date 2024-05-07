import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_vista/application/home/user_bloc/user_bloc.dart';
import 'package:shop_vista/application/profile/Orders/orders_bloc.dart';
import 'package:shop_vista/core/constants/sizedBox.dart';
import 'package:shop_vista/infrastructure/emailandpass_auth_impl/firebase_auth_service.dart';
import 'package:shop_vista/presentation/home/cart/cart_screen.dart';
import 'package:shop_vista/presentation/profile/settings_screens/account_privacy.dart';
import 'package:shop_vista/presentation/profile/settings_screens/edit_profile.dart';
import 'package:shop_vista/presentation/profile/settings_screens/my_address.dart';
import 'package:shop_vista/presentation/profile/settings_screens/my_orders.dart';
import 'package:shop_vista/presentation/profile/widgets/profile_settings_widget.dart';
import 'package:shop_vista/presentation/profile/widgets/settings_heading.dart';
import 'package:shop_vista/presentation/profile/widgets/settings_list.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:shop_vista/presentation/widgets/blue_button.dart';
import 'package:shop_vista/presentation/widgets/t_primary_header_container.dart';
import 'package:provider/provider.dart';
import 'package:shop_vista/utils/theme/custom_themes/appbar_themes.dart';
import 'package:shop_vista/utils/theme/custom_themes/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TPrimaryHeaderContainer(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10), // Add some spacing
                  UserProfileSettings(
                    onpressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileScreen(),));
                    },
                  ),
                ],
              ),
            ),
            const SettingsHeading(heading: 'Account Settings'),
            const AccountSettingsList(icon: Iconsax.location, subTitle: 'Set shopping delivery address', title: 'My Address' ,  screenPage: MyAddressScreen()),
            const AccountSettingsList(icon: Icons.account_balance_wallet_outlined, subTitle: 'In-progress and Completed Orders', title: 'My Orders', screenPage: MyOrdersScreen()),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if(state.isLoading){
                  return const AccountSettingsList(icon: Iconsax.bag, subTitle: 'Add, remove products and move to checkout', title: 'My Cart', screenPage: CartScreen(userId: ''));
                }else{
                  BlocProvider.of<OrdersBloc>(context).add(OrdersEvent.getOrdersList(state.user.userId));
                return AccountSettingsList(icon: Iconsax.bag, subTitle: 'Add, remove products and move to checkout', title: 'My Cart', screenPage: CartScreen(userId: state.user.userId));
              }
              }
            ),
            const AccountSettingsList(icon: Icons.privacy_tip_outlined, subTitle: 'See our privacy policy and connect with us', title: 'Privacy policy & Contact', screenPage: AccountPrivacyScreen()),
            kHeight,
            const Divider(thickness: 2,),
            const SettingsHeading(heading: 'Application Settings'),
            ListTile(
              title: Text('Switch theme', style: Theme.of(context).textTheme.headlineSmall,),
              trailing: Switch(
                value: themeProvider.themeData == TAppBarTheme.lightAppBarTheme, 
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Sign(title: 'Log Out', color: Colors.blue, fontColor: Colors.white, isSignUp: false, onTap: () { 
                FirebaseAuthServices().signOut(context);
                }),
            ),
            const SizedBox(height: 10,),
            kHeight,
            kHeight,
            const Center(
              child: Text(
                'ShopVista\n      v1.0'
              ),
            )
          ],
        ),
      ),
    );
  }
}
