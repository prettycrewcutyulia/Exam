import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CriteriaPage extends StatelessWidget {
  final String title;

  const CriteriaPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.pink,
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.white,
              ),
            ),
            leading: const BackButton(color: Colors.black)),
        body: Column(
          children: [
            const Text(
              "Описание задачи",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                letterSpacing: 2,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: () async {
                String url =
                    "https://docs.google.com/spreadsheets/d/1Ed-MxEyQHsdHatvTZ4RUNuQ6r5onk18-lCLJbiN6GAA/edit#gid=0";
                Uri uri = Uri.parse(url);
                try {
                  await launchUrl(uri);
                } catch (error) {
                  debugPrint('Could not launch $url');
                }
              },
              child: const Text('Открыть критерии в браузере',
                  style: TextStyle(fontSize: 20)),
            ),
            const Text(
              "Видео с демонстрацией",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                letterSpacing: 2,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              onPressed: () async {
                String url = "https://disk.yandex.ru/i/SaeLltKp4gaIpg";
                Uri uri = Uri.parse(url);
                try {
                  await launchUrl(uri);
                } catch (error) {
                  debugPrint('Could not launch $url');
                }
              },
              child: const Text('Открыть видео в браузере',
                  style: TextStyle(fontSize: 20)),
            ),
          ],
        ));
  }
}
