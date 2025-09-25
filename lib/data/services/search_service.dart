import 'package:flutter/material.dart';
import '../models/menu_item_model.dart';

class SearchService {
  static List<MenuItemModel> searchItems(
    List<MenuItemModel> items,
    String query,
  ) {
    if (query.trim().isEmpty) {
      return items;
    }

    final searchQuery = query.toLowerCase().trim();

    return items.where((item) {
      return _matchesSearchQuery(item, searchQuery);
    }).toList();
  }

  static bool _matchesSearchQuery(MenuItemModel item, String query) {
    // Search in item name
    if (item.itemName.toLowerCase().contains(query)) {
      return true;
    }

    // Search in item description
    if (item.itemDescription.toLowerCase().contains(query)) {
      return true;
    }

    // Search in restaurant name
    if (item.restaurantName.toLowerCase().contains(query)) {
      return true;
    }

    // Fuzzy search - check if query words are contained in item name or description
    final queryWords = query.split(' ');
    final itemText =
        '${item.itemName} ${item.itemDescription} ${item.restaurantName}'
            .toLowerCase();

    return queryWords.every((word) => itemText.contains(word));
  }

  // Get search suggestions based on available items
  static List<String> getSearchSuggestions(
    List<MenuItemModel> items,
    String query,
  ) {
    if (query.trim().isEmpty) {
      return [];
    }

    final searchQuery = query.toLowerCase().trim();
    final suggestions = <String>{};

    for (final item in items) {
      // Add item name if it contains the query
      if (item.itemName.toLowerCase().contains(searchQuery)) {
        suggestions.add(item.itemName);
      }

      // Add words from description that contain the query
      final descriptionWords = item.itemDescription.toLowerCase().split(' ');
      for (final word in descriptionWords) {
        if (word.contains(searchQuery) && word.length > 2) {
          suggestions.add(word);
        }
      }
    }

    return suggestions.take(5).toList();
  }

  // Highlight search terms in text
  static List<TextSpan> highlightSearchTerms(String text, String query) {
    if (query.trim().isEmpty) {
      return [TextSpan(text: text)];
    }

    final searchQuery = query.toLowerCase();
    final textLower = text.toLowerCase();
    final spans = <TextSpan>[];
    int start = 0;

    while (true) {
      final index = textLower.indexOf(searchQuery, start);
      if (index == -1) {
        spans.add(TextSpan(text: text.substring(start)));
        break;
      }

      // Add text before the match
      if (index > start) {
        spans.add(TextSpan(text: text.substring(start, index)));
      }

      // Add the highlighted match
      spans.add(
        TextSpan(
          text: text.substring(index, index + searchQuery.length),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            backgroundColor: Color(0xFFFFD700), 
          ),
        ),
      );

      start = index + searchQuery.length;
    }

    return spans;
  }
}
