const String tableParts = 'tasks';

class Part {
  String? id;
  String? partId;
  String? videoId;
  String? url;
  String? fileName;
  bool? isCompleted;
  DateTime? time;

  Part({
    this.id,
    this.partId,
    this.videoId,
    this.url,
    this.fileName,
    this.isCompleted,
    this.time,
  });

  Part.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    partId = json['partId'];
    videoId = json['videoId'];
    url = json['url'];
    fileName = json['fileName'];
    isCompleted = json['isCompleted'] == 1;
    time = json['time'] != null ? DateTime.parse(json['time']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['partId'] = partId;
    data['videoId'] = videoId;
    data['url'] = url;
    data['fileName'] = fileName;
    data['isCompleted'] = (isCompleted ?? false) ? 1 : 0;
    data['time'] = time != null ? time!.toString() : null;
    return data;
  }
}
