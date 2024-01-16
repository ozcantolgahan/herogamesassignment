class TimeHelper {
  static getDateDDMMYY(DateTime date) {
    String formattedDate = "";
    if (date.day < 10) {
      formattedDate += "0" + date.day.toString();
    } else {
      formattedDate = date.day.toString();
    }
    if (date.month < 10) {
      formattedDate += ".0" + date.month.toString();
    } else {
      formattedDate += "." + date.month.toString();
    }
    formattedDate += "." + date.year.toString();
    return formattedDate;
  }
}
