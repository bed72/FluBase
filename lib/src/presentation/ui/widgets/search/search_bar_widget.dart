import 'package:flutter/material.dart';

import 'package:ohh_ferta/src/presentation/extensions/context_extension.dart';
import 'package:ohh_ferta/src/presentation/ui/widgets/border/border_widget.dart';

class SearchBarWidget extends StatefulWidget {
  final String viewHintText;
  final List<Widget> Function(SearchController controller) items;

  const SearchBarWidget({
    super.key,
    required this.items,
    required this.viewHintText,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  int _currentIndex = 0;
  int _currentCharIndex = 0;

  final List<String> _strings = [
    "As melhores ofertas",
    "Você encontra aqui...",
  ];

  void startTypewriter() {
    if (mounted) {
      setState(() {
        if (_currentCharIndex < _strings[_currentIndex].length) {
          _currentCharIndex++;
        } else {
          _currentIndex = (_currentIndex + 1) % _strings.length;
          _currentCharIndex = 0;
        }
      });
    }

    Future.delayed(const Duration(milliseconds: 256), () => startTypewriter());
  }

  @override
  void initState() {
    super.initState();

    startTypewriter();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.0,
      child: SearchAnchor(
        viewElevation: 0,
        isFullScreen: true,
        dividerColor: Colors.transparent,
        viewHintText: widget.viewHintText,
        headerTextStyle: context.fonts.bodySmall,
        viewLeading: Icon(
          Icons.search,
          color: context.colors.onSurface.withOpacity(0.8),
        ),
        headerHintStyle: context.fonts.bodySmall?.copyWith(
          color: context.colors.onSurface.withOpacity(0.8),
        ),
        viewShape: ContinuousRectangleBorder(
          borderRadius: biggerBorderRadius,
          side: BorderSide(color: context.colors.onBackground.withOpacity(0.6)),
        ),
        builder: (_, SearchController controller) =>
            _searchBarWidget(controller),
        suggestionsBuilder: (_, SearchController controller) =>
            widget.items(controller),
      ),
    );
  }

  SearchBar _searchBarWidget(SearchController controller) {
    return SearchBar(
      controller: controller,
      hintText: _strings[_currentIndex].substring(0, _currentCharIndex),
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
        const ContinuousRectangleBorder(borderRadius: biggerBorderRadius),
      ),
    );
  }
}
