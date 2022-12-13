class NotifyModel {
  String? date;
  String? startTime;
  int? remind;
  String? repeat;

  NotifyModel({
    this.date,
    this.startTime,
    this.remind,
    this.repeat,
  });

  NotifyModel copyWith({
    String? date,
    String? hour,
    int? remind,
    String? repeat,
  }) {
    return NotifyModel(
      date: date ?? this.date,
      startTime: hour ?? startTime,
      remind: remind ?? this.remind,
      repeat: repeat ?? this.repeat,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'date': date,
      'hour': startTime,
      'remind': remind,
      'repeat': repeat,
    };
  }

  factory NotifyModel.fromJson(Map<String, dynamic> json) {
    return NotifyModel(
      date: json['date'] != null ? json['date'] as String : null,
      startTime: json['hour'] != null ? json['hour'] as String : null,
      remind: json['remind'] != null ? json['remind'] as int : null,
      repeat: json['repeat'] != null ? json['repeat'] as String : null,
    );
  }
}
