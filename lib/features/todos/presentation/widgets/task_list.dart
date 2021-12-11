import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/core/helper/hexToColor.dart';
import 'package:todo/features/todos/data/models/task_model.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.tasks,
  }) : super(key: key);
  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 3.0.w,
                vertical: 1.0.h,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: hexToColor(tasks[index].color),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 2.0.h,
                    horizontal: 2.0.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(tasks[index].time),
                          SizedBox(
                            height: 1.0.h,
                          ),
                          Text(tasks[index].title),
                        ],
                      ),
                      Icon(
                        tasks[index].done
                            ? Icons.check_circle_outline
                            : Icons.circle_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
