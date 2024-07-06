class PlanetImageService {
  static const String basePath = 'assets/images/images/planets/';
  static const List<String> availableImages = [
    'Aldera_City.png',
    'Coruscant.jpg',
    'Endor.jpg',
    'hoths.jpg',
    'Naboo.png',
    'Bespin.png',
    'Dagobah.jpg',
    'Geonosis.jpeg',
    'Kamino.png',
    'yavin_iv.jpg',
  ];

  static String getImagePathFromName(String name) {
    String imageName = '';
    switch (name) {
      case 'Alderaan':
        imageName = 'Aldera_City.png';
        break;
      case 'Coruscant':
        imageName = 'Coruscant.jpg';
        break;
      case 'Endor':
        imageName = 'Endor.jpg';
        break;
      case 'Hoth':
        imageName = 'hoths.jpg';
        break;
      case 'Naboo':
        imageName = 'Naboo.png';
        break;
      case 'Bespin':
        imageName = 'Bespin.png';
        break;
      case 'Dagobah':
        imageName = 'Dagobah.jpg';
        break;
      case 'Geonosis':
        imageName = 'Geonosis.jpeg';
        break;
      case 'Kamino':
        imageName = 'Kamino.png';
        break;
      case 'Yavin IV':
        imageName = 'yavin_iv.jpg';
        break;
      default:
        imageName =
            availableImages.first; // Default to the first available image
    }
    if (availableImages.contains(imageName)) return '$basePath$imageName';
    return '$basePath${availableImages.first}';
  }
}
