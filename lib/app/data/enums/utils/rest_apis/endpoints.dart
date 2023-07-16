import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/app/data/constants/app_constatnts.dart';

// Utils
final storage = GetStorage();
String getURL(String endpoint) => baseAPIURL + endpoint;

// get token from storage
get token => storage.read(kToken);
get userId => storage.read(kUserId);

// URL Endpoints
get loginURL => getURL('user/auth/login');
get signUpURL => getURL('user/auth/SignUp');
get getUserProfileURL =>
    getURL('user/profiles/get-profiles?ClientID=$userId&userid=$userId');
