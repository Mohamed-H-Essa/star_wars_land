import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/presentation/details_page/bloc/person_details_bloc.dart';

// -----------------------------------------------------------------------------
// Page
// -----------------------------------------------------------------------------
class PersonDetailsPage extends StatelessWidget {
  const PersonDetailsPage({super.key});

  static Route<void> route({required Person person}) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (_) => PersonDetailsBloc(person: person),
          child: const PersonDetailsPage(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const PersonDetailsView();
  }
}

// -----------------------------------------------------------------------------
// View
// -----------------------------------------------------------------------------
class PersonDetailsView extends StatelessWidget {
  const PersonDetailsView({super.key});

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
          final person = ctx.select(
            (PersonDetailsBloc b) => b.state.person,
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: person.url ?? '',
                child: CachedNetworkImage(
                  imageUrl:
                      'https://artofthemovies.co.uk/cdn/shop/products/IMG_1250.jpg?v=1659794460',
                  fit: BoxFit.cover,
                  height: 300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        person.name ?? '',
                        style: textTheme.displaySmall!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Status: ${person.gender == 'male' ? 'ALIVE!' : 'DEAD!'}',
                        style: textTheme.titleMedium!.copyWith(
                          color: person.gender == 'male'
                              ? Colors.lightGreen
                              : Colors.redAccent,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Divider(height: 1),
                      const SizedBox(height: 16),
                      Text(
                        'Birth Year: ${person.birthYear ?? ''}',
                        style: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Eye Color: ${person.eyeColor ?? ''}',
                        style: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Species: ${person.species ?? ''}',
                        style: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Mass: ${person.mass ?? '?'}',
                        style: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Gender: ${person.gender ?? ''}',
                        style: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      // const SizedBox(height: 4),
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
                  itemCount: person.films?.length ?? 0,
                  itemBuilder: (context, index) {
                    final ep = person.films![index];
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
