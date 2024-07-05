import 'package:starwars/layers/data/dto/person_dto.dart';
import 'package:starwars/layers/data/dto/film_dto.dart';
import 'package:starwars/layers/data/dto/planet_dto.dart';
import 'package:starwars/layers/data/dto/specie_dto.dart';
import 'package:starwars/layers/data/dto/starship_dto.dart';
import 'package:starwars/layers/data/dto/vehicle_dto.dart';

// Person Fixtures
final personDto = PersonDto(
  id: 1,
  name: 'Luke Skywalker',
  birthYear: '19BBY',
  eyeColor: 'Blue',
  films: ['https://swapi.dev/api/films/1/'],
  gender: 'Male',
  hairColor: 'Blond',
  height: '172',
  homeworld: 'https://swapi.dev/api/planets/1/',
  mass: '77',
  skinColor: 'Fair',
  species: [],
  starships: ['https://swapi.dev/api/starships/12/'],
  url: 'https://swapi.dev/api/people/1/',
);

final personList1 = [
  PersonDto(
    id: 1,
    name: 'Luke Skywalker',
    birthYear: '19BBY',
    eyeColor: 'Blue',
    films: ['https://swapi.dev/api/films/1/'],
    gender: 'Male',
    hairColor: 'Blond',
    height: '172',
    homeworld: 'https://swapi.dev/api/planets/1/',
    mass: '77',
    skinColor: 'Fair',
    species: [],
    starships: ['https://swapi.dev/api/starships/12/'],
    url: 'https://swapi.dev/api/people/1/',
  ),
];

final personList2 = [
  PersonDto(
    id: 2,
    name: 'C-3PO',
    birthYear: '112BBY',
    eyeColor: 'Yellow',
    films: ['https://swapi.dev/api/films/1/'],
    gender: 'N/A',
    hairColor: 'N/A',
    height: '167',
    homeworld: 'https://swapi.dev/api/planets/1/',
    mass: '75',
    skinColor: 'Gold',
    species: ['https://swapi.dev/api/species/2/'],
    starships: [],
    url: 'https://swapi.dev/api/people/2/',
  ),
];

// Film Fixtures
final filmDto = FilmDto(
  people: ['https://swapi.dev/api/people/1/'],
  created: '2014-12-10T14:23:31.880000Z',
  director: 'George Lucas',
  edited: '2014-12-12T11:24:39.858000Z',
  episodeId: 4,
  openingCrawl: 'It is a period of civil war...',
  planets: ['https://swapi.dev/api/planets/1/'],
  producer: 'Gary Kurtz, Rick McCallum',
  releaseDate: '1977-05-25',
  species: ['https://swapi.dev/api/species/1/'],
  starships: ['https://swapi.dev/api/starships/2/'],
  title: 'A New Hope',
  url: 'https://swapi.dev/api/films/1/',
  vehicles: ['https://swapi.dev/api/vehicles/4/'],
);

final filmList1 = [
  FilmDto(
    people: ['https://swapi.dev/api/people/1/'],
    created: '2014-12-10T14:23:31.880000Z',
    director: 'George Lucas',
    edited: '2014-12-12T11:24:39.858000Z',
    episodeId: 4,
    openingCrawl: 'It is a period of civil war...',
    planets: ['https://swapi.dev/api/planets/1/'],
    producer: 'Gary Kurtz, Rick McCallum',
    releaseDate: '1977-05-25',
    species: ['https://swapi.dev/api/species/1/'],
    starships: ['https://swapi.dev/api/starships/2/'],
    title: 'A New Hope',
    url: 'https://swapi.dev/api/films/1/',
    vehicles: ['https://swapi.dev/api/vehicles/4/'],
  ),
];

final filmList2 = [
  FilmDto(
    people: ['https://swapi.dev/api/people/2/'],
    created: '2014-12-10T14:23:31.880000Z',
    director: 'Irvin Kershner',
    edited: '2014-12-12T11:24:39.858000Z',
    episodeId: 5,
    openingCrawl: 'It is a dark time for the Rebellion...',
    planets: ['https://swapi.dev/api/planets/2/'],
    producer: 'Gary Kurtz, Rick McCallum',
    releaseDate: '1980-05-21',
    species: ['https://swapi.dev/api/species/2/'],
    starships: ['https://swapi.dev/api/starships/3/'],
    title: 'The Empire Strikes Back',
    url: 'https://swapi.dev/api/films/2/',
    vehicles: ['https://swapi.dev/api/vehicles/5/'],
  ),
];

