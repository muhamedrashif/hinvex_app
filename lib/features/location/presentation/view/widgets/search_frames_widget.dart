import 'package:flutter/material.dart';

class SearchPlaceFrame extends StatelessWidget {
  const SearchPlaceFrame({
    required this.onTap,
    super.key,
    this.formattedAdress,
  });
  final VoidCallback onTap;
  final String? formattedAdress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: const Icon(
        Icons.search_outlined,
        color: Colors.white,
      ),
      title: Text(
        formattedAdress ?? '',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
      trailing: const Icon(
        Icons.north_west_outlined,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
