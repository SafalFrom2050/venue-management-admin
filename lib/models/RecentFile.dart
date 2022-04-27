class RecentBooking {
  final String? eventName, date, userName;

  RecentBooking({this.eventName, this.date, this.userName});
}

List demoRecentFiles = [
  RecentBooking(
    eventName: "Wedding",
    date: "01-03-2021",
    userName: "Nikhil Shrestha",
  ),
  RecentBooking(
    eventName: "Birthday",
    date: "27-02-2021",
    userName: "Safal Sharma",
  ),
  RecentBooking(
    eventName: "Anniversary",
    date: "23-02-2021",
    userName: "Subina Chuni",
  ),
  RecentBooking(
    eventName: "New Year Party",
    date: "23-02-2021",
    userName: "Harry Potter",
  ),
];
