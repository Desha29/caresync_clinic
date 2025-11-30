import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String currentView = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // SIDEBAR
          Container(
            width: 280,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primaryBlue, AppColors.primaryBlueDark],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 16,
                  offset: const Offset(4, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.network(
                          'https://agi-prod-file-upload-public-main-use1.s3.amazonaws.com/99f798ab-c24f-4eab-b82d-c5af5a74f6e0',
                          errorBuilder: (_, __, ___) => const Icon(
                            Icons.local_hospital,
                            color: AppColors.primaryBlue,
                            size: 36,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'CareSync',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Clinic System',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.white24),
                // Navigation
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildNavSection('MAIN', [
                          ('dashboard', '📊', 'Dashboard'),
                          ('appointments', '📅', 'Appointments'),
                          ('doctors', '👨‍⚕️', 'Doctors'),
                        ]),
                        const SizedBox(height: 24),
                        _buildNavSection('MANAGEMENT', [
                          ('patients', '👥', 'Patients'),
                          ('billing', '💳', 'Billing'),
                          ('reports', '📈', 'Reports'),
                        ]),
                        const SizedBox(height: 24),
                        _buildNavSection('SETTINGS', [
                          ('settings', '⚙️', 'Settings'),
                        ]),
                      ],
                    ),
                  ),
                ),
                const Divider(color: Colors.white24),
                // Logout
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                      icon: const Icon(Icons.logout, size: 18),
                      label: const Text('Logout'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white24,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // MAIN CONTENT
          Expanded(
            child: Column(
              children: [
                // TOP BAR
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 44,
                            decoration: BoxDecoration(
                              color: AppColors.lightGray,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.borderGray),
                            ),
                            child: const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 14),
                                  child: Icon(Icons.search, color: AppColors.mediumGray),
                                ),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search...',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(color: AppColors.mediumGray),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 32),
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.notifications_none, color: AppColors.mediumGray),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: AppColors.lightGray,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.person, color: AppColors.mediumGray),
                        ),
                      ],
                    ),
                  ),
                ),
                // CONTENT
                Expanded(
                  child: Container(
                    color: AppColors.lightGray,
                    child: _buildView(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavSection(String title, List<(String, String, String)> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
            ),
          ),
        ),
        ...items.map((item) {
          final (id, icon, label) = item;
          final isActive = currentView == id;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: isActive ? Colors.white24 : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              dense: true,
              leading: Text(icon, style: const TextStyle(fontSize: 18)),
              title: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () => setState(() => currentView = id),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildView() {
    switch (currentView) {
      case 'dashboard':
        return DashboardView();
      case 'appointments':
        return AppointmentsView();
      case 'doctors':
        return DoctorsView();
      case 'patients':
        return PatientsView();
      case 'billing':
        return BillingView();
      case 'reports':
        return ReportsView();
      case 'settings':
        return SettingsView();
      default:
        return DashboardView();
    }
  }
}

// lib/presentation/widgets/dashboard_widgets.dart


// DASHBOARD VIEW
class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGray,
                    ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Book Appointment'),
              ),
            ],
          ),
          const SizedBox(height: 28),
          // Stat Cards
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [
              _buildStatCard('Total\nAppointments', '24', '↑ 12%', null),
              _buildStatCard('Completed', '18', '✓ On track', AppColors.successGreen),
              _buildStatCard('Pending', '4', '⏳ Awaiting', AppColors.warningOrange),
              _buildStatCard('Cancelled', '2', '❌ Cancelled', AppColors.errorRed),
            ],
          ),
          const SizedBox(height: 32),
          // Content Cards
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            childAspectRatio: 1.3,
            children: [
              _buildAppointmentsCard(),
              _buildDoctorsCard(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, String change, Color? color) {
    final borderColor = color ?? AppColors.primaryBlue;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: borderColor, width: 5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.mediumGray, fontSize: 12, fontWeight: FontWeight.w600, height: 1.4)),
          Text(value, style: const TextStyle(color: AppColors.darkGray, fontSize: 32, fontWeight: FontWeight.bold)),
          Text(change, style: TextStyle(color: color ?? AppColors.successGreen, fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildAppointmentsCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Upcoming Appointments', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: const [
                _AppointmentItem('Dr. Ahmed Hassan', 'Dec 15, 10:00 AM', 'Confirmed'),
                _AppointmentItem('Dr. Fatima Mohamed', 'Dec 18, 2:30 PM', 'Confirmed'),
                _AppointmentItem('Dr. Mohamed Ali', 'Dec 20, 11:15 AM', 'Pending'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorsCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Available Doctors', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: const [
                _DoctorItem('👨‍⚕️', 'Dr. Ahmed Hassan', 'Cardiology', '4.8 ⭐'),
                _DoctorItem('👨‍⚕️', 'Dr. Fatima Mohamed', 'Dermatology', '4.9 ⭐'),
                _DoctorItem('👨‍⚕️', 'Dr. Mohamed Ali', 'Orthopedics', '4.7 ⭐'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppointmentItem extends StatelessWidget {
  final String doctor;
  final String time;
  final String status;

  const _AppointmentItem(this.doctor, this.time, this.status);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctor, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                Text(time, style: const TextStyle(color: AppColors.mediumGray, fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.successGreenLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text('Confirmed', style: TextStyle(fontSize: 11, color: AppColors.successGreen, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}

class _DoctorItem extends StatelessWidget {
  final String icon;
  final String name;
  final String specialty;
  final String rating;

  const _DoctorItem(this.icon, this.name, this.specialty, this.rating);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primaryBlueLighter,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 32)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                Text(specialty, style: const TextStyle(fontSize: 12, color: AppColors.mediumGray)),
              ],
            ),
          ),
          Text(rating, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// APPOINTMENTS VIEW
class AppointmentsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Manage Appointments', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.add), label: const Text('New Appointment')),
            ],
          ),
          const SizedBox(height: 28),
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('All Appointments', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Patient')),
                      DataColumn(label: Text('Doctor')),
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Status')),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text('Ahmed Ali')),
                        DataCell(Text('Dr. Hassan')),
                        DataCell(Text('Dec 15')),
                        DataCell(Text('✓ Confirmed')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Fatima Ahmed')),
                        DataCell(Text('Dr. Fatima')),
                        DataCell(Text('Dec 18')),
                        DataCell(Text('⏳ Pending')),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// DOCTORS VIEW
class DoctorsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Doctor Management', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.add), label: const Text('Add Doctor')),
            ],
          ),
          const SizedBox(height: 28),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            children: [
              _buildDoctorCard('👨‍⚕️', 'Dr. Ahmed Hassan', 'Cardiology', '4.8', '25'),
              _buildDoctorCard('👨‍⚕️', 'Dr. Fatima Mohamed', 'Dermatology', '4.9', '18'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard(String icon, String name, String specialty, String rating, String reviews) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 44)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    Text(specialty, style: const TextStyle(fontSize: 12, color: AppColors.mediumGray)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text('⭐ $rating ($reviews reviews)', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Edit'))),
              const SizedBox(width: 8),
              Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Delete'))),
            ],
          ),
        ],
      ),
    );
  }
}

