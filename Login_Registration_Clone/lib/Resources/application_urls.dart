class ApplicationUrls{

  static var baseUrl = 'http://10.0.2.2:8080/';

  static var loginEndPoint = '${baseUrl}Login';

  static var registerEndPoint = '${baseUrl}Register';

  static var changePasswordEndPoint = '${baseUrl}ChangePassword';

  static var productListEndPoint = '${baseUrl}Products';

  static var userCreateEndPoint = '${baseUrl}UserDetails';

  static var createBillEndPoint = '$userCreateEndPoint/$userName/Bill';

  static var userName;

  static void setUsername(var name){
    userName = name;
  }
}