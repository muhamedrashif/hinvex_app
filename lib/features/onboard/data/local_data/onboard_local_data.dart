import 'package:hinvex_app/features/onboard/data/model/onboard_model.dart';
import 'package:hinvex_app/general/utils/image_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardLocalData {
  // ONBOARD DATA
  static List<OnboardModel> list = [
    OnboardModel(
      image: ImageConstant.onBoard1,
      title: 'You Can Sell Your Property And Buy A New Property',
      content:
          'sell your property, acquire a new one, and\nseamlessly transition to the next phase of your\njourney with confidence and ease.',
    ),
    OnboardModel(
      image: ImageConstant.onBoard2,
      title: 'You Can Upload Your Property Unlimitedly',
      content:
          'You are free to upload your property without\nany limitations or restrictions, enabling you to\nshare as much as you desire.',
    ),
    OnboardModel(
      image: ImageConstant.onBoard3,
      title: 'You Can Filter Your Selection',
      content:
          'You Possess the Ability to Refine and\nCustomize Your Selection According to\nSpecific Criteria and Preferences. Explore and\nTailor Your Choices',
    ),
  ];

  // ONBOARD SAVE LOCALY

  static Future<void> onBoardLocalStore() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isOnBoarded", true);
  }
}
