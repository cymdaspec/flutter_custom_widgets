import 'package:flutter/material.dart';
import 'package:flutter_custom_widgets/widgets/music_player/music_player.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const HotreloadWidgetbook());
}

class HotreloadWidgetbook extends StatelessWidget {
  const HotreloadWidgetbook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'widgets',
          widgets: [
            WidgetbookComponent(
              name: 'Player',
              useCases: [
                WidgetbookUseCase(
                  name: 'regular',
                  builder: (context) => Center(
                      child: Player(audio: 'https://www.naijafinix.com.ng/wp-content/uploads/2022/02/Yung-Lean-%E2%80%93-Ginseng-Strip-2002-via-Naijafinix.com_.mp3?_=1'))
                  ),
              ],
            ),
          ],
        )
      ],
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: ThemeData.dark(),
        ),
      ],
      appInfo: AppInfo(name: 'Example'),
    );
  }
}















/*

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({
    Key? key,
}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Widgetbook(
        categories: [],
        appInfo: AppInfo(
          name: 'Custom Widgets',
        ),
      themes: [],
    );
  }
}

void main() {
  runApp(
    WidgetbookHotReload(),
  );
}

 */