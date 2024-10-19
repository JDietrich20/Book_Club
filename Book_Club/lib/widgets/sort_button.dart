import 'package:flutter/material.dart';

class SortButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const SortButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 12), // Adjust padding
        backgroundColor:
            isSelected ? Colors.blueAccent : Colors.white, // Selected color
        side: BorderSide(
            color: isSelected
                ? Colors.blueAccent
                : Colors.grey), // Border color changes
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black, // Text color changes
        ),
      ),
    );
  }
}
