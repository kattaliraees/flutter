// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

class _TooltipVisibilityScope extends InheritedWidget {
  const _TooltipVisibilityScope({
    Key? key,
    required Widget child,
    required this.visible,
  }) : super(key: key, child: child);

  final bool visible;

  @override
  bool updateShouldNotify(_TooltipVisibilityScope old) {
    return old.visible != visible;
  }
}

/// Overrides the visibility of descendant [Tooltip] widgets.
///
/// If disabled, the descendant [Tooltip] widgets will not display a tooltip
/// when tapped, long-pressed, hovered by the mouse, or when
/// `ensureTooltipVisible` is called. This only visually disables tooltips but
/// continues to provide any semantic information that is provided.
class TooltipVisibility extends StatelessWidget {
  /// Creates a widget that configures the visibility of [Tooltip].
  ///
  /// Both arguments must not be null.
  const TooltipVisibility({
    Key? key,
    required this.child,
    required this.visible,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// The entire app can be wrapped in this widget to globally control [Tooltip]
  /// visibility.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  /// Determines the visibility of [Tooltip] widgets that inherit from this widget.
  final bool visible;

  /// The [visible] of the closest instance of this class that encloses the
  /// given context. Defaults to `true` if none are found.
  static bool of(BuildContext context) {
    final _TooltipVisibilityScope? visibility = context.dependOnInheritedWidgetOfExactType<_TooltipVisibilityScope>();
    return visibility?.visible ?? true;
  }

  @override
  Widget build(BuildContext context) {
    return _TooltipVisibilityScope(
      child: child,
      visible: visible,
    );
  }
}