// PATIENTS VIEW
class PatientsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Patient Management', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 28),
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('All Patients', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Phone')),
                      DataColumn(label: Text('Appointments')),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(Text('Ahmed Ali')),
                        DataCell(Text('ahmed@email.com')),
                        DataCell(Text('+20 123 456')),
                        DataCell(Text('5')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Fatima Ahmed')),
                        DataCell(Text('fatima@email.com')),
                        DataCell(Text('+20 654 321')),
                        DataCell(Text('3')),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// BILLING VIEW
class BillingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Billing & Payments', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 28),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.85,
            children: [
              _buildBillingCard('Total Revenue', '\$12,450', '↑ 8%', null),
              _buildBillingCard('Paid Invoices', '28', '✓ Done', AppColors.successGreen),
              _buildBillingCard('Pending', '3', '⏳ Await', AppColors.warningOrange),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBillingCard(String label, String value, String change, Color? color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: color ?? AppColors.primaryBlue, width: 5)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.mediumGray, fontSize: 12, fontWeight: FontWeight.w600)),
          Text(value, style: const TextStyle(color: AppColors.darkGray, fontSize: 28, fontWeight: FontWeight.bold)),
          Text(change, style: TextStyle(color: color ?? AppColors.successGreen, fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// REPORTS VIEW
class ReportsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Reports & Analytics', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 28),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            childAspectRatio: 1.3,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Monthly Appointments', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: AppColors.primaryBlueLighter, borderRadius: BorderRadius.circular(12)),
                        child: const Center(child: Text('📊 Chart')),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Doctor Performance', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 12),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(color: AppColors.successGreenLight, borderRadius: BorderRadius.circular(12)),
                        child: const Center(child: Text('📈 Metrics')),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// SETTINGS VIEW
class SettingsView extends StatefulWidget {
  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late TextEditingController clinicNameController;

  @override
  void initState() {
    super.initState();
    clinicNameController = TextEditingController(text: 'Central Clinic');
  }

  @override
  void dispose() {
    clinicNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('System Settings', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 28),
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Clinic Configuration', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Clinic Name', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: clinicNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.save), label: const Text('Save Changes')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