// Planet Fixtures
final planetDto = PlanetDto(
  climate: 'Arid',
  created: '2014-12-09T13:50:49.641000Z',
  diameter: '10465',
  edited: '2014-12-15T13:48:16.167217Z',
  films: ['https://swapi.dev/api/films/1/'],
  gravity: '1',
  name: 'Tatooine',
  orbitalPeriod: '304',
  population: '200000',
  residents: ['https://swapi.dev/api/people/1/'],
  rotationPeriod: '23',
  surfaceWater: '1',
  terrain: 'Dessert',
  url: 'https://swapi.dev/api/planets/1/',
);

final planetList1 = [
  PlanetDto(
    climate: 'Arid',
    created: '2014-12-09T13:50:49.641000Z',
    diameter: '10465',
    edited: '2014-12-15T13:48:16.167217Z',
    films: ['https://swapi.dev/api/films/1/'],
    gravity: '1',
    name: 'Tatooine',
    orbitalPeriod: '304',
    population: '200000',
    residents: ['https://swapi.dev/api/people/1/'],
    rotationPeriod: '23',
    surfaceWater: '1',
    terrain: 'Dessert',
    url: 'https://swapi.dev/api/planets/1/',
  ),
];

final planetList2 = [
  PlanetDto(
    climate: 'Temperate',
    created: '2014-12-09T13:50:49.641000Z',
    diameter: '12500',
    edited: '2014-12-15T13:48:16.167217Z',
    films: ['https://swapi.dev/api/films/2/'],
    gravity: '1',
    name: 'Alderaan',
    orbitalPeriod: '364',
    population: '2000000000',
    residents: ['https://swapi.dev/api/people/2/'],
    rotationPeriod: '24',
    surfaceWater: '40',
    terrain: 'Grasslands, mountains',
    url: 'https://swapi.dev/api/planets/2/',
  ),
];

// Specie Fixtures
final specieDto = SpecieDto(
  averageHeight: '2.1',
  averageLifespan: '400',
  classification: 'Mammal',
  created: '2014-12-10T16:44:31.486000Z',
  designation: 'Sentient',
  edited: '2014-12-10T16:44:31.486000Z',
  eyeColors: 'blue, green, yellow, brown, golden, red',
  hairColors: 'black, brown',
  homeworld: 'https://swapi.dev/api/planets/14/',
  language: 'Shyriiwook',
  name: 'Wookie',
  people: ['https://swapi.dev/api/people/13/'],
  films: ['https://swapi.dev/api/films/1/', 'https://swapi.dev/api/films/2/'],
  skinColors: 'gray',
  url: 'https://swapi.dev/api/species/3/',
);

final specieList1 = [
  SpecieDto(
    averageHeight: '2.1',
    averageLifespan: '400',
    classification: 'Mammal',
    created: '2014-12-10T16:44:31.486000Z',
    designation: 'Sentient',
    edited: '2014-12-10T16:44:31.486000Z',
    eyeColors: 'blue, green, yellow, brown, golden, red',
    hairColors: 'black, brown',
    homeworld: 'https://swapi.dev/api/planets/14/',
    language: 'Shyriiwook',
    name: 'Wookie',
    people: ['https://swapi.dev/api/people/13/'],
    films: ['https://swapi.dev/api/films/1/', 'https://swapi.dev/api/films/2/'],
    skinColors: 'gray',
    url: 'https://swapi.dev/api/species/3/',
  ),
];

final specieList2 = [
  SpecieDto(
    averageHeight: '1.8',
    averageLifespan: '120',
    classification: 'Mammal',
    created: '2014-12-10T16:44:31.486000Z',
    designation: 'Sentient',
    edited: '2014-12-10T16:44:31.486000Z',
    eyeColors: 'brown',
    hairColors: 'black',
    homeworld: 'https://swapi.dev/api/planets/1/',
    language: 'Galactic Basic',
    name: 'Human',
    people: [
      'https://swapi.dev/api/people/1/',
      'https://swapi.dev/api/people/4/'
    ],
    films: ['https://swapi.dev/api/films/1/', 'https://swapi.dev/api/films/2/'],
    skinColors: 'fair, dark, light',
    url: 'https://swapi.dev/api/species/1/',
  ),
];

