import 'package:flutter/material.dart';

import 'package:signals/signals_flutter.dart';

import 'package:ohh_ferta/src/common/widgets/failure_widget.dart';
import 'package:ohh_ferta/src/common/widgets/circular_progress_widget.dart';

import 'package:ohh_ferta/src/modules/offers/data/models/offers_model.dart';

import 'package:ohh_ferta/src/modules/offers/presentation/offers/offers_state.dart';
import 'package:ohh_ferta/src/modules/offers/presentation/widgets/header/offers_header_widget.dart';
import 'package:ohh_ferta/src/common/widgets/search/search_bar_widget.dart';

class OffersScreen extends StatefulWidget {
  final OffersState state;

  const OffersScreen({super.key, required this.state});

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
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 56),
        child: OffersHeaderWidget(
          title: 'Bem vindo!',
          hasNotification: true,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 8.0),
              SearchBarWidget(
                items: _itemsWidget,
                viewHintText: 'Algo em mente?',
                hintText: 'Procure pelas melhores oferta',
              ),
              const SizedBox(height: 16.0),
              Watch(
                (_) => widget.state.offers.value.map(
                  loading: () => const CircularProgressWidget(),
                  error: (Object error, _) => FailureWidget(error: error),
                  data: (List<OfferModel> offers) => _offersWidget(offers),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _offersWidget(List<OfferModel> offers) => Expanded(
        child: ListView.separated(
          itemCount: offers.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (_, int index) {
            final offer = offers[index];

            return ListTile(
              title: Text(offer.name),
              subtitle: Text('R\$ ${offer.price}'),
              trailing: Text('válido até: ${offer.formatData}'),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(offer.formatThumb),
              ),
            );
          },
        ),
      );

  List<ListTile> _itemsWidget(SearchController controller) {
    return List<ListTile>.generate(
      50,
      (int index) {
        final String item = 'item $index';
        return ListTile(
          title: Text(item),
          onTap: () {
            setState(() {
              controller.closeView(item);
            });
          },
        );
      },
    );
  }
}
