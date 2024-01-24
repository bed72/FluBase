import 'package:flutter/material.dart';

import 'package:signals/signals_flutter.dart';

import 'package:ohh_ferta/src/common/extensions/get_it_extension.dart';

import 'package:ohh_ferta/src/domain/entities/offers/offers_entity.dart';

import 'package:ohh_ferta/src/presentation/widgets/failure_widget.dart';
import 'package:ohh_ferta/src/presentation/widgets/scaffold_state_widget.dart';
import 'package:ohh_ferta/src/presentation/widgets/circular_progress_widget.dart';

import 'package:ohh_ferta/src/presentation/screens/home/offers/offers_state.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  late final OffersState offers;

  @override
  void initState() {
    super.initState();

    offers = get<OffersState>();

    Future(() => offers.execute());
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldStateWidget(
      child: Watch(
        (_) => offers.state.value.map(
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
