class Task {
  final String title;
  bool isDone;
  Task({this.title = "title", this.isDone = false});
  void toggle() {
    isDone = !isDone;
  }
}
