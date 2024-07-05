import 'package:test/test.dart';
import 'package:starwars/layers/domain/entity/person.dart';
import 'package:starwars/layers/domain/entity/film.dart';
import 'package:starwars/layers/domain/entity/planet.dart';
import 'package:starwars/layers/domain/entity/specie.dart';
import 'package:starwars/layers/domain/entity/starship.dart';
import 'package:starwars/layers/domain/entity/vehicle.dart';

void main() {
  group('Person', () {
    test('Two instances with the same properties should be equal', () {
      final person1 = Person(
        id: 1,
        name: 'Luke Skywalker',
        birthYear: '19BBY',
        eyeColor: 'Blue',
        gender: 'Male',
        hairColor: 'Blond',
        height: '172',
        homeworld: 'Tatooine',
        mass: '77',
        skinColor: 'Fair',
        films: ['A New Hope'],
        species: ['Human'],
        starships: ['X-wing'],
        url: 'https://swapi.dev/api/people/1/',
      );

      final person2 = Person(
        id: 1,
        name: 'Luke Skywalker',
        birthYear: '19BBY',
        eyeColor: 'Blue',
        gender: 'Male',
        hairColor: 'Blond',
        height: '172',
        homeworld: 'Tatooine',
        mass: '77',
        skinColor: 'Fair',
        films: ['A New Hope'],
        species: ['Human'],
        starships: ['X-wing'],
        url: 'https://swapi.dev/api/people/1/',
      );

      expect(person1, equals(person2));
    });

    test('Two instances with different properties should be different', () {
      final person1 = Person(
        id: 1,
        name: 'Luke Skywalker',
        birthYear: '19BBY',
        eyeColor: 'Blue',
        gender: 'Male',
        hairColor: 'Blond',
        height: '172',
        homeworld: 'Tatooine',
        mass: '77',
        skinColor: 'Fair',
        films: ['A New Hope'],
        species: ['Human'],
        starships: ['X-wing'],
        url: 'https://swapi.dev/api/people/1/',
      );

      final person2 = Person(
        id: 2,
        name: 'Darth Vader',
        birthYear: '41.9BBY',
        eyeColor: 'Yellow',
        gender: 'Male',
        hairColor: 'None',
        height: '202',
        homeworld: 'Tatooine',
        mass: '136',
        skinColor: 'White',
        films: ['A New Hope', 'The Empire Strikes Back', 'Return of the Jedi'],
        species: ['Human'],
        starships: ['TIE Advanced x1'],
        url: 'https://swapi.dev/api/people/4/',
      );

      expect(person1, isNot(equals(person2)));
    });
  });

  group('Film', () {
    test('Two instances with the same properties should be equal', () {
      final film1 = Film(
        title: 'A New Hope',
        episodeId: 4,
        openingCrawl: 'It is a period of civil war...',
        director: 'George Lucas',
        producer: 'Gary Kurtz, Rick McCallum',
        releaseDate: '1977-05-25',
        characters: ['https://swapi.dev/api/people/1/'],
        planets: ['https://swapi.dev/api/planets/1/'],
        starships: ['https://swapi.dev/api/starships/2/'],
        vehicles: ['https://swapi.dev/api/vehicles/4/'],
        species: ['https://swapi.dev/api/species/1/'],
        url: 'https://swapi.dev/api/films/1/',
      );

      final film2 = Film(
        title: 'A New Hope',
        episodeId: 4,
        openingCrawl: 'It is a period of civil war...',
        director: 'George Lucas',
        producer: 'Gary Kurtz, Rick McCallum',
        releaseDate: '1977-05-25',
        characters: ['https://swapi.dev/api/people/1/'],
        planets: ['https://swapi.dev/api/planets/1/'],
        starships: ['https://swapi.dev/api/starships/2/'],
        vehicles: ['https://swapi.dev/api/vehicles/4/'],
        species: ['https://swapi.dev/api/species/1/'],
        url: 'https://swapi.dev/api/films/1/',
      );

      expect(film1, equals(film2));
    });

    test('Two instances with different properties should be different', () {
      final film1 = Film(
        title: 'A New Hope',
        episodeId: 4,
        openingCrawl: 'It is a period of civil war...',
        director: 'George Lucas',
        producer: 'Gary Kurtz, Rick McCallum',
        releaseDate: '1977-05-25',
        characters: ['https://swapi.dev/api/people/1/'],
        planets: ['https://swapi.dev/api/planets/1/'],
        starships: ['https://swapi.dev/api/starships/2/'],
        vehicles: ['https://swapi.dev/api/vehicles/4/'],
        species: ['https://swapi.dev/api/species/1/'],
        url: 'https://swapi.dev/api/films/1/',
      );

      final film2 = Film(
        title: 'The Empire Strikes Back',
        episodeId: 5,
        openingCrawl: 'It is a dark time for the Rebellion...',
        director: 'Irvin Kershner',
        producer: 'Gary Kurtz, Rick McCallum',
        releaseDate: '1980-05-21',
        characters: ['https://swapi.dev/api/people/1/'],
        planets: ['https://swapi.dev/api/planets/4/'],
        starships: ['https://swapi.dev/api/starships/3/'],
        vehicles: ['https://swapi.dev/api/vehicles/6/'],
        species: ['https://swapi.dev/api/species/1/'],
        url: 'https://swapi.dev/api/films/2/',
      );

      expect(film1, isNot(equals(film2)));
    });
  });

  group('Planet', () {
    test('Two instances with the same properties should be equal', () {
      final planet1 = Planet(
        name: 'Tatooine',
        diameter: '10465',
        rotationPeriod: '23',
        orbitalPeriod: '304',
        gravity: '1',
        population: '120000',
        climate: 'Arid',
        terrain: 'Dessert',
        surfaceWater: '1',
        residents: ['https://swapi.dev/api/people/1/'],
        films: ['https://swapi.dev/api/films/1/'],
        url: 'https://swapi.dev/api/planets/1/',
      );

      final planet2 = Planet(
        name: 'Tatooine',
        diameter: '10465',
        rotationPeriod: '23',
        orbitalPeriod: '304',
        gravity: '1',
        population: '120000',
        climate: 'Arid',
        terrain: 'Dessert',
        surfaceWater: '1',
        residents: ['https://swapi.dev/api/people/1/'],
        films: ['https://swapi.dev/api/films/1/'],
        url: 'https://swapi.dev/api/planets/1/',
      );

      expect(planet1, equals(planet2));
    });

    test('Two instances with different properties should be different', () {
      final planet1 = Planet(
        name: 'Tatooine',
        diameter: '10465',
        rotationPeriod: '23',
        orbitalPeriod: '304',
        gravity: '1',
        population: '120000',
        climate: 'Arid',
        terrain: 'Dessert',
        surfaceWater: '1',
        residents: ['https://swapi.dev/api/people/1/'],
        films: ['https://swapi.dev/api/films/1/'],
        url: 'https://swapi.dev/api/planets/1/',
      );

      final planet2 = Planet(
        name: 'Alderaan',
        diameter: '12500',
        rotationPeriod: '24',
        orbitalPeriod: '364',
        gravity: '1',
        population: '2000000000',
        climate: 'Temperate',
        terrain: 'Grasslands, mountains',
        surfaceWater: '40',
        residents: ['https://swapi.dev/api/people/5/'],
        films: [
          'https://swapi.dev/api/films/1/',
          'https://swapi.dev/api/films/6/'
        ],
        url: 'https://swapi.dev/api/planets/2/',
      );

      expect(planet1, isNot(equals(planet2)));
    });
  });
  group('Specie', () {
    test('Two instances with the same properties should be equal', () {
      final specie1 = Specie(
        name: 'Wookie',
        classification: 'Mammal',
        designation: 'Sentient',
        averageHeight: '2.1',
        skinColors: 'gray',
        hairColors: 'black, brown',
        eyeColors: 'blue, green, yellow, brown, golden, red',
        averageLifespan: '400',
        language: 'Shyriiwook',
        homeworld: 'https://swapi.dev/api/planets/14/',
        people: ['https://swapi.dev/api/people/13/'],
        films: [
          'https://swapi.dev/api/films/1/',
          'https://swapi.dev/api/films/2/'
        ],
        url: 'https://swapi.dev/api/species/3/',
      );

      final specie2 = Specie(
        name: 'Wookie',
        classification: 'Mammal',
        designation: 'Sentient',
        averageHeight: '2.1',
        skinColors: 'gray',
        hairColors: 'black, brown',
        eyeColors: 'blue, green, yellow, brown, golden, red',
        averageLifespan: '400',
        language: 'Shyriiwook',
        homeworld: 'https://swapi.dev/api/planets/14/',
        people: ['https://swapi.dev/api/people/13/'],
        films: [
          'https://swapi.dev/api/films/1/',
          'https://swapi.dev/api/films/2/'
        ],
        url: 'https://swapi.dev/api/species/3/',
      );

      expect(specie1, equals(specie2));
    });

    test('Two instances with different properties should be different', () {
      final specie1 = Specie(
        name: 'Wookie',
        classification: 'Mammal',
        designation: 'Sentient',
        averageHeight: '2.1',
        skinColors: 'gray',
        hairColors: 'black, brown',
        eyeColors: 'blue, green, yellow, brown, golden, red',
        averageLifespan: '400',
        language: 'Shyriiwook',
        homeworld: 'https://swapi.dev/api/planets/14/',
        people: ['https://swapi.dev/api/people/13/'],
        films: [
          'https://swapi.dev/api/films/1/',
          'https://swapi.dev/api/films/2/'
        ],
        url: 'https://swapi.dev/api/species/3/',
      );

      final specie2 = Specie(
        name: 'Droid',
        classification: 'Artificial',
        designation: 'Sentient',
        averageHeight: 'n/a',
        skinColors: 'n/a',
        hairColors: 'n/a',
        eyeColors: 'n/a',
        averageLifespan: 'indefinite',
        language: 'n/a',
        homeworld: 'n/a',
        people: [],
        films: [
          'https://swapi.dev/api/films/1/',
          'https://swapi.dev/api/films/2/'
        ],
        url: 'https://swapi.dev/api/species/2/',
      );

      expect(specie1, isNot(equals(specie2)));
    });
  });

  group('Starship', () {
    test('Two instances with the same properties should be equal', () {
      final starship1 = Starship(
        name: 'Death Star',
        model: 'DS-1 Orbital Battle Station',
        starshipClass: 'Deep Space Mobile Battlestation',
        manufacturer:
            'Imperial Department of Military Research, Sienar Fleet Systems',
        costInCredits: '1000000000000',
        length: '120000',
        crew: '342953',
        passengers: '843342',
        maxAtmospheringSpeed: 'n/a',
        hyperdriveRating: '4.0',
        mglt: '10 MGLT',
        cargoCapacity: '1000000000000',
        consumables: '3 years',
        films: ['https://swapi.dev/api/films/1/'],
        pilots: [],
        url: 'https://swapi.dev/api/starships/9/',
      );

      final starship2 = Starship(
        name: 'Death Star',
        model: 'DS-1 Orbital Battle Station',
        starshipClass: 'Deep Space Mobile Battlestation',
        manufacturer:
            'Imperial Department of Military Research, Sienar Fleet Systems',
        costInCredits: '1000000000000',
        length: '120000',
        crew: '342953',
        passengers: '843342',
        maxAtmospheringSpeed: 'n/a',
        hyperdriveRating: '4.0',
        mglt: '10 MGLT',
        cargoCapacity: '1000000000000',
        consumables: '3 years',
        films: ['https://swapi.dev/api/films/1/'],
        pilots: [],
        url: 'https://swapi.dev/api/starships/9/',
      );

      expect(starship1, equals(starship2));
    });

    test('Two instances with different properties should be different', () {
      final starship1 = Starship(
        name: 'Death Star',
        model: 'DS-1 Orbital Battle Station',
        starshipClass: 'Deep Space Mobile Battlestation',
        manufacturer:
            'Imperial Department of Military Research, Sienar Fleet Systems',
        costInCredits: '1000000000000',
        length: '120000',
        crew: '342953',
        passengers: '843342',
        maxAtmospheringSpeed: 'n/a',
        hyperdriveRating: '4.0',
        mglt: '10 MGLT',
        cargoCapacity: '1000000000000',
        consumables: '3 years',
        films: ['https://swapi.dev/api/films/1/'],
        pilots: [],
        url: 'https://swapi.dev/api/starships/9/',
      );

      final starship2 = Starship(
        name: 'Millennium Falcon',
        model: 'YT-1300 light freighter',
        starshipClass: 'Light freighter',
        manufacturer: 'Corellian Engineering Corporation',
        costInCredits: '100000',
        length: '34.37',
        crew: '4',
        passengers: '6',
        maxAtmospheringSpeed: '1050',
        hyperdriveRating: '0.5',
        mglt: '75',
        cargoCapacity: '100000',
        consumables: '2 months',
        films: [
          'https://swapi.dev/api/films/1/',
          'https://swapi.dev/api/films/2/',
          'https://swapi.dev/api/films/3/'
        ],
        pilots: [
          'https://swapi.dev/api/people/13/',
          'https://swapi.dev/api/people/14/',
          'https://swapi.dev/api/people/25/',
          'https://swapi.dev/api/people/31/'
        ],
        url: 'https://swapi.dev/api/starships/10/',
      );

      expect(starship1, isNot(equals(starship2)));
    });
  });
  group('Vehicle', () {
    test('Two instances with the same properties should be equal', () {
      final vehicle1 = Vehicle(
        name: 'Sand Crawler',
        model: 'Digger Crawler',
        vehicleClass: 'wheeled',
        manufacturer: 'Corellia Mining Corporation',
        length: '36.8',
        costInCredits: '150000',
        crew: '46',
        passengers: '30',
        maxAtmospheringSpeed: '30',
        cargoCapacity: '50000',
        consumables: '2 months',
        films: ['https://swapi.dev/api/films/1/'],
        pilots: [],
        url: 'https://swapi.dev/api/vehicles/4/',
      );

      final vehicle2 = Vehicle(
        name: 'Sand Crawler',
        model: 'Digger Crawler',
        vehicleClass: 'wheeled',
        manufacturer: 'Corellia Mining Corporation',
        length: '36.8',
        costInCredits: '150000',
        crew: '46',
        passengers: '30',
        maxAtmospheringSpeed: '30',
        cargoCapacity: '50000',
        consumables: '2 months',
        films: ['https://swapi.dev/api/films/1/'],
        pilots: [],
        url: 'https://swapi.dev/api/vehicles/4/',
      );

      expect(vehicle1, equals(vehicle2));
    });

    test('Two instances with different properties should be different', () {
      final vehicle1 = Vehicle(
        name: 'Sand Crawler',
        model: 'Digger Crawler',
        vehicleClass: 'wheeled',
        manufacturer: 'Corellia Mining Corporation',
        length: '36.8',
        costInCredits: '150000',
        crew: '46',
        passengers: '30',
        maxAtmospheringSpeed: '30',
        cargoCapacity: '50000',
        consumables: '2 months',
        films: ['https://swapi.dev/api/films/1/'],
        pilots: [],
        url: 'https://swapi.dev/api/vehicles/4/',
      );

      final vehicle2 = Vehicle(
        name: 'T-16 skyhopper',
        model: 'T-16 skyhopper',
        vehicleClass: 'repulsorcraft',
        manufacturer: 'Incom Corporation',
        length: '10.4',
        costInCredits: '14500',
        crew: '1',
        passengers: '1',
        maxAtmospheringSpeed: '1200',
        cargoCapacity: '50',
        consumables: '0',
        films: ['https://swapi.dev/api/films/1/'],
        pilots: ['https://swapi.dev/api/people/1/'],
        url: 'https://swapi.dev/api/vehicles/6/',
      );

      expect(vehicle1, isNot(equals(vehicle2)));
    });
  });
}