// Starship Fixtures
final starshipDto = StarshipDto(
  mglt: '10 MGLT',
  cargoCapacity: '1000000000000',
  consumables: '3 years',
  costInCredits: '1000000000000',
  created: '2014-12-10T16:36:50.509000Z',
  crew: '342953',
  edited: '2014-12-10T16:36:50.509000Z',
  hyperdriveRating: '4.0',
  length: '120000',
  manufacturer:
      'Imperial Department of Military Research, Sienar Fleet Systems',
  maxAtmospheringSpeed: 'n/a',
  model: 'DS-1 Orbital Battle Station',
  name: 'Death Star',
  passengers: '843342',
  films: ['https://swapi.dev/api/films/1/'],
  pilots: [],
  starshipClass: 'Deep Space Mobile Battlestation',
  url: 'https://swapi.dev/api/starships/9/',
);

final starshipList1 = [
  StarshipDto(
    mglt: '10 MGLT',
    cargoCapacity: '1000000000000',
    consumables: '3 years',
    costInCredits: '1000000000000',
    created: '2014-12-10T16:36:50.509000Z',
    crew: '342953',
    edited: '2014-12-10T16:36:50.509000Z',
    hyperdriveRating: '4.0',
    length: '120000',
    manufacturer:
        'Imperial Department of Military Research, Sienar Fleet Systems',
    maxAtmospheringSpeed: 'n/a',
    model: 'DS-1 Orbital Battle Station',
    name: 'Death Star',
    passengers: '843342',
    films: ['https://swapi.dev/api/films/1/'],
    pilots: [],
    starshipClass: 'Deep Space Mobile Battlestation',
    url: 'https://swapi.dev/api/starships/9/',
  ),
];

final starshipList2 = [
  StarshipDto(
    mglt: '75 MGLT',
    cargoCapacity: '100000',
    consumables: '2 months',
    costInCredits: '150000',
    created: '2014-12-10T16:36:50.509000Z',
    crew: '46',
    edited: '2014-12-10T16:36:50.509000Z',
    hyperdriveRating: '2.0',
    length: '36.8',
    manufacturer: 'Corellia Mining Corporation',
    maxAtmospheringSpeed: '30',
    model: 'YT-1300 light freighter',
    name: 'Millennium Falcon',
    passengers: '6',
    films: ['https://swapi.dev/api/films/1/'],
    pilots: ['https://swapi.dev/api/people/13/'],
    starshipClass: 'Light Freighter',
    url: 'https://swapi.dev/api/starships/10/',
  ),
];

// Vehicle Fixtures
final vehicleDto = VehicleDto(
  cargoCapacity: '50000',
  consumables: '2 months',
  costInCredits: '150000',
  created: '2014-12-10T15:36:25.724000Z',
  crew: '46',
  edited: '2014-12-10T15:36:25.724000Z',
  length: '36.8',
  manufacturer: 'Corellia Mining Corporation',
  maxAtmospheringSpeed: '30',
  model: 'Digger Crawler',
  name: 'Sand Crawler',
  passengers: '30',
  pilots: [],
  films: ['https://swapi.dev/api/films/1/'],
  url: 'https://swapi.dev/api/vehicles/4/',
  vehicleClass: 'wheeled',
);

final vehicleList1 = [
  VehicleDto(
    cargoCapacity: '50000',
    consumables: '2 months',
    costInCredits: '150000',
    created: '2014-12-10T15:36:25.724000Z',
    crew: '46',
    edited: '2014-12-10T15:36:25.724000Z',
    length: '36.8',
    manufacturer: 'Corellia Mining Corporation',
    maxAtmospheringSpeed: '30',
    model: 'Digger Crawler',
    name: 'Sand Crawler',
    passengers: '30',
    pilots: [],
    films: ['https://swapi.dev/api/films/1/'],
    url: 'https://swapi.dev/api/vehicles/4/',
    vehicleClass: 'wheeled',
  ),
];

final vehicleList2 = [
  VehicleDto(
    cargoCapacity: '50000',
    consumables: '1 month',
    costInCredits: '120000',
    created: '2014-12-10T15:36:25.724000Z',
    crew: '30',
    edited: '2014-12-10T15:36:25.724000Z',
    length: '26.8',
    manufacturer: 'Corellia Mining Corporation',
    maxAtmospheringSpeed: '20',
    model: 'Speeder Bike',
    name: 'Speeder Bike',
    passengers: '2',
    pilots: ['https://swapi.dev/api/people/11/'],
    films: ['https://swapi.dev/api/films/1/'],
    url: 'https://swapi.dev/api/vehicles/5/',
    vehicleClass: 'repulsorcraft',
  ),
];
