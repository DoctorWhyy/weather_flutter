import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

@immutable
class WeatherDetailScreen extends StatefulWidget {
  const WeatherDetailScreen({
    Key key,
  }) : super(key: key);

  /// Для поиска _WeatherDetailScreenState в контексте
  static _WeatherDetailScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<_WeatherDetailScreenState>();

  @override
  State<WeatherDetailScreen> createState() => _WeatherDetailScreenState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) =>
      super.debugFillProperties(
        properties
          ..add(
            StringProperty(
              'description',
              'WeatherDetailScreen StatefulWidget',
            ),
          ),
      );
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  @override
  void initState() {
    super.initState();
    // Первичная инициализация виджета
  }

  @override
  void didUpdateWidget(WeatherDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Конфигурация виджета изменилась
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Изменилась конфигурация InheritedWidget'ов
    // Также вызывается после initState, но до build'а
  }

  @override
  void dispose() {
    // Перманетное удаление стейта из дерева
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) =>
      super.debugFillProperties(
        properties
          ..add(
            StringProperty(
              'description',
              '_WeatherDetailScreenState State<WeatherDetailScreen>',
            ),
          ),
      );

  @override
  Widget build(BuildContext context) => const Placeholder();
}
