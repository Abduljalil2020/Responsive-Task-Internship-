import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class DataModel extends Equatable{
  final IconData icon;
  final String title;

  const DataModel({
  required  this.icon,
   required this.title});






  @override
  // TODO: implement props
  List<Object?> get props => [
    icon,title
  ];

}