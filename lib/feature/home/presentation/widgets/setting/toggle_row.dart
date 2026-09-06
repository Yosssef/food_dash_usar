import 'package:flutter/material.dart';
import 'package:shopix_user/feature/home/presentation/widgets/setting/row_shell.dart';

class ToggleRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? inactivecolor;
  final Color? activecolor;

  const ToggleRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
    this.inactivecolor,
    this.activecolor,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return RowShell(
      icon: icon,
      label: label,
      onTap: () => onChanged(!value),
      trailing: Switch.adaptive(
        value: value,
        onChanged: onChanged,
        activeThumbColor: activecolor ?? scheme.secondary,
        inactiveThumbColor: inactivecolor,
        inactiveTrackColor: inactivecolor?.withAlpha(130),
      ),
    );
  }
}
