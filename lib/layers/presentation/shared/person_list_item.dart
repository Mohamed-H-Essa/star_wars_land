import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/presentation/shared/presentation/gender_text_icon_widget.dart';
import 'package:starwars/layers/presentation/shared/services/get_local_image_path.dart';

typedef OnPersonListItemTap = void Function(Person person);

class PersonListItem extends StatelessWidget {
  const PersonListItem({
    super.key,
    required this.item,
    this.onTap,
  });

  final Person item;
  final OnPersonListItemTap? onTap;

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

  final Person item;

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
                const SizedBox(height: 8),
                GenderTextIconWidget(
                    person: item, textStyle: textTheme.bodyMedium!),
                // Text(
                //   'Birth Year: ${item.birthYear}',
                //   style: textTheme.labelSmall!.copyWith(
                //     color: item.gender == 'male'
                //         ? Colors.lightGreen
                //         : Colors.redAccent,
                //   ),
                // ),
                const SizedBox(height: 4),
                Text(
                  'Mass: ${item.mass ?? ''}',
                  style: textTheme.labelSmall!.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
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

  final Person item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: SizedBox(
        height: 122,
        child: Hero(
          tag: item.url ?? '',
          child: Image.asset(LocalImageService.getImagePathFromUrl(item.url!)),
          // child: CachedNetworkImage(
          //   height: 122,
          //   width: 122,
          //   imageUrl:
          //       'https://artofthemovies.co.uk/cdn/shop/products/IMG_1250.jpg?v=1659794460',
          //   fit: BoxFit.cover,
          //   errorWidget: (ctx, url, err) => const Icon(Icons.error),
          //   placeholder: (ctx, url) => const Icon(Icons.image),
          // ),
        ),
      ),
    );
  }
}
