import 'package:changescenario/classes/Scenario.dart';
import 'package:share/share.dart';

Future shareScenario(Scenario scenarioToShare) async {
  final title = scenarioToShare.title;
  // final script = scenarioToShare.script.length > 250
  //     ? scenarioToShare.script.substring(0, 200)
  //     : scenarioToShare.script;
  final script = scenarioToShare.script;
  final filmName = scenarioToShare.film;

  final writer = scenarioToShare.scriptChanger;

  final promotionalText = """
Change The Scenario is a great place to share your scenario script. Come and join us!
""";

  final toShare = "New Scenario For $filmName!\n" +
      title +
      "\n\n" +
      script +
      "\n" +
      writer +
      "\n\n\n" +
      promotionalText;

  await Share.share(toShare);
}
