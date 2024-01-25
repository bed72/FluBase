import 'package:flutter/material.dart';

import 'package:signals/signals_flutter.dart';

import 'package:ohh_ferta/src/common/widgets/failure_widget.dart';
import 'package:ohh_ferta/src/common/widgets/scaffold_state_widget.dart';
import 'package:ohh_ferta/src/common/widgets/circular_progress_widget.dart';

import 'package:ohh_ferta/src/modules/offers/domain/entities/offers/offers_entity.dart';

import 'package:ohh_ferta/src/modules/offers/presentation/screens/home/offers/offers_state.dart';

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
    return ScaffoldStateWidget(
      child: Watch(
        (_) => widget.state.offers.value.map(
          loading: () => const CircularProgressWidget(),
          error: (Object error, _) => FailureWidget(error: error),
          data: (List<OfferEntity> offers) => _offersWidget(offers),
        ),
      ),
    );
  }

  ListView _offersWidget(List<OfferEntity> offers) => ListView.separated(
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
      );
}
