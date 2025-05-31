class Dosen {
  final int id;
  final String nama;
  final String status;
  final List<Map<String, String>> chat;

  Dosen({required this.id, required this.nama, required this.status, required this.chat});

  factory Dosen.fromJson(Map<String, dynamic> json) {
    return Dosen(
      id: json['id'],
      nama: json['nama'],
      status: json['status'],
      chat: List<Map<String, String>>.from(json['chat'].map((e) => Map<String, String>.from(e))),
    );
  }
}