import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/todo_barrel.dart';
import '../models/todo_model.dart';
import '../utils/debounce.dart';

class TodoSearchAndFilter extends StatelessWidget {
  TodoSearchAndFilter({super.key});

  final debounce = Debounce();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            debounce.run(() {
              context.read<TodoSearchCubit>().setSearchTerm(value);
            });
          },
          decoration: const InputDecoration(
            labelText: 'Search todos',
            border: InputBorder.none,
            filled: true,
            suffixIcon: Icon(Icons.search),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context, Filter.done),
          ],
        ),
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter) {
    return TextButton(
      onPressed: () {
        context.read<TodoFilterCubit>().changeFilter(filter);
      },
      child: Text(
        filter == Filter.all
            ? 'All'
            : filter == Filter.active
                ? 'Active'
                : 'Completed',
        style: TextStyle(
          fontSize: 18,
          color: getColor(context, filter),
        ),
      ),
    );
  }

  Color getColor(BuildContext context, Filter filter) {
    final currentFilter = context.watch<TodoFilterCubit>().state.filter;
    return currentFilter == filter ? Colors.blue : Colors.grey;
  }
}
