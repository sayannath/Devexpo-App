class TeamsData {
  List<Team> teams;

  TeamsData({this.teams});

  TeamsData.fromJson(Map<String, dynamic> json) {
    if (json['teams'] != null) {
      teams = new List<Team>();
      json['teams'].forEach((v) {
        teams.add(Team.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teams != null) {
      data['teams'] = this.teams.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Team {
  String name;
  String desc;
  String job;
  String image;
  String speciality;
  String fbUrl;
  String twitterUrl;
  String linkedinUrl;
  String githubUrl;
  String contribution;

  Team(
      {this.name,
      this.desc,
      this.job,
      this.image,
      this.speciality,
      this.fbUrl,
      this.twitterUrl,
      this.linkedinUrl,
      this.githubUrl,
      this.contribution});

  Team.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desc = json['desc'];
    job = json['job'];
    image = json['image'];
    speciality = json['speciality'];
    fbUrl = json['fb_url'];
    twitterUrl = json['twitter_url'];
    linkedinUrl = json['linkedin_url'];
    githubUrl = json['github_url'];
    contribution = json['contribution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['job'] = this.job;
    data['image'] = this.image;
    data['speciality'] = this.speciality;
    data['fb_url'] = this.fbUrl;
    data['twitter_url'] = this.twitterUrl;
    data['linkedin_url'] = this.linkedinUrl;
    data['github_url'] = this.githubUrl;
    data['contribution'] = this.contribution;
    return data;
  }
}

List<Team> teams = [
  Team(
    name: "Amrit Dash",
    desc: "Core team Member DSCKIIT",
    contribution: "DevExpo App",
    image:
        "https://media-exp1.licdn.com/dms/image/C5103AQH8FZ0Ooc8BjQ/profile-displayphoto-shrink_200_200/0?e=1589414400&v=beta&t=xFZ_gEH2NulEvz9mkrtlVCJCYQIymDmcPpGmo6m1EQA",
  ),
  Team(
    name: "Sayan Nath",
    desc: "Team Member of DSCKIIT",
    contribution: "DevExpo App",
    image: "https://instagram.fmaa8-1.fna.fbcdn.net/v/t51.2885-19/s150x150/88921875_648587859289320_7784637187596746752_n.jpg?_nc_ht=instagram.fmaa8-1.fna.fbcdn.net&_nc_ohc=_w5yCqs7XbcAX9uXpC6&oh=3ed9ceff6f7339a212703875cae82b9a&oe=5E9D31D2",
  ),
];
