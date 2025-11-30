import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_colors.dart';
import '../cubit/dashboard/dashboard_cubit.dart';
import '../widgets/sidebar.dart';
import '../widgets/top_bar.dart';
import 'dashboard/overview_view.dart';
import 'appointments/appointments_view.dart';
import 'doctors/doctors_view.dart';
import 'patients/patients_view.dart';
import 'billing/billing_view.dart';
import 'reports/reports_view.dart';
import 'settings/settings_view.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // SIDEBAR
          const Sidebar(),
          // MAIN CONTENT
          Expanded(
            child: Column(
              children: [
                // TOP BAR
                const TopBar(),
                // CONTENT
                Expanded(
                  child: Container(
                    color: AppColors.lightGray,
                    child: BlocBuilder<DashboardCubit, DashboardTab>(
                      builder: (context, state) {
                        return _buildView(state);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildView(DashboardTab tab) {
    switch (tab) {
      case DashboardTab.dashboard:
        return const DashboardOverviewView();
      case DashboardTab.appointments:
        return const AppointmentsView();
      case DashboardTab.doctors:
        return const DoctorsView();
      case DashboardTab.patients:
        return const PatientsView();
      case DashboardTab.billing:
        return const BillingView();
      case DashboardTab.reports:
        return const ReportsView();
      case DashboardTab.settings:
        return const SettingsView();
    }
  }
}
