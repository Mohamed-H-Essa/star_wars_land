import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/layers/domain/entity/film.dart';
import 'package:starwars/layers/presentation/shared/services/film_image_path.dart';
import 'package:starwars/layers/presentation/films/details_page/bloc/film_details_bloc.dart';
import 'package:starwars/layers/presentation/shared/services/person_image_path.dart';

// -----------------------------------------------------------------------------
// Page
// -----------------------------------------------------------------------------
class FilmDetailsPage extends StatelessWidget {
  const FilmDetailsPage({super.key});

  static Route<void> route({required Film film}) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (_) => FilmDetailsBloc(film: film),
          child: const FilmDetailsPage(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const FilmDetailsView();
  }
}

// -----------------------------------------------------------------------------
// View
// -----------------------------------------------------------------------------
class FilmDetailsView extends StatelessWidget {
  const FilmDetailsView({super.key});

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
          final film = ctx.select(
            (FilmDetailsBloc b) => b.state.film,
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: film.url ?? '',

                child: Image.asset(
                    FilmImageService.getImagePathFromName(film.name!)),
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
                        film.name ?? '',
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
                          return _DetailsWidgetList(film: film);
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
                  itemCount: film.films?.length ?? 0,
                  itemBuilder: (context, index) {
                    final ep = film.films![index];
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
    final name = ep.split('/').last;

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
  const _DetailsWidgetList({super.key, required this.film});
  final Film film;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          'Name: ${film.name ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Rotation Period: ${film.rotationPeriod ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Orbital Period: ${film.orbitalPeriod ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Diameter: ${film.diameter ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Climate: ${film.climate ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Gravity: ${film.gravity ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Terrain: ${film.terrain ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Surface Water: ${film.surfaceWater ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Population: ${film.population ?? ''}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Residents: ${film.residents?.length ?? 0}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Films: ${film.films?.length ?? 0}',
          style: textTheme.bodyMedium!.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
