import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class BillingView extends StatelessWidget {
  const BillingView({super.key});

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
            childAspectRatio: 1.3,
            children: [
              _buildBillingCard('Total Revenue', '\$45,280', '↑ 12%', Icons.trending_up, AppColors.successGreen),
              _buildBillingCard('Paid Invoices', '124', '28 this week', Icons.check_circle, AppColors.primaryBlue),
              _buildBillingCard('Pending', '\$2,350', '8 invoices', Icons.pending, AppColors.warningOrange),
            ],
          ),
          const SizedBox(height: 32),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 12)],
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Recent Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                _buildTransactionRow('Ahmed Ali', 'Consultation Fee', '\$150', 'Paid', AppColors.successGreen, '2 hours ago'),
                const Divider(),
                _buildTransactionRow('Fatima Ahmed', 'Lab Tests', '\$85', 'Paid', AppColors.successGreen, '5 hours ago'),
                const Divider(),
                _buildTransactionRow('Hassan Ibrahim', 'Surgery', '\$2,500', 'Pending', AppColors.warningOrange, '1 day ago'),
                const Divider(),
                _buildTransactionRow('Layla Mahmoud', 'X-Ray', '\$120', 'Paid', AppColors.successGreen, '2 days ago'),
                const Divider(),
                _buildTransactionRow('Omar Khalil', 'Medication', '\$65', 'Paid', AppColors.successGreen, '3 days ago'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillingCard(String label, String value, String subtitle, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 12)],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(color: AppColors.mediumGray, fontSize: 13, fontWeight: FontWeight.w600)),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: const TextStyle(color: AppColors.darkGray, fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(subtitle, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionRow(String patient, String service, String amount, String status, Color statusColor, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: statusColor.withValues(alpha: 0.1),
            child: Text(patient[0], style: TextStyle(color: statusColor, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(patient, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(service, style: const TextStyle(fontSize: 12, color: AppColors.mediumGray)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(status, style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Text(time, style: const TextStyle(fontSize: 11, color: AppColors.mediumGray)),
        ],
      ),
    );
  }
}
