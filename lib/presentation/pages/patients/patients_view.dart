import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class PatientsView extends StatelessWidget {
  const PatientsView({super.key});

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
              Text('Patient Management', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                onPressed: () => _showAddPatientDialog(context),
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Add Patient', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 12)],
            ),
            child: Column(
              children: [
                _buildTableHeader(),
                const Divider(height: 1),
                _buildTableRow('Ahmed Ali', 'ahmed@email.com', '+20 123 456 789', '28', 'Male', '5'),
                const Divider(height: 1),
                _buildTableRow('Fatima Ahmed', 'fatima@email.com', '+20 987 654 321', '34', 'Female', '3'),
                const Divider(height: 1),
                _buildTableRow('Hassan Ibrahim', 'hassan@email.com', '+20 555 123 456', '45', 'Male', '8'),
                const Divider(height: 1),
                _buildTableRow('Layla Mahmoud', 'layla@email.com', '+20 444 987 654', '22', 'Female', '2'),
                const Divider(height: 1),
                _buildTableRow('Omar Khalil', 'omar@email.com', '+20 333 555 777', '56', 'Male', '12'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: const Row(
        children: [
          Expanded(flex: 2, child: Text('Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
          Expanded(flex: 2, child: Text('Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
          Expanded(flex: 2, child: Text('Phone', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
          Expanded(flex: 1, child: Text('Age', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
          Expanded(flex: 1, child: Text('Gender', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
          Expanded(flex: 1, child: Text('Visits', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
          SizedBox(width: 80),
        ],
      ),
    );
  }

  Widget _buildTableRow(String name, String email, String phone, String age, String gender, String visits) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.primaryBlueLighter,
                  child: Text(name[0], style: const TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 12),
                Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Expanded(flex: 2, child: Text(email, style: const TextStyle(fontSize: 14, color: AppColors.mediumGray))),
          Expanded(flex: 2, child: Text(phone, style: const TextStyle(fontSize: 14))),
          Expanded(flex: 1, child: Text(age, style: const TextStyle(fontSize: 14))),
          Expanded(flex: 1, child: Text(gender, style: const TextStyle(fontSize: 14))),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryBlueLighter,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                visits,
                style: const TextStyle(color: AppColors.primaryBlue, fontSize: 12, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Builder(
            builder: (context) => SizedBox(
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.visibility, size: 18, color: AppColors.primaryBlue),
                    onPressed: () => _showPatientDetailsDialog(context, name, email, phone, age, gender, visits),
                    tooltip: 'View Details',
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, size: 18, color: AppColors.mediumGray),
                    onPressed: () => _showEditPatientDialog(context, name, email, phone),
                    tooltip: 'Edit',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPatientDetailsDialog(BuildContext context, String name, String email, String phone, String age, String gender, String visits) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: 550,
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: AppColors.primaryBlueLighter,
                    child: Text(name[0], style: const TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold, fontSize: 24)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text('$age years old • $gender', style: const TextStyle(color: AppColors.mediumGray, fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 24),
              _buildDetailRow('Email', email, Icons.email),
              const SizedBox(height: 16),
              _buildDetailRow('Phone', phone, Icons.phone),
              const SizedBox(height: 16),
              _buildDetailRow('Total Visits', visits, Icons.medical_services),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      _showMedicalHistoryDialog(context, name);
                    },
                    icon: const Icon(Icons.history, size: 16),
                    label: const Text('Medical History'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.primaryBlue),
        const SizedBox(width: 12),
        Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        Expanded(child: Text(value, style: const TextStyle(fontSize: 14, color: AppColors.mediumGray))),
      ],
    );
  }

  void _showEditPatientDialog(BuildContext context, String name, String email, String phone) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Edit Patient', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              _buildDialogTextField('Full Name', name),
              const SizedBox(height: 16),
              _buildDialogTextField('Email', email),
              const SizedBox(height: 16),
              _buildDialogTextField('Phone', phone),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Patient updated successfully!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Save Changes'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDialogTextField(String label, String initialValue) {
    return TextField(
      controller: TextEditingController(text: initialValue),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.mediumGray, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryBlue, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }

  void _showAddPatientDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Add New Patient', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              _buildDialogTextField('Full Name', ''),
              const SizedBox(height: 16),
              _buildDialogTextField('Email', ''),
              const SizedBox(height: 16),
              _buildDialogTextField('Phone', ''),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildDialogTextField('Age', '')),
                  const SizedBox(width: 16),
                  Expanded(child: _buildDialogTextField('Gender', '')),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Patient added successfully!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Add Patient'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMedicalHistoryDialog(BuildContext context, String patientName) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: 700,
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.history, color: AppColors.primaryBlue, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Medical History', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        Text(patientName, style: const TextStyle(color: AppColors.mediumGray, fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),
              SizedBox(
                height: 400,
                child: ListView(
                  children: [
                    _buildHistoryItem(
                      '2024-01-15',
                      'General Checkup',
                      'Dr. Sarah Khan',
                      'Routine examination - All vitals normal',
                      AppColors.successGreen,
                    ),
                    const SizedBox(height: 16),
                    _buildHistoryItem(
                      '2023-12-10',
                      'Blood Test',
                      'Dr. John Smith',
                      'Complete blood count - Results within normal range',
                      AppColors.primaryBlue,
                    ),
                    const SizedBox(height: 16),
                    _buildHistoryItem(
                      '2023-11-05',
                      'X-Ray',
                      'Dr. Emily Davis',
                      'Chest X-ray - No abnormalities detected',
                      AppColors.primaryBlue,
                    ),
                    const SizedBox(height: 16),
                    _buildHistoryItem(
                      '2023-09-20',
                      'Consultation',
                      'Dr. Michael Lee',
                      'Follow-up consultation - Prescribed medication',
                      AppColors.warningOrange,
                    ),
                    const SizedBox(height: 16),
                    _buildHistoryItem(
                      '2023-08-01',
                      'Vaccination',
                      'Dr. Sarah Khan',
                      'Annual flu vaccination administered',
                      AppColors.successGreen,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Downloading medical history...')),
                      );
                    },
                    icon: const Icon(Icons.download, size: 16),
                    label: const Text('Download'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryItem(String date, String title, String doctor, String notes, Color statusColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderGray, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4,
            height: 60,
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(date, style: const TextStyle(fontSize: 12, color: AppColors.mediumGray)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(doctor, style: const TextStyle(fontSize: 13, color: AppColors.primaryBlue, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Text(notes, style: const TextStyle(fontSize: 13, color: AppColors.mediumGray)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
