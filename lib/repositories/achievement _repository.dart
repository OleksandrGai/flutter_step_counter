import '../achievement/achievement_model.dart';

class AchievementRepository {
  Achievement achievement = Achievement();

  int fetchGoal(int totalStep, List<int> achievementData) {
    int result = totalStep;

    result = achievementData.firstWhere((element) => element > result);
    return result;
  }

  int fetchNextGoal(int totalStep, List<int> achievementData) {
    if (achievementData.isEmpty) {
      return totalStep;
    }

    int index =
        achievementData.indexWhere((element) => element > totalStep) + 1;
    if (index == -1) {
      return totalStep;
    }

    int result = achievementData[index];
    return result;
  }
}
