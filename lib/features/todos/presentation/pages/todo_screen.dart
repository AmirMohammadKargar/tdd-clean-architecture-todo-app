import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/core/widgets/custom_appBar.dart';
import 'package:todo/core/widgets/custom_divider.dart';
import 'package:todo/core/widgets/error_widget.dart';
import 'package:todo/dependency_injection.dart';
import 'package:todo/features/todos/data/models/date_model.dart';
import 'package:todo/features/todos/data/models/task_model.dart';
import 'package:todo/features/todos/presentation/cubit/todo_cubit.dart';
import 'package:todo/features/todos/presentation/widgets/calander.dart';
import 'package:todo/features/todos/presentation/widgets/day_title.dart';
import 'package:todo/features/todos/presentation/widgets/task_list.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<TodoCubit>()..getTodosEvent(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              _buildAppBar(),
              BlocConsumer<TodoCubit, TodoState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is Loaded) {
                      return Expanded(
                        child: Column(
                          children: [
                            const CustomDivider(),
                            _buildCalender(state),
                            const CustomDivider(),
                            _buildDayTitle(state),
                            _buildTaskList(state),
                          ],
                        ),
                      );
                    } else if (state is Error) {
                      return const CustomErrorWidget();
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  TaskList _buildTaskList(Loaded state) {
    return TaskList(
      tasks: state.todo.tasks as List<TaskModel>,
    );
  }

  Padding _buildDayTitle(Loaded state) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 3.0.w,
        vertical: 2.0.h,
      ),
      child: DayTitle(
        today: state.todo.date as DateModel,
      ),
    );
  }

  Padding _buildCalender(Loaded state) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 3.0.w),
      child: Calender(
        today: state.todo.date as DateModel,
      ),
    );
  }

  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      title: "Scheduling",
      onTap: () {},
    );
  }
}
