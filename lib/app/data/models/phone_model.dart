import '../../../core/error/exceptions.dart';
import '../../domain/entities/phone.dart';

class PhoneModel extends Phone {
  PhoneModel({String home, String mobile, String office})
      : super(home: home, mobile: mobile, office: office);

  factory PhoneModel.fromJson(Map<String, dynamic> data) {
    try {
      print(data.toString());
      return PhoneModel(
        mobile: data['mobile'],
        home: data['home'],
        office: data['office'],
      );
    } catch (e) {
      throw ServerException();
    }
  }
}
