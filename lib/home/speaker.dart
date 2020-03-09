class SpeakersData {
  List<Speaker> speakers;

  SpeakersData({this.speakers});

  SpeakersData.fromJson(Map<String, dynamic> json) {
    if (json['speakers'] != null) {
      speakers = new List<Speaker>();
      json['speakers'].forEach((v) {
        speakers.add(Speaker.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.speakers != null) {
      data['speakers'] = this.speakers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Speaker {
  String speakerName;
  String speakerDesc;
  String speakerImage;
  String speakerInfo;
  String speakerId;
  String fbUrl;
  String twitterUrl;
  String linkedinUrl;
  String githubUrl;
  String speakerSession;
  String sessionId;

  Speaker(
      {this.speakerName,
      this.speakerDesc,
      this.speakerImage,
      this.speakerInfo,
      this.speakerId,
      this.fbUrl,
      this.twitterUrl,
      this.linkedinUrl,
      this.githubUrl,
      this.speakerSession,
      this.sessionId});

  Speaker.fromJson(Map<String, dynamic> json) {
    speakerName = json['speaker_name'];
    speakerDesc = json['speaker_desc'];
    speakerImage = json['speaker_image'];
    speakerInfo = json['speaker_info'];
    speakerId = json['speaker_id'];
    fbUrl = json['fb_url'];
    twitterUrl = json['twitter_url'];
    linkedinUrl = json['linkedin_url'];
    githubUrl = json['github_url'];
    speakerSession = json['speaker_session'];
    sessionId = json['session_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['speaker_name'] = this.speakerName;
    data['speaker_desc'] = this.speakerDesc;
    data['speaker_image'] = this.speakerImage;
    data['speaker_info'] = this.speakerInfo;
    data['speaker_id'] = this.speakerId;
    data['fb_url'] = this.fbUrl;
    data['twitter_url'] = this.twitterUrl;
    data['linkedin_url'] = this.linkedinUrl;
    data['github_url'] = this.githubUrl;
    data['speaker_session'] = this.speakerSession;
    data['session_id'] = this.sessionId;
    return data;
  }
}

List<Speaker> speakers = [
  Speaker(
    speakerImage: "http://bit.ly/ChiragMishra",
    speakerName: "Chirag Mishra",
    speakerDesc: "SDE II at Microsoft India",
    speakerSession: "Will talk about Cloud arch, how Azure is revolutionizing the industry",
    fbUrl: "https://www.facebook.com/chiragmishra93",
    githubUrl: "https://github.com/iampawan",
    linkedinUrl: "https://www.linkedin.com/in/chirag-mishra/",
    twitterUrl: "https://twitter.com/imthepk",
  ),
  Speaker(
    speakerImage: "http://bit.ly/PrajnyasisBiswal",
    speakerName: "Prajnyasis Biswall",
    speakerDesc: "Ex-Program Manager Skillenza",
    speakerSession: "How communities are taking DevRel seriously",
    fbUrl: "https://www.facebook.com/prajnyasis.biswal",
    githubUrl: "https://github.com/iampawan",
    linkedinUrl: "https://www.linkedin.com/in/iampbiswal/",
    twitterUrl: "https://twitter.com/iampbiswal",
  ),
  Speaker(
    speakerSession: "Design storytelling and overview of UI and UX and sort of  fun insights across design",
    speakerImage: "https://uploads-ssl.webflow.com/5e5b471d3fb2cc7842753973/5e5e816884bd4fc0ea7e89c9_Hero%20Image%20New.jpg",
    speakerName: "Chethan KVS",
    speakerDesc: "SProduct designer at Unacademy",
    fbUrl: "https://www.facebook.com/KvsChethan",
    githubUrl: "https://github.com/iampawan",
    linkedinUrl: "https://www.linkedin.com/in/chethan-kvs-048583106/",
    twitterUrl: "https://twitter.com/KvsChethan",
  ),
  Speaker(
    speakerSession: "Fundamentals and grass-root level AI",
    speakerImage: "http://bit.ly/SabyasachiMukhopadhyay",
    speakerName: "Sabyasachi Mukhopadhyay",
    speakerDesc: "Google DeveloperExpert in AI/ML",
    fbUrl: "https://www.facebook.com/SM2017Official/",
    githubUrl: "https://github.com/iampawan",
    linkedinUrl: "ttps://www.linkedin.com/in/sabyasachi-mukhopadhyay-303a1027/",
    twitterUrl: "https://twitter.com/sabyasachi_uni",
  ),
  Speaker(
    speakerSession: "UX for Gojek, Design Storytelling",
    speakerImage: "http://bit.ly/AprajitKar",
    speakerName: "Aprajit Kar",
    speakerDesc: "Designing for Mobility at Gojek",
    fbUrl: "https://facebook.com/imthepk",
    githubUrl: "https://github.com/iampawan",
    linkedinUrl: "https://www.linkedin.com/in/aprajitkar/",
    twitterUrl: "https://twitter.com/aprajit_kar",
  ),
];
