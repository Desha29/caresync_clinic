import 'package:flutter_bloc/flutter_bloc.dart';

enum DashboardTab { dashboard, appointments, doctors, patients, billing, reports, settings }

class DashboardCubit extends Cubit<DashboardTab> {
  DashboardCubit() : super(DashboardTab.dashboard);

  void changeTab(DashboardTab tab) {
    emit(tab);
  }
}
