import 'package:flutter/material.dart';
import 'package:starwars/layers/domain/entity/specie.dart';
import 'package:starwars/layers/presentation/shared/services/vehicle_image_path.dart';

typedef OnSpecieListItemTap = void Function(Specie person);

class SpecieListItem extends StatelessWidget {
  const SpecieListItem({
    super.key,
    required this.item,
    this.onTap,
  });

  final Specie item;
  final OnSpecieListItemTap? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(item),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: SizedBox(
          height: 124,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _ItemPhoto(item: item),
              _ItemDescription(item: item),
            ],
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Helpers
// -----------------------------------------------------------------------------

class _ItemDescription extends StatelessWidget {
  const _ItemDescription({super.key, required this.item});

  final Specie item;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            color: colorScheme.surfaceVariant,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  item.name ?? '',
                  style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemPhoto extends StatelessWidget {
  const _ItemPhoto({super.key, required this.item});

  final Specie item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: SizedBox(
        height: 122,
        child: Hero(
          tag: item.url ?? '',
          child: Image.asset(
            VehicleImageService.getImagePathFromUrl(
              item.url!,
            ),
            fit: BoxFit.cover,
            // width: 170,
          ),
        ),
      ),
    );
  }
}