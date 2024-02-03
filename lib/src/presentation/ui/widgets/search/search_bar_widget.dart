import 'package:flutter/material.dart';

import 'package:ohh_ferta/src/presentation/extensions/context_extension.dart';

class SearchBarWidget extends StatefulWidget {
  final String hintText;
  final String viewHintText;
  final List<Widget> Function(SearchController controller) items;

  const SearchBarWidget({
    super.key,
    required this.items,
    required this.hintText,
    required this.viewHintText,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      viewElevation: 0,
      isFullScreen: false,
      viewHintText: widget.viewHintText,
      dividerColor: Colors.transparent,
      viewLeading: const Icon(Icons.search),
      headerTextStyle: context.fonts.bodySmall,
      headerHintStyle: context.fonts.bodyMedium!.copyWith(
        color: context.colors.onSurface.withOpacity(0.8),
      ),
      viewShape: ContinuousRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        side: BorderSide(color: context.colors.onBackground.withOpacity(0.6)),
      ),
      builder: (_, SearchController controller) => _searchBarWidget(controller),
      suggestionsBuilder: (_, SearchController controller) =>
          widget.items(controller),
    );
  }

  SearchBar _searchBarWidget(SearchController controller) {
    return SearchBar(
      controller: controller,
      hintText: widget.hintText,
      leading: const Icon(Icons.search),
      onTap: () => controller.openView(),
      onChanged: (_) => controller.openView(),
      elevation: MaterialStateProperty.all(0.0),
      constraints: const BoxConstraints(minHeight: 56),
      padding: const MaterialStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 16.0),
      ),
      side: MaterialStateProperty.all(
        BorderSide(color: context.colors.onBackground.withOpacity(0.6)),
      ),
      hintStyle: MaterialStateProperty.all(
        context.fonts.bodyMedium!.copyWith(
          color: context.colors.onSurface.withOpacity(0.8),
        ),
      ),
      shape: MaterialStateProperty.all(
        const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }
}
