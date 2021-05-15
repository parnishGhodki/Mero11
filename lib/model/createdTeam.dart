class selectedTeam {}

class AllPlayers {
  final List<PlayerInfo> wk;
  final List<PlayerInfo> bat;
  final List<PlayerInfo> bowl;
  final List<PlayerInfo> ar;

  AllPlayers({this.wk, this.bat, this.bowl, this.ar});
}

class PlayerInfo {
  final String Name;
  final String Fixture;
  final String FanastyPoints;
  final String Credits;

  PlayerInfo({this.Name, this.Fixture, this.FanastyPoints, this.Credits});
}
