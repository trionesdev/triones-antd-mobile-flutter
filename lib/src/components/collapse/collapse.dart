import 'package:flutter/material.dart';
import 'package:trionesdev_antd_mobile/trionesdev_antd_mobile.dart';

class AntCollapse extends StatefulWidget {
  const AntCollapse(
      {super.key,
      this.accordion = false,
      this.children = const [],
      this.activeKeys,
      this.defaultActiveKeys});

  final bool accordion;
  final List<String>? defaultActiveKeys;
  final List<String>? activeKeys;
  final List<AntCollapsePanel> children;

  @override
  State<StatefulWidget> createState() => AntCollapseState();

  static AntCollapseState? maybeOf(BuildContext context) {
    _AntCollapseScope? scope =
        context.dependOnInheritedWidgetOfExactType<_AntCollapseScope>();
    return scope?._collapseState;
  }
}

class AntCollapseState extends State<AntCollapse> {
  List<String> _actveKeys = [];
  int _generation = 0;
  final Set<AntCollapsePanelState> _panelStates = {};

  List<String>? get currentActiveKey {
    AntCollapseState? collapseState = AntCollapse.maybeOf(context);
    return collapseState?.widget.defaultActiveKeys ??
        collapseState?.widget.activeKeys;
  }

  void _forceRebuild() {
    setState(() {
      ++_generation;
    });
  }

  void _register(AntCollapsePanelState state) {
    _panelStates.add(state);
  }

  void _unregister(AntCollapsePanelState state) {
    _panelStates.remove(state);
  }

  void _open(AntCollapsePanelState state) {
    if (state.widget.antKey?.isEmpty ?? false) {
      return;
    }
    if (widget.accordion) {
      setState(() {
        _actveKeys = [state.widget.antKey!];
      });
    } else {
      if (!_actveKeys.contains(state.widget.antKey)) {
        setState(() {
          _actveKeys = [..._actveKeys, state.widget.antKey!];
        });
      }
    }
    _forceRebuild();
  }

  void _close(AntCollapsePanelState state) {
    if (state.widget.antKey?.isEmpty ?? false) {
      return;
    }
    if (widget.accordion) {
      setState(() {
        _actveKeys = [];
      });
    } else {
      _actveKeys.remove(state.widget.antKey!);
      setState(() {
        _actveKeys = [..._actveKeys];
      });
    }
    _forceRebuild();
  }

  @override
  void initState() {
    _actveKeys = widget.activeKeys ?? widget.defaultActiveKeys ?? [];
    super.initState();
  }

  @override
  void didUpdateWidget(AntCollapse oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activeKeys != widget.activeKeys) {
      setState(() {
        _actveKeys = widget.activeKeys ?? [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        child: _AntCollapseScope(
            generation: _generation,
            collapseState: this,
            child: Column(
              children: widget.children,
            )));
  }
}

class _AntCollapseScope extends InheritedWidget {
  const _AntCollapseScope(
      {required super.child,
      required int generation,
      required final AntCollapseState collapseState})
      : _generation = generation,
        _collapseState = collapseState;
  final int _generation;
  final AntCollapseState _collapseState;

  @override
  bool updateShouldNotify(covariant _AntCollapseScope oldWidget) {
    return _generation != oldWidget._generation;
  }
}

class AntCollapsePanelStyles {
  AntCollapsePanelStyles({this.header, this.content});

  final StateStyle? header;
  final StateStyle? content;
}

class AntCollapsePanel extends StatefulWidget {
  const AntCollapsePanel(
      {super.key,
      this.title,
      this.extra,
      this.disabled,
      this.arrowIcon,
      this.content,
      required this.antKey,
      this.styles});

  final String antKey;
  final Widget? title;
  final Widget? extra;
  final bool? disabled;
  final Widget Function(bool open)? arrowIcon;
  final Widget? content;
  final AntCollapsePanelStyles? styles;

  @override
  State<StatefulWidget> createState() => AntCollapsePanelState();
}

class AntCollapsePanelState extends State<AntCollapsePanel>
    with MaterialStateMixin {
  bool _open = false;

  bool get open {
    AntCollapseState? collapseState = AntCollapse.maybeOf(context);
    if (collapseState != null) {
      return collapseState._actveKeys.contains(widget.antKey);
    }
    return _open;
  }

  Widget get _arrowIcon {
    AntThemeData themeData = AntTheme.of(context);
    return widget.arrowIcon?.call(_open) ??
        (_open
            ? Icon(
                Icons.keyboard_arrow_up_sharp,
                color: themeData.colorBorder,
              )
            : Icon(Icons.keyboard_arrow_down_sharp,
                color: themeData.colorBorder));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    AntCollapseState? collapseState = AntCollapse.maybeOf(context);
    collapseState?._unregister(this);
  }

  @override
  Widget build(BuildContext context) {
    AntCollapseState? collapseState = AntCollapse.maybeOf(context);
    collapseState?._register(this);
    StateStyle headerStyle = AntCollapsePanelHeaderStyle(context);
    headerStyle = headerStyle.merge(widget.styles?.header);
    StateStyle contentStyle = AntCollapsePanelContentStyle(context);
    contentStyle = contentStyle.merge(widget.styles?.content);
    return Container(
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (widget.disabled ?? false) {
                return;
              }
              _open = !_open;
              if (widget.antKey == null) {
                return;
              }
              if (collapseState != null) {
                if (_open) {
                  collapseState._open(this);
                } else {
                  collapseState._close(this);
                }
                return;
              }
              setState(() {});
            },
            child: Container(
              decoration:
                  headerStyle.resolve(materialStates)?.computedDecoration,
              constraints:
                  headerStyle.resolve(materialStates)?.computedConstraints,
              padding: headerStyle.resolve(materialStates)?.computedPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.title ?? Container(),
                  Row(
                    children: [
                      if (widget.extra != null) widget.extra!,
                      _arrowIcon
                    ],
                  )
                ],
              ),
            ),
          ),
          Visibility(
              visible: _open,
              child: Container(
                  width: double.infinity,
                  decoration:
                      contentStyle.resolve(materialStates)?.computedDecoration,
                  child: widget.content))
        ],
      ),
    );
  }
}

class AntCollapsePanelHeaderStyle extends StateStyle {
  AntCollapsePanelHeaderStyle(this.context);

  final BuildContext context;

  @override
  Style get style {
    return Style(
      minHeight: 40,
      borderBottom: StyleBorder(
        color: AntTheme.of(context).colorBorder,
        width: 1,
        style: BorderStyle.solid,
      ),
      padding: StylePadding.symmetric(horizontal: 8),
    );
  }
}

class AntCollapsePanelContentStyle extends StateStyle {
  AntCollapsePanelContentStyle(this.context);

  final BuildContext context;

  @override
  Style get style {
    return Style(
      borderBottom: StyleBorder(
        color: AntTheme.of(context).colorBorder,
        width: 1,
        style: BorderStyle.solid,
      ),
    );
  }
}
