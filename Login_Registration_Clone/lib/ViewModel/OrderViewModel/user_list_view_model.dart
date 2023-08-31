import 'package:flutter/cupertino.dart';

import '../../Model/OrdersModels/users.dart';

class UserListViewModel with ChangeNotifier{

  final List<Users> _userList = [
    Users(
      userName: 'Rahul Deshmukh',
      emailId: 'rahul@example.com',
      phoneNumber: 9876543210,
      role: 'loader',
      vehicleName: 'Truck A',
    ),
    Users(
      userName: 'Priya Patel',
      emailId: 'priya@example.com',
      phoneNumber: 8765432109,
      role: 'loader',
      vehicleName: 'Truck B',
    ),
    Users(
      userName: 'Amit Kumar',
      emailId: 'amit@example.com',
      phoneNumber: 7654321098,
      role: 'loader',
      vehicleName: 'Truck C',
    ),
    Users(
      userName: 'Neha Sharma',
      emailId: 'neha@example.com',
      phoneNumber: 6543210987,
      role: 'loader',
      vehicleName: 'Truck D',
    ),
    Users(
      userName: 'Sandeep Verma',
      emailId: 'sandeep@example.com',
      phoneNumber: 5432109876,
      role: 'loader',
      vehicleName: 'Truck E',
    ),
  ];

  List<Users> get userList => _userList;




}