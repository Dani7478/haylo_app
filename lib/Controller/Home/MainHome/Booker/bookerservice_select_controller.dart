import 'package:get/get.dart';
import 'package:haylo_app/Model/providerdetail_model.dart';
import 'package:haylo_app/Model/uniquecategory_model.dart';
import 'package:intl/intl.dart';
import '../../../../Model/service.dart';
import '../../../../View/Common Widgets/navigate.dart';
import '../../../../View/Screens/Home/MainHome/Booker/bookerlocation_selectorview.dart';

class BookerServiceSelectController extends GetxController {
  bool isLoading = true;
  List<String> monthsList = [];
  List<List<String>> dateLists = [];
  List<String> timeList = [];
  bool isImediatly=false;


  int monthSelectedIndex = 0;
  int selectedDateIndex = 0;
  int selectedTimeIndex = 0;

  @override
  void onInit() {
    gettingAllData();
    super.onInit();
  }


  changeTimeIndex({index}) {
    selectedTimeIndex = index;
    update();
  }

  changeIsImmediately(bool value){
    isImediatly = value;
    print(isImediatly);
    update();
  }

  changeDateIndex({index}) {
    print('Change index to : $index');
    selectedDateIndex = index;
    update();
  }

  changeMonthIndex({type}) {
    print(monthsList.length);
    if (type == '-') {
      if (monthSelectedIndex != 0) {
        monthSelectedIndex--;
      }
    }
    if (type == '+') {
      if (monthSelectedIndex != 5) {
        monthSelectedIndex++;
      }
    }
    update();
  }

  gettingAllData() async {
    dateLists.clear();
    monthsList = await getMonthsAndDates();
    for (int i = 0; i < monthsList.length; i++) {
      List<String> dates = await getMonthDates(monthsList[i]);
      dateLists.add(dates);
    }
    timeList = await getTimeList();
    isLoading = false;
    update();
  }

  Future<List<String>> getMonthsAndDates() async {
    DateTime currentDate = DateTime(DateTime
        .now()
        .year, DateTime
        .now()
        .month);
    List<String> monthsAndDates = [];

    for (int i = 0; i < 6; i++) {
      String formattedMonthAndYear =
      DateFormat('MMMM yyyy').format(currentDate);
      monthsAndDates.add(formattedMonthAndYear);
      currentDate = DateTime(currentDate.year, currentDate.month + 1);
    }

    return monthsAndDates;
  }

  Future<List<String>> getMonthDates(String month) async {
    DateFormat dateFormat = DateFormat('MMMM yyyy');
    DateFormat dateDayFormat = DateFormat('E d');

    DateTime currentMonth = dateFormat.parse(month);
    DateTime firstDayOfMonth =
    DateTime(currentMonth.year, currentMonth.month, 1);
    DateTime lastDayOfMonth =
    DateTime(currentMonth.year, currentMonth.month + 1, 0);

    List<String> datesOfMonth = [];
    DateTime currentDate = firstDayOfMonth;

    while (currentDate.isBefore(lastDayOfMonth)) {
      String formattedDate = dateDayFormat.format(currentDate);
      datesOfMonth.add(formattedDate);
      currentDate = currentDate.add(Duration(days: 1));
    }

    return datesOfMonth;
  }

  Future<List<String>> getTimeList() async {
    DateFormat timeFormat = DateFormat('hh:mm a');

    List<String> times = [];
    DateTime currentTime = DateTime.now();

    for (int i = 0; i < 24; i++) {
      DateTime nextTime = DateTime(
          currentTime.year, currentTime.month, currentTime.day, i);
      String formattedTime = timeFormat.format(nextTime);
      times.add(formattedTime);
    }

    return times;
  }


  //__________________go to next screen with pass data
  goNext(Services service, UniqueCategoryModel provider) {
    String date='${dateLists[monthSelectedIndex][selectedDateIndex].split(
        ' ')[1]} ${monthsList[monthSelectedIndex]}';
    String? currentTime;
    if(isImediatly==true){
     currentTime=  getCurrentTime();
    date= getCurrentDate();
    }
    moveUTD(screen:  BookerLocationSelectorView(
      service: service,
      provider: provider,
      date: date,
      time:isImediatly==false ? timeList[selectedTimeIndex]: currentTime!,
      immediately: isImediatly,
    ));
  }


  //____________________get current Time like 09:55 AM
  String getCurrentTime() {
    final currentTime = DateTime.now();
    final formattedTime = DateFormat('hh:mm a').format(currentTime);
    return formattedTime;
  }

  //___________________gettign current date in the format of 23 June 2023
  String getCurrentDate() {
    final currentDate = DateTime.now();
    final formattedDate = DateFormat('dd MMMM yyyy').format(currentDate);
    return formattedDate;
  }
}
