const String tableDownloads = 'downloads';

class Download {
  String? videoId;
  String? url;
  String? path;
  String? status;
  int? percent;
  DateTime? time;

  Download({
    this.videoId,
    this.url,
    this.path,
    this.status,
    this.percent,
    this.time,
  });

  Download.fromJson(Map<String, dynamic> json) {
    videoId = json['videoId'];
    url = json['url'];
    path = json['path'];
    status = json['status'];
    percent = json['percent'];
    time = json['time'] != null ? DateTime.parse(json['time']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['videoId'] = videoId;
    data['url'] = url;
    data['path'] = path;
    data['status'] = status;
    data['percent'] = percent;
    data['time'] = time != null ? time!.toString() : null;
    return data;
  }
}
