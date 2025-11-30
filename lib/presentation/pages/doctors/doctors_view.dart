import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

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
              Text('Doctors', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                onPressed: () => _showAddDoctorDialog(context),
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text('Add Doctor', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            childAspectRatio: 0.85,
            children: [
              _buildDoctorCard('Dr. Sarah Khan', 'Cardiologist', '15 years', '4.9', '250+ patients', AppColors.primaryBlue),
              _buildDoctorCard('Dr. John Smith', 'Orthopedic Surgeon', '12 years', '4.8', '180+ patients', AppColors.successGreen),
              _buildDoctorCard('Dr. Emily Davis', 'Pediatrician', '8 years', '4.7', '320+ patients', Colors.purple),
              _buildDoctorCard('Dr. Michael Lee', 'Neurologist', '20 years', '5.0', '140+ patients', AppColors.warningOrange),
              _buildDoctorCard('Dr. Anna Wilson', 'Dermatologist', '10 years', '4.6', '200+ patients', Colors.pink),
              _buildDoctorCard('Dr. James Brown', 'General Physician', '5 years', '4.5', '290+ patients', Colors.teal),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard(String name, String specialty, String experience, String rating, String patients, Color accentColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 12)],
        border: Border(top: BorderSide(color: accentColor, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: accentColor.withValues(alpha: 0.2),
                child: Icon(Icons.person, size: 48, color: accentColor),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(specialty, style: TextStyle(color: accentColor, fontSize: 13, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.work_outline, size: 16, color: AppColors.mediumGray),
                      const SizedBox(width: 6),
                      Text(experience, style: const TextStyle(fontSize: 12, color: AppColors.mediumGray)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 6),
                      Text(rating, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                      const SizedBox(width: 12),
                      Text(patients, style: const TextStyle(fontSize: 12, color: AppColors.mediumGray)),
                    ],
                  ),
                  const Spacer(),
                  Builder(
                    builder: (context) => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _showDoctorProfileDialog(context, name, specialty, experience, rating, patients),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accentColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('View Profile', style: TextStyle(color: Colors.white, fontSize: 13)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDoctorProfileDialog(BuildContext context, String name, String specialty, String experience, String rating, String patients) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: 600,
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.primaryBlueLighter,
                    child: const Icon(Icons.person, size: 48, color: AppColors.primaryBlue),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(specialty, style: const TextStyle(color: AppColors.primaryBlue, fontSize: 16, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _buildProfileInfo('Experience', experience, Icons.work_outline),
                  ),
                  Expanded(
                    child: _buildProfileInfo('Rating', rating, Icons.star),
                  ),
                  Expanded(
                    child: _buildProfileInfo('Patients', patients, Icons.people),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Contact Information', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              _buildContactRow(Icons.email, 'Email', '${name.toLowerCase().replaceAll(' ', '.')}@caresync.com'),
              const SizedBox(height: 12),
              _buildContactRow(Icons.phone, 'Phone', '+20 123 456 789'),
              const SizedBox(height: 12),
              _buildContactRow(Icons.location_on, 'Office', 'Building A, Room 305'),
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Booking appointment with $name')),
                      );
                    },
                    icon: const Icon(Icons.calendar_today, size: 16),
                    label: const Text('Book Appointment'),
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

  Widget _buildProfileInfo(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primaryBlue, size: 28),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: AppColors.mediumGray, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildContactRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.mediumGray),
        const SizedBox(width: 12),
        Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        Text(value, style: const TextStyle(fontSize: 14, color: AppColors.mediumGray)),
      ],
    );
  }

  void _showAddDoctorDialog(BuildContext context) {
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
              const Text('Add Doctor', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              _buildDialogTextField('Full Name'),
              const SizedBox(height: 16),
              _buildDialogTextField('Specialty'),
              const SizedBox(height: 16),
              _buildDialogTextField('Email'),
              const SizedBox(height: 16),
              _buildDialogTextField('Phone'),
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
                        const SnackBar(content: Text('Doctor added successfully!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Add', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDialogTextField(String label) {
    return TextField(
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
}
