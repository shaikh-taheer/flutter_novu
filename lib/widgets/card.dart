import 'package:flutter/material.dart';
import 'package:flutter_novu/enums.dart';
import 'package:flutter_novu/types.dart';

class ExtendedCard extends StatelessWidget {
  final Widget child;
  final double padding;
  final double borderRadius;
  final double elevation;
  final String? title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final Color? color;
  final CardActionPosition actionPosition;
  final List<ActionOption>? actions;
  final double scaler;
  final Widget? status;
  final dynamic icon;

  const ExtendedCard({
    super.key,
    required this.child,
    this.padding = 5.0,
    this.borderRadius = 10.0,
    this.elevation = 1.0,
    this.title,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
    this.color,
    this.actionPosition = CardActionPosition.title,
    this.actions,
    this.scaler = 1.0,
    this.status,
    this.icon,
  });

  Widget _buildAction(BuildContext context, ActionOption action) {
    if (action.text == null) {
      return IconButton(
        onPressed: () {
          if (action.onPress != null) {
            action.onPress!();
          }
        },
        icon: Icon(action.icon!, color: action.color,)
      );
    }

    return TextButton.icon(
      onPressed: () {
        if (action.onPress != null) {
          action.onPress!();
        }
      },
      label: Text(action.text ?? '', style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: action.color
      ),),
      icon: action.icon != null ? Icon(action.icon!, size: 18, color: action.color) : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius), // You might need to adjust this value as Flutter does not normalize sizes automatically
      ),
      elevation: elevation,
      color: color,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (title?.isNotEmpty == true || subtitle?.isNotEmpty == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // if (icon != null)
                  //   ExtendedIcon(icon: icon, size: title?.isNotEmpty == true && subtitle?.isNotEmpty == true ? 60 : 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (title?.isNotEmpty == true)
                          Text(title!, style: titleStyle ?? Theme.of(context).textTheme.titleLarge, textScaler: TextScaler.linear(scaler),),
                        if (subtitle?.isNotEmpty == true)
                          Text(subtitle!, style: subtitleStyle ?? Theme.of(context).textTheme.titleSmall, textScaler: TextScaler.linear(scaler), maxLines: 1,),
                      ],
                    ),
                  ),
                  if (actions?.isNotEmpty == true && actionPosition == CardActionPosition.title)
                    ...actions!.map((action) => _buildAction(context, action)),
                  if(status != null)
                    status!,
                ],
              ),
            if (title != null || subtitle != null)
              const SizedBox(height: 5,),
            child,
            if (actions?.isNotEmpty == true && actionPosition == CardActionPosition.bottom)...[
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions!.map((action) => _buildAction(context, action)).toList(),
              )
            ]
          ],
        )
      )
    );
  }
}
