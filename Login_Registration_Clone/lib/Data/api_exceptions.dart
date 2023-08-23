class AppException implements Exception{

  final _prefix;
  final _message;

  AppException([this._prefix, this._message]);

  @override
  String toString(){
    return '$_prefix$_message';
  }

}


class FetchDataException extends AppException{

  FetchDataException([String? message]): super(message, 'Error During Fetching Data');
}

class BadRequestException extends AppException{

  BadRequestException([String? message]): super(message, 'Invalid Request');
}

class UnauthorizedException extends AppException{

  UnauthorizedException([String? message]): super(message, 'Unauthorized Request');
}
