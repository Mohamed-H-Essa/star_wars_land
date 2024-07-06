import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/layers/domain/entity/planet.dart';
import 'package:starwars/layers/presentation/shared/services/planet_image_path.dart';
import 'package:starwars/layers/presentation/planets/details_page/bloc/planet_details_bloc.dart';
import 'package:starwars/layers/presentation/shared/services/person_image_path.dart';

// -----------------------------------------------------------------------------
// Page
// -----------------------------------------------------------------------------
class PlanetDetailsPage extends StatelessWidget {
  const PlanetDetailsPage({super.key});

  static Route<void> route({required Planet planet}) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (_) => PlanetDetailsBloc(planet: planet),
          child: const PlanetDetailsPage(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const PlanetDetailsView();
  }
}

// -----------------------------------------------------------------------------
// View
// -----------------------------------------------------------------------------
class PlanetDetailsView extends StatelessWidget {
  const PlanetDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: const Text('Details'),
      ),
      body: const _Content(),
    );
  }
}

// -----------------------------------------------------------------------------
// Content
// -----------------------------------------------------------------------------
class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: Builder(
        builder: (ctx) {
          final planet = ctx.select(
            (PlanetDetailsBloc b) => b.state.planet,
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: planet.url ?? '',

                child: Image.asset(
                    PlanetImageService.getImagePathFromName(planet.name!)),
                // child: CachedNetworkImage(
                //   imageUrl:
                //       'https://artofthemovies.co.uk/cdn/shop/products/IMG_1250.jpg?v=1659794460',
                //   fit: BoxFit.cover,
                //   height: 300,
                // ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        planet.name ?? '',
                        style: textTheme.displaySmall!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const SizedBox(height: 8),
                      const Divider(height: 1),
                      Builder(
                        builder: (ctx) {
                          return _DetailsWidgetList(planet: planet);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Episodes:',
                  style: textTheme.bodyLarge!.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: planet.films?.length ?? 0,
                  itemBuilder: (context, index) {
                    final ep = planet.films![index];
                    return EpisodeItem(ep: ep);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Episode
// -----------------------------------------------------------------------------
class EpisodeItem extends StatelessWidget {
  const EpisodeItem({super.key, required this.ep});

  final String ep;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final list = ep.split('/');
    final name = list.length >= 2 ? list[list.length - 2] : list.last;

    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: colorScheme.surfaceVariant,
        ),
        height: 80,
        width: 80,
        child: Center(
          child: Text(
            name,
            style: textTheme.bodyLarge!.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailsWidgetList extends StatelessWidget {
  const _DetailsWidgetList({super.key, required this.planet});
  final Planet planet;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          'Name: ${planet.name ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Rotation Period: ${planet.rotationPeriod ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Orbital Period: ${planet.orbitalPeriod ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Diameter: ${planet.diameter ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Climate: ${planet.climate ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Gravity: ${planet.gravity ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Terrain: ${planet.terrain ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Surface Water: ${planet.surfaceWater ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Population: ${planet.population ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Residents: ${planet.residents?.length ?? 0}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Films: ${planet.films?.length ?? 0}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
