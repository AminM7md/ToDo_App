import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_colors.dart';
import 'package:todo_app/firebase_utils.dart';
import 'package:todo_app/providers/app_config_provider.dart';
import 'package:todo_app/providers/auth_user_provider.dart';
import 'package:todo_app/providers/list_provider.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/task_list/task_list_item.dart';

class TaskListTab extends StatefulWidget {
  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {
  @override
  Widget build(BuildContext context) {
    ///in case if used provider with .get() instead of Stream<> .snapshot()
    var listProvider = Provider.of<ListProvider>(context);
    var authProvider = Provider.of<AuthUserProvider>(context);

    if(listProvider.tasksList.isEmpty){
    listProvider.getAllTasksFromFireStore(authProvider.currentUser!.id!);
    }
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        Column(
          children: [
            Container(
              //height: MediaQuery.of(context).size.height * 0.13,
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff5D9CEC),
                    provider.appTheme == ThemeMode.light
                        ?Color(0xffebeeeb)
                        :Color(0xff060E1E),
                  ],
                ),
              ),
              child: Column(
                children: [
                  EasyDateTimeLine(
                    initialDate: listProvider.selectDate,
                    //DateTime.now(),
                    onDateChange: (selectedDate) {
                      ///`selectedDate` the new date selected.
                      listProvider.changeSelectDate(selectedDate, authProvider.currentUser!.id!);
                    },
                    locale: provider.appLanguage,
                    headerProps: EasyHeaderProps(
                      monthPickerType: MonthPickerType.dropDown,
                      dateFormatter: DateFormatter.fullDateMDY(),
                    ),
                    dayProps: EasyDayProps(
                      dayStructure: DayStructure.dayStrDayNumMonth,
                      activeDayStyle: DayStyle(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: AppColors.primaryColor
                          // gradient: LinearGradient(
                          //   begin: Alignment.topCenter,
                          //   end: Alignment.bottomCenter,
                          //   colors: [
                          //     Color(0xff3371FF),
                          //     Color(0xff83a7e5),
                          //     //Color(0xff8426D6),
                          //   ],
                          // ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index){
                    return TaskListItem(task: listProvider.tasksList[index]);
                  },
                itemCount: listProvider.tasksList.length,
              ),
            ),
          ],
        ),
      ],
    );
  }
}