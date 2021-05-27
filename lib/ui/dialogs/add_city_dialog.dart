import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

@immutable
class AddCityDialog extends StatefulWidget {
  final Widget child;
  const AddCityDialog({
    @required this.child,
    Key key,
  })  : assert(child != null,
            'Field child in widget AddCityDialog must not be null'),
        super(key: key);

  static _AddCityDialogState of(BuildContext context) =>
      _AddCityDialogScope.of(context)?.state;

  @override
  State<AddCityDialog> createState() => _AddCityDialogState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) =>
      super.debugFillProperties(
        properties
          ..add(
            StringProperty(
              'description',
              'AddCityDialog StatefulWidget',
            ),
          ),
      );
}

class _AddCityDialogState extends State<AddCityDialog> {
  @override
  void initState() {
    super.initState();
    // Первичная инициализация виджета
  }

  @override
  void didUpdateWidget(AddCityDialog oldWidget) {
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
              '_AddCityDialogState State<AddCityDialog>',
            ),
          ),
      );

  @override
  Widget build(BuildContext context) => _AddCityDialogScope(
        state: this,
        child: widget.child,
      );
}

@immutable
class _AddCityDialogScope extends InheritedWidget {
  final _AddCityDialogState state;

  const _AddCityDialogScope({
    @required Widget child,
    @required this.state,
    Key key,
  })  : assert(child != null,
            'Field child in widget _AddCityDialogScope must not be null'),
        assert(state is _AddCityDialogState,
            '_AddCityDialogState must not be null'),
        super(key: key, child: child);

  /// Find _AddCityDialogScope in BuildContext
  static _AddCityDialogScope of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_AddCityDialogScope>();

  @override
  bool updateShouldNotify(_AddCityDialogScope oldWidget) =>
      !identical(state, oldWidget.state) || state != oldWidget.state;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) =>
      super.debugFillProperties(
        properties
          ..add(
            StringProperty(
              'description',
              'Scope of AddCityDialog',
            ),
          )
          ..add(
            ObjectFlagProperty<_AddCityDialogState>(
              '_AddCityDialogState',
              state,
              ifNull: 'none',
            ),
          )
          ..defaultDiagnosticsTreeStyle = DiagnosticsTreeStyle.offstage,
      );
}
