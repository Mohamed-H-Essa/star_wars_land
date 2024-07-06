class FilmImageService {
  static const String basePath = 'assets/images/images/movies/';

  static String getImagePath(String filmTitle) {
    switch (filmTitle) {
      case 'A New Hope':
        return '${basePath}episodeIV.jpg';
      case 'The Empire Strikes Back':
        return '${basePath}episodeV.jpg';
      case 'Return of the Jedi':
        return '${basePath}episodeVI.jpg';
      case 'The Phantom Menace':
        return '${basePath}episodeI.jpg';
      case 'Attack of the Clones':
        return '${basePath}episodeII.jpg';
      case 'Revenge of the Sith':
        return '${basePath}episodeIII.jpg';
      case 'The Force Awakens':
        return '${basePath}episodeVII.jpg';
      default:
        return '${basePath}episodeVII.jpg';
    }
  }
}
