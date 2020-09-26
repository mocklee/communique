class Email {
  final String anonymousID;
  final List<String> tags;
  final int sentClickCount;
  final String title;
  final String subject;
  final List<String> destination;
  final String body;
  final List<Report> reports;

  Email({
      this.anonymousID,
      this.tags,
      this.title,
      this.subject,
      this.destination,
      this.body})
    : sentClickCount = 0;
      reports = [];
}
