class VehicleImageService {
  static const String basePath = 'assets/images/images/vehicles/';
  static const List<String> availableImages = [
    'AT_AT.jpg',
    'Sail_barge.jpg',
    'Snowspeeder.jpg',
    'T-16_skyhopper.gif',
    'TIE_LN_starfighter.jpg',
    'AT_ST.jpg',
    'Sand_Crawler.jpg',
    'Storm_IV_Twin_Pod_cloud_car.jpg',
    'TIE_bomber.jpg',
    'X_34_landspeeder.jpg',
  ];

  static String getImagePathFromUrl(String url) {
    String id = '';
    List<String> parts = url.split('/');
    if (parts.length > 1) {
      id = parts[parts.length - 2];
    }

    String imageName = '';
    switch (id) {
      case '4':
        imageName = 'Sand_Crawler.jpg';
        break;
      case '6':
        imageName = 'T-16_skyhopper.gif';
        break;
      case '7':
        imageName = 'X_34_landspeeder.jpg';
        break;
      case '8':
        imageName = 'TIE_LN_starfighter.jpg';
        break;
      case '14':
        imageName = 'Snowspeeder.jpg';
        break;
      case '16':
        imageName = 'TIE_bomber.jpg';
        break;
      case '18':
        imageName = 'AT_AT.jpg';
        break;
      case '19':
        imageName = 'AT_ST.jpg';
        break;
      case '20':
        imageName = 'Storm_IV_Twin_Pod_cloud_car.jpg';
        break;
      case '24':
        imageName = 'Sail_barge.jpg';
        break;
      case '25':
        imageName = 'Bantha_II_cargo_skiff.jpg';
        break;
      case '26':
        imageName = 'TIE_IN_interceptor.jpg';
        break;
      case '30':
        imageName = 'Imperial_Speeder_Bike.jpg';
        break;
      case '33':
        imageName = 'Vulture_Droid.jpg';
        break;
      case '34':
        imageName = 'Multi_Troop_Transport.jpg';
        break;
      case '35':
        imageName = 'Armored_Assault_Tank.jpg';
        break;
      case '36':
        imageName = 'Single_Trooper_Aerial_Platform.jpg';
        break;
      case '37':
        imageName = 'C_9979_landing_craft.jpg';
        break;
      case '38':
        imageName = 'Tribubble_bongo.jpg';
        break;
      case '42':
        imageName = 'Sith_speeder.jpg';
        break;
      default:
        imageName =
            availableImages.first; // Default to the first available image
    }
    if (availableImages.contains(imageName)) return '$basePath$imageName';
    return '$basePath${availableImages.first}';
  }
}
