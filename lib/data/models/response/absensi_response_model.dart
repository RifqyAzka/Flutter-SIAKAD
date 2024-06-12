import 'dart:convert';

class AbsensiResponseModel {
  final List<Absen> data;

  AbsensiResponseModel({
    required this.data,
  });

  factory AbsensiResponseModel.fromJson(String str) =>
      AbsensiResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AbsensiResponseModel.fromMap(Map<String, dynamic> json) =>
      AbsensiResponseModel(
        data: List<Absen>.from(json["data"].map((x) => Absen.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Absen {
  final int id;
  final int scheduleId;
  final int studentId;
  final String kodeAbsensi;
  final String tahunAkademik;
  final String semester;
  final String pertemuan;
  final String status;
  final String keterangan;
  final String latitude;
  final String longitude;
  final String nilai;
  final String createdBy;
  final String updatedBy;
  final dynamic deletedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Schedule schedule;

  Absen({
    required this.id,
    required this.scheduleId,
    required this.studentId,
    required this.kodeAbsensi,
    required this.tahunAkademik,
    required this.semester,
    required this.pertemuan,
    required this.status,
    required this.keterangan,
    required this.latitude,
    required this.longitude,
    required this.nilai,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.schedule,
  });

  factory Absen.fromJson(String str) => Absen.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Absen.fromMap(Map<String, dynamic> json) => Absen(
        id: json["id"],
        scheduleId: json["schedule_id"],
        studentId: json["student_id"],
        kodeAbsensi: json["kode_absensi"],
        tahunAkademik: json["tahun_akademik"],
        semester: json["semester"],
        pertemuan: json["pertemuan"],
        status: json["status"],
        keterangan: json["keterangan"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        nilai: json["nilai"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        schedule: Schedule.fromMap(json["schedule"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "schedule_id": scheduleId,
        "student_id": studentId,
        "kode_absensi": kodeAbsensi,
        "tahun_akademik": tahunAkademik,
        "semester": semester,
        "pertemuan": pertemuan,
        "status": status,
        "keterangan": keterangan,
        "latitude": latitude,
        "longitude": longitude,
        "nilai": nilai,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "schedule": schedule.toMap(),
      };
}

class Schedule {
  final int id;
  final int subjectId;
  final int studentId;
  final String hari;
  final String jamMulai;
  final String jamSelesai;
  final String ruangan;
  final String kodeAbsensi;
  final String tahunAkademik;
  final String semester;
  final String createdBy;
  final String updatedBy;
  final dynamic deletedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Subject subject;

  Schedule({
    required this.id,
    required this.subjectId,
    required this.studentId,
    required this.hari,
    required this.jamMulai,
    required this.jamSelesai,
    required this.ruangan,
    required this.kodeAbsensi,
    required this.tahunAkademik,
    required this.semester,
    required this.createdBy,
    required this.updatedBy,
    required this.deletedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.subject,
  });

  factory Schedule.fromJson(String str) => Schedule.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Schedule.fromMap(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        subjectId: json["subject_id"],
        studentId: json["student_id"],
        hari: json["hari"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
        ruangan: json["ruangan"],
        kodeAbsensi: json["kode_absensi"],
        tahunAkademik: json["tahun_akademik"],
        semester: json["semester"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedBy: json["deleted_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subject: Subject.fromMap(json["subject"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "subject_id": subjectId,
        "student_id": studentId,
        "hari": hari,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
        "ruangan": ruangan,
        "kode_absensi": kodeAbsensi,
        "tahun_akademik": tahunAkademik,
        "semester": semester,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_by": deletedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "subject": subject.toMap(),
      };
}

class Subject {
  final int id;
  final String title;
  final int lecturerId;
  final String semester;
  final String academicYear;
  final int sks;
  final String code;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  Subject({
    required this.id,
    required this.title,
    required this.lecturerId,
    required this.semester,
    required this.academicYear,
    required this.sks,
    required this.code,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Subject.fromJson(String str) => Subject.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Subject.fromMap(Map<String, dynamic> json) => Subject(
        id: json["id"],
        title: json["title"],
        lecturerId: json["lecturer_id"],
        semester: json["semester"],
        academicYear: json["academic_year"],
        sks: json["sks"],
        code: json["code"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "lecturer_id": lecturerId,
        "semester": semester,
        "academic_year": academicYear,
        "sks": sks,
        "code": code,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
