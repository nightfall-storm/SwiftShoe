import 'package:get/get.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/password_configuration/forget_password.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/category/category.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/product_reviews/product_reviews.dart';
import '../features/shop/screens/wishlist/wishlist.dart';
import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: AkRoutes.home, page: () => const HomeScreen()),
    GetPage(name: AkRoutes.category, page: () => const CategoryScreen()),
    GetPage(name: AkRoutes.wishList, page: () => const WishListScreen()),
    // GetPage(name: AkRoutes.search, page: () => const SearchScreen()),
    GetPage(name: AkRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: AkRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: AkRoutes.order, page: () => const OrderScreen()),
    GetPage(name: AkRoutes.cart, page: () => const CartScreen()),
    GetPage(name: AkRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: AkRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: AkRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: AkRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: AkRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: AkRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: AkRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}