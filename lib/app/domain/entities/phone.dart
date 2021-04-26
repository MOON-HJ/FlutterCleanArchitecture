import 'package:equatable/equatable.dart';

class Phone extends Equatable {
  final String mobile;
  final String home;
  final String office;

  Phone({this.mobile, this.home, this.office});

  @override
  List<Object> get props => [mobile, home, office];
}
