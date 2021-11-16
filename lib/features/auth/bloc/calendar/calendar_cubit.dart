import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calendar_state.dart';

/// Calendar cubit controls the current date
/// Todo bloc should be listening the calendar cubit
/// and change the information presentation according
/// to the given calendar date

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarInitial());
}
