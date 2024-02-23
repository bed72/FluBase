import 'package:flutter/material.dart';

import 'package:signals/signals_flutter.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:ohh_ferta/src/domain/models/offers/offers_model.dart';

import 'package:ohh_ferta/src/presentation/extensions/context_extension.dart';

import 'package:ohh_ferta/src/presentation/ui/widgets/failure_widget.dart';
import 'package:ohh_ferta/src/presentation/ui/widgets/border/border_widget.dart';
import 'package:ohh_ferta/src/presentation/ui/widgets/circular_progress_widget.dart';
import 'package:ohh_ferta/src/presentation/ui/widgets/search/search_bar_widget.dart';

import 'package:ohh_ferta/src/presentation/ui/screens/offers/states/offers_state.dart';
import 'package:ohh_ferta/src/presentation/ui/screens/offers/widgets/offer_widget.dart';

class OffersScreen extends StatefulWidget {
  final OffersState state;

  const OffersScreen({
    super.key,
    required this.state,
  });

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  void initState() {
    super.initState();

    Future(() => widget.state());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => await widget.state(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SearchBarWidget(
                        items: _itemsWidget,
                        viewHintText: 'Algo em mente?',
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: normalBorderRadius,
                        border: Border.all(
                          color: context.colors.onSurface.withOpacity(0.8),
                        ),
                      ),
                      child: InkWell(
                          onTap: () {},
                          child: const Icon(Icons.filter_list_rounded)),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Expanded(
                  child: Watch(
                    (_) => widget.state.offers.value.map(
                      loading: () => const CircularProgressWidget(),
                      error: (Object error, _) => FailureWidget(error: error),
                      data: (List<OfferModel> offers) => _offersWidget(offers),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<ListTile> _itemsWidget(SearchController controller) {
    return List<ListTile>.generate(
      6,
      (int index) {
        final String item = 'item $index';
        return ListTile(
          title: Text(item),
          onTap: () {
            setState(() => controller.closeView(item));
          },
        );
      },
    );
  }

  MasonryGridView _offersWidget(List<OfferModel> offers) {
    return MasonryGridView.builder(
      shrinkWrap: true,
      itemCount: offers.length,
      itemBuilder: (_, index) => OfferWidget(
        offer: offers[index],
        isPair: index % 2 == 0,
      ),
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }
}
