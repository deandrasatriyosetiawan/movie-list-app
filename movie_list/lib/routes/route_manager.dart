import "package:get/get.dart";
import "route_name.dart";
import "/pages/welcome_page.dart";
import "/pages/sign_up_page.dart";
import "/pages/login_page.dart";
import "/pages/home_page.dart";
import "/pages/profile_page.dart";
import "/pages/logout_page.dart";
import "/pages/trending_page.dart";
import "/pages/top_rated_page.dart";
import "/pages/genre/action_genre_page.dart";
import "/pages/genre/adventure_genre_page.dart";
import "/pages/genre/animation_genre_page.dart";
import "/pages/genre/comedy_genre_page.dart";
import "/pages/genre/family_genre_page.dart";
import "/pages/genre/fantasy_genre_page.dart";
import "/pages/genre/horror_genre_page.dart";
import '/pages/genre/mystery_genre_page.dart';
import "/pages/genre/romance_genre_page.dart";
import "/pages/genre/thriller_genre_page.dart";

class RouteManager {
  static final pages = [
    GetPage(
      name: RouteName.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteName.welcomePage,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: RouteName.signUpPage,
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: RouteName.loginPage,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RouteName.profilePage,
      page: () => const ProfilePage(),
    ),
    GetPage(
      name: RouteName.logoutPage,
      page: () => const LogoutPage(),
    ),
    GetPage(
      name: RouteName.trendingPage,
      page: () => const TrendingPage(),
    ),
    GetPage(
      name: RouteName.topRatedPage,
      page: () => const TopRatedPage(),
    ),
    GetPage(
      name: RouteName.actionGenrePage,
      page: () => const ActionGenrePage(),
    ),
    GetPage(
      name: RouteName.adventureGenrePage,
      page: () => const AdventureGenrePage(),
    ),
    GetPage(
      name: RouteName.animationGenrePage,
      page: () => const AnimationGenrePage(),
    ),
    GetPage(
      name: RouteName.comedyGenrePage,
      page: () => const ComedyGenrePage(),
    ),
    GetPage(
      name: RouteName.familyGenrePage,
      page: () => const FamilyGenrePage(),
    ),
    GetPage(
      name: RouteName.fantasyGenrePage,
      page: () => const FantasyGenrePage(),
    ),
    GetPage(
      name: RouteName.horrorGenrePage,
      page: () => const HorrorGenrePage(),
    ),
    GetPage(
      name: RouteName.misteryGenrePage,
      page: () => const MysteryGenrePage(),
    ),
    GetPage(
      name: RouteName.romanceGenrePage,
      page: () => const RomanceGenrePage(),
    ),
    GetPage(
      name: RouteName.thrillerGenrePage,
      page: () => const ThrillerGenrePage(),
    ),
  ];
}
