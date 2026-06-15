import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/unit_category.dart';
import '../providers/converter_provider.dart';
import '../utils/conversion_logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      final provider = Provider.of<ConverterProvider>(context, listen: false);
      if (!_tabController.indexIsChanging) {
        if (provider.currentCategory.index != _tabController.index) {
          provider.setCategory(UnitCategory.values[_tabController.index]);
        }
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.straighten), text: 'Length'),
            Tab(icon: Icon(Icons.fitness_center), text: 'Weight'),
            Tab(icon: Icon(Icons.thermostat), text: 'Temp'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [ConverterBody(), ConverterBody(), ConverterBody()],
      ),
    );
  }
}

class ConverterBody extends StatelessWidget {
  const ConverterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<ConverterProvider>(
        builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter value',
                  border: OutlineInputBorder(),
                  suffixText: provider.fromUnit,
                ),
                onChanged: (value) => provider.setInputValue(value),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildDropdown(
                      label: 'From',
                      value: provider.fromUnit,
                      units:
                          ConversionLogic.unitLists[provider.currentCategory]!,
                      onChanged: (val) => provider.setFromUnit(val!),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.swap_horiz),
                    onPressed: () => provider.swapUnits(),
                  ),
                  Expanded(
                    child: _buildDropdown(
                      label: 'To',
                      value: provider.toUnit,
                      units:
                          ConversionLogic.unitLists[provider.currentCategory]!,
                      onChanged: (val) => provider.setToUnit(val!),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Card(
                elevation: 4,
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const Text(
                        'Result',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${provider.result.toStringAsFixed(4)} ${provider.toUnit}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> units,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        DropdownButton<String>(
          value: value,
          isExpanded: true,
          items: units.map((String unit) {
            return DropdownMenuItem<String>(value: unit, child: Text(unit));
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
