import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/models/transaction.dart';
import '../../provider/transaction_provider.dart';

class AddTransactionFab extends StatelessWidget {
  const AddTransactionFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF6366f1), Color(0xFFa855f7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: FloatingActionButton(
        onPressed: () {
          _showAddTransactionSheet(context);
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }

  void _showAddTransactionSheet(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();
    final categoryController = TextEditingController();
    bool isIncome = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 20,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add Transaction',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(titleController, 'Title', Icons.title),
                    const SizedBox(height: 15),
                    _buildTextField(
                      amountController,
                      'Amount',
                      Icons.attach_money,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 15),
                    _buildTextField(
                      categoryController,
                      'Category',
                      Icons.category,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          'Type:',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(width: 20),
                        ChoiceChip(
                          label: const Text('Expense'),
                          selected: !isIncome,
                          onSelected: (val) => setState(() => isIncome = !val),
                          selectedColor: Colors.redAccent.withValues(
                            alpha: 0.3,
                          ),
                          labelStyle: TextStyle(
                            color: !isIncome ? Colors.redAccent : Colors.black,
                          ),
                        ),
                        const SizedBox(width: 10),
                        ChoiceChip(
                          label: const Text('Income'),
                          selected: isIncome,
                          onSelected: (val) => setState(() => isIncome = val),
                          selectedColor: Colors.greenAccent.withValues(
                            alpha: 0.3,
                          ),
                          labelStyle: TextStyle(
                            color: isIncome ? Colors.greenAccent : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6366f1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {
                          if (titleController.text.isNotEmpty &&
                              amountController.text.isNotEmpty) {
                            final tx = Transaction(
                              title: titleController.text,
                              amount:
                                  double.tryParse(amountController.text) ?? 0,
                              category: categoryController.text,
                              date: DateTime.now(),
                              isIncome: isIncome,
                            );
                            Provider.of<TransactionProvider>(
                              context,
                              listen: false,
                            ).addTransaction(tx);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          'Save Transaction',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54),
        prefixIcon: Icon(icon, color: Colors.white54),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
