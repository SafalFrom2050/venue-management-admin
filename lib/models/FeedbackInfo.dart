class FeedbackInfo {
  final String userName;
  final String email;
  final String phone;
  final String feedback;
  final String date;

  FeedbackInfo(this.userName, this.email, this.phone, this.feedback, this.date);
}

List demoFeedbacks = [
  FeedbackInfo("Subina Chuni", "subina@gmail.com", "8989898989",
      "The user interface of this app is very intuitive.", "2022-04-02"),
  FeedbackInfo("Prakriti Khadka", "prakiti@gmail.com", "767676777",
      "Best app for booking events!", "2022-04-01"),
  FeedbackInfo(
      "Jyoti Jyoti", "jyoti@gmail.com", "8787878787", "Good app", "2022-04-10"),
  FeedbackInfo("Laxman Wagley", "laxman@gmail.com", "3232343454",
      "Should add more features!", "2022-04-08"),
];
