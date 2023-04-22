// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Student {
  String? name;
  String? regdNo;
  String? dob;
  String? branch;
  String? sec;
  String? email;
  String? mName;
  String? phoneNo;
  String? address;
  String? pNo;
  String? bloodgroup;
  int? pincode;
  String? caddress3;
  String? parentNumber;
  String? nationality;
  String? maritalstatus;

  Student({
    this.name,
    this.regdNo,
    this.dob,
    this.branch,
    this.sec,
    this.email,
    this.mName,
    this.phoneNo,
    this.address,
    this.pNo,
    this.bloodgroup,
    this.pincode,
    this.caddress3,
    this.parentNumber,
    this.nationality,
    this.maritalstatus,
  });

  Student copyWith({
    String? name,
    String? regdNo,
    String? dob,
    String? branch,
    String? sec,
    String? email,
    String? mName,
    String? phoneNo,
    String? address,
    String? pNo,
    String? bloodgroup,
    int? pincode,
    String? caddress3,
    String? parentNumber,
    String? nationality,
    String? maritalstatus,
  }) {
    return Student(
      name: name ?? this.name,
      regdNo: regdNo ?? this.regdNo,
      dob: dob ?? this.dob,
      branch: branch ?? this.branch,
      sec: sec ?? this.sec,
      email: email ?? this.email,
      mName: mName ?? this.mName,
      phoneNo: phoneNo ?? this.phoneNo,
      address: address ?? this.address,
      pNo: pNo ?? this.pNo,
      bloodgroup: bloodgroup ?? this.bloodgroup,
      pincode: pincode ?? this.pincode,
      caddress3: caddress3 ?? this.caddress3,
      parentNumber: parentNumber ?? this.parentNumber,
      nationality: nationality ?? this.nationality,
      maritalstatus: maritalstatus ?? this.maritalstatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'regdNo': regdNo,
      'dob': dob,
      'branch': branch,
      'sec': sec,
      'email': email,
      'mName': mName,
      'phoneNo': phoneNo,
      'address': address,
      'pNo': pNo,
      'bloodgroup': bloodgroup,
      'pincode': pincode,
      'caddress3': caddress3,
      'parentNumber': parentNumber,
      'nationality': nationality,
      'maritalstatus': maritalstatus,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'] != null ? map['name'] as String : null,
      regdNo: map['regdNo'] != null ? map['regdNo'] as String : null,
      dob: map['dob'] != null ? map['dob'] as String : null,
      branch: map['branch'] != null ? map['branch'] as String : null,
      sec: map['sec'] != null ? map['sec'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      mName: map['mName'] != null ? map['mName'] as String : null,
      phoneNo: map['phoneNo'] != null ? map['phoneNo'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      pNo: map['pNo'] != null ? map['pNo'] as String : null,
      bloodgroup:
          map['bloodgroup'] != null ? map['bloodgroup'] as String : null,
      pincode: map['pincode'] != null ? map['pincode'] as int : null,
      caddress3: map['caddress3'] != null ? map['caddress3'] as String : null,
      parentNumber:
          map['parentNumber'] != null ? map['parentNumber'] as String : null,
      nationality:
          map['nationality'] != null ? map['nationality'] as String : null,
      maritalstatus:
          map['maritalstatus'] != null ? map['maritalstatus'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Student(name: $name, regdNo: $regdNo, dob: $dob, branch: $branch, sec: $sec, email: $email, mName: $mName, phoneNo: $phoneNo, address: $address, pNo: $pNo, bloodgroup: $bloodgroup, pincode: $pincode, caddress3: $caddress3, parentNumber: $parentNumber, nationality: $nationality, maritalstatus: $maritalstatus)';
  }

  @override
  bool operator ==(covariant Student other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.regdNo == regdNo &&
        other.dob == dob &&
        other.branch == branch &&
        other.sec == sec &&
        other.email == email &&
        other.mName == mName &&
        other.phoneNo == phoneNo &&
        other.address == address &&
        other.pNo == pNo &&
        other.bloodgroup == bloodgroup &&
        other.pincode == pincode &&
        other.caddress3 == caddress3 &&
        other.parentNumber == parentNumber &&
        other.nationality == nationality &&
        other.maritalstatus == maritalstatus;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        regdNo.hashCode ^
        dob.hashCode ^
        branch.hashCode ^
        sec.hashCode ^
        email.hashCode ^
        mName.hashCode ^
        phoneNo.hashCode ^
        address.hashCode ^
        pNo.hashCode ^
        bloodgroup.hashCode ^
        pincode.hashCode ^
        caddress3.hashCode ^
        parentNumber.hashCode ^
        nationality.hashCode ^
        maritalstatus.hashCode;
  }
}
