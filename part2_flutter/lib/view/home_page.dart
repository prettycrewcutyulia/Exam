import 'package:flutter/material.dart';
import 'package:part2_flutter/services/generator_combination.dart';
import 'package:part2_flutter/view/components/custom_button.dart';
import 'package:part2_flutter/view/criteria_page.dart';

import 'components/name_section_title.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GeneratorCombination service = GeneratorCombination();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text(
            "Подбор варинта на экзамен",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            const NameSectionTitle(
              title: 'Основной цвет',
            ),
            Row(
              children: [
                CustomButton(
                    title: "Розовый",
                    selected: service.currentCombination[0] == "Розовый"),
                CustomButton(
                    title: "Желтый",
                    selected: service.currentCombination[0] == "Желтый"),
                CustomButton(
                    title: "Зелёный",
                    selected: service.currentCombination[0] == "Зелёный")
              ],
            ),
            const NameSectionTitle(
              title: 'Показ результата',
            ),
            Row(
              children: [
                CustomButton(
                    title: "Dialog",
                    selected: service.currentCombination[1] == "Dialog"),
                CustomButton(
                    title: "Snackbar",
                    selected: service.currentCombination[1] == "Snackbar"),
              ],
            ),
            const NameSectionTitle(
              title: 'Переход между экранами',
            ),
            Row(
              children: [
                CustomButton(
                    title: "Снизу вверх",
                    selected: service.currentCombination[2] == "СнизуВверх"),
                CustomButton(
                    title: "Сверху вниз",
                    selected: service.currentCombination[2] == "СверхуВниз"),
                CustomButton(
                    title: "Справа налево",
                    selected: service.currentCombination[2] == "СправаНалево"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        service.generateRandomCombination();
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Вариант подобран! \n Основной цвет: ${service.currentCombination[0]}\n Показ результата: ${service.currentCombination[1]}\n Переход между экранами: ${service.currentCombination[2]}'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink, // Цвет кнопки
                    ),
                    child: const Text(
                      'Подобрать вариант',
                      style: TextStyle(color: Colors.white), // Цвет текста
                    ),
                  ),
                  const SizedBox(width: 20), // Пространство между кнопками
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const CriteriaPage(
                                title: "Критерии"); // Замените на вашу страницу
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(1.0, 0.0),
                                // Стартовая позиция анимации
                                end: const Offset(
                                    0.0, 0.0), // Конечная позиция анимации
                              ).animate(animation),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink, // Цвет кнопки
                    ),
                    child: const Text(
                      'Открыть критерии',
                      style: TextStyle(color: Colors.white), // Цвет текста
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
