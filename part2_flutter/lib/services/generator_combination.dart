import 'dart:math';

class GeneratorCombination {

  List<String> colors = ["Розовый", "Желтый", "Зелёный"];
  List<String> preview = ["Dialog", "Snackbar"];
  List<String> transition = ["СнизуВверх", "СверхуВниз", "СправаНалево"];

  List<String> currentCombination =  ["Розовый", "Snackbar", "СнизуВверх"];

  List<String> selectedCombination = [];

  void generateRandomCombination() {
    Random random = Random();

    String selectedColor = colors[random.nextInt(colors.length)];
    String selectedPreview = preview[random.nextInt(preview.length)];
    String selectedTransition = transition[random.nextInt(transition.length)];

    String combination = '$selectedColor - $selectedPreview - $selectedTransition';
    if (selectedCombination.contains(combination)) {
      // Если комбинация уже была выбрана, перегенерируем результат
      return generateRandomCombination();
    } else {
      selectedCombination.add(combination);
      currentCombination = [selectedColor, selectedPreview, selectedTransition];
      return;
    }
  }
}