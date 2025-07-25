import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../Controller/DoctorParticularPatientMedicineController.dart';
import '../../../Controller/Medicine_Controller/Brand_Controller.dart';
import '../../../Controller/Medicine_Controller/FrequencyController.dart';
import '../../../Controller/Medicine_Controller/Medicine_Controller.dart';
import '../../../Service/Api_Service.dart';
import '../../../utils/color_util.dart';
import '../Common_Widget/popups.dart';
import '../Medicine/Medicine.dart';

class Editmedicine extends StatefulWidget {
  final String medicine;
  final String token;
  final String brand;
  final String frequency;
  final String Strength;
  final String dosage;
  final String uom;
  final String route;
  final String remarks;
  final int period;
  final int id;
  final int patientId;
  final int quality;

  const Editmedicine({
    super.key,
    required this.medicine,
    required this.brand,
    required this.frequency,
    required this.Strength,
    required this.dosage,
    required this.uom,
    required this.route,
    required this.remarks,
    required this.period,
    required this.quality,
    required this.token, required this.id, required this.patientId,
  });

  @override
  _EditmedicineState createState() => _EditmedicineState();
}

class _EditmedicineState extends State<Editmedicine> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController strengthController;
  late TextEditingController dosageController;
  late TextEditingController routeController;
  late TextEditingController remarksController;
  late TextEditingController periodController;
  late TextEditingController quantityController;

  String? selectedMedicine;
  String? selectedBrand;
  String? selectedFrequency;
  String? selectedUOM;
  bool spinner = false;

  // @override
  // void initState() {
  //   super.initState();
  //   strengthController = TextEditingController(text: widget.Strength);
  //   dosageController = TextEditingController(text: widget.dosage);
  //   routeController = TextEditingController(text: widget.route);
  //   remarksController = TextEditingController(text: widget.remarks);
  //   periodController = TextEditingController(text: widget.period.toString());
  //   quantityController = TextEditingController(text: widget.quality.toString());
  //
  //   selectedMedicine = widget.medicine;
  //   selectedBrand = widget.brand;
  //   selectedFrequency = widget.frequency;
  //   selectedUOM = widget.uom;
  // }
  @override
  void initState() {
    super.initState();

    strengthController = TextEditingController(text: widget.Strength);
    dosageController = TextEditingController(text: widget.dosage);
    routeController = TextEditingController(text: widget.route);
    remarksController = TextEditingController(text: widget.remarks);
    periodController = TextEditingController(text: widget.period.toString());
    quantityController = TextEditingController(text: widget.quality.toString());

    selectedMedicine = widget.medicine;
    selectedFrequency = widget.frequency;
    selectedUOM = widget.uom;

    Future.delayed(Duration.zero, () async {
      final medicineController = Get.find<MedicineController>();
      final brandController = Get.find<BrandController>();

      /// Wait until medicine list is populated
      if (medicineController.medicineList.isEmpty) {
        await medicineController.medicineDataz(widget.token);
      }

      // Match initial medicine name to ID and fetch its brands
      final selected = medicineController.medicineList
          .firstWhereOrNull((e) => e?.name == widget.medicine);

      if (selected?.id != null) {
        await brandController.brandDataz(widget.token, selected!.id!);

        /// Now match brand name to actual brand in list (after list is populated)
        final brandMatch = brandController.brandList
            .firstWhereOrNull((e) => e?.brandName == widget.brand);

        setState(() {
          selectedBrand = brandMatch?.brandName;
        });
      }
    });
  }

  @override
  void dispose() {
    strengthController.dispose();
    dosageController.dispose();
    routeController.dispose();
    remarksController.dispose();
    periodController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "EDIT MEDICINE",
                    style: GoogleFonts.shanti(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w900,
                      fontSize: 20.h,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          final medicineController =
                          Get.find<MedicineController>();
                          final brandController = Get.find<BrandController>();

                          // Build a list of medicine names for display
                          final medicineItems = medicineController.medicineList
                              .where((e) => e?.name?.isNotEmpty ?? false)
                              .map((e) => e!.name!)
                              .toList();

                          return DropdownSearch<String>(
                            items: medicineItems,
                            selectedItem: selectedMedicine,
                            onChanged: (value) async {
                              // Update selected medicine name
                              // setState(() => selectedMedicine = value);
                              setState(() {
                                selectedMedicine = value;
                                selectedBrand = null; // ✅ Clear brand selection
                              });
                              // Find selected medicine object
                              final selected = medicineController.medicineList
                                  .firstWhereOrNull(
                                      (element) => element?.name == value);

                              // Short delay (optional)
                              await Future.delayed(
                                  const Duration(milliseconds: 50));

                              // Fetch brand data by selected medicine id
                              if (selected?.id != null) {
                                await brandController.brandDataz(
                                    widget.token, selected!.id!);
                              }
                            },
                            dropdownDecoratorProps:
                            _buildDropdownDecorator("Select Medicine"),
                            popupProps: _buildPopupProps("Search Medicine"),
                            validator: _dropdownValidator,
                          );
                        }),

                        SizedBox(height: 8),

                        // Brand Dropdown
                        Obx(() {
                          final brandController = Get.find<BrandController>();
                          return DropdownSearch<String>(
                            items: brandController.brandList
                                .map((e) => e?.brandName ?? '')
                                .where((name) => name.isNotEmpty)
                                .toList(),
                            selectedItem: selectedBrand,
                            onChanged: (value) =>
                                setState(() => selectedBrand = value),
                            dropdownDecoratorProps:
                            _buildDropdownDecorator("Select Brand"),
                            popupProps: _buildPopupProps("Search Brand"),
                            validator: _dropdownValidator,
                          );
                        }),
                        SizedBox(height: 8),
                        Obx(() {
                          final frequencyController =
                          Get.find<FrequencyController>();
                          return DropdownSearch<String>(
                            items: frequencyController.frequencyList
                                .map((e) => e?.name ?? '')
                                .where((name) => name.isNotEmpty)
                                .toList(),
                            selectedItem: selectedFrequency,
                            onChanged: (value) =>
                                setState(() => selectedFrequency = value),
                            dropdownDecoratorProps:
                            _buildDropdownDecorator("Select Frequency"),
                            popupProps: _buildPopupProps("Search Frequency"),
                            validator: _dropdownValidator,
                          );
                        }),

                        SizedBox(height: 8),

                        // Strength & Dosage
                        Row(children: [
                          Expanded(
                              child: _buildTextField(
                                  "Strength", strengthController)),
                          SizedBox(width: 6),
                          Expanded(
                              child:
                              _buildTextField("Dosage", dosageController)),
                        ]),

                        // UOM & Route
                        Row(children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              value: selectedUOM,
                              items: ['ML', "No's"].map((String unit) {
                                return DropdownMenuItem<String>(
                                  value: unit,
                                  child: Text(unit),
                                );
                              }).toList(),
                              onChanged: (value) =>
                                  setState(() => selectedUOM = value),
                              validator: (value) =>
                              value == null || value.trim().isEmpty
                                  ? 'Please select UOM'
                                  : null,
                              decoration: _inputDecoration("UOM"),
                            ),
                          ),
                          SizedBox(width: 6),
                          Expanded(
                              child: _buildTextField("Route", routeController)),
                        ]),

                        // Period & Quantity
                        Row(children: [
                          Expanded(
                              child: _buildNumericField(
                                  "Period", periodController)),
                          SizedBox(width: 6),
                          Expanded(
                              child: _buildNumericField(
                                  "Quantity", quantityController)),
                        ]),

                        // Remarks
                        _buildTextField("Remarks", remarksController),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildSubmitButton(),
    );
  }

  DropDownDecoratorProps _buildDropdownDecorator(String label) {
    return DropDownDecoratorProps(
      dropdownSearchDecoration: InputDecoration(
        labelText: label,
        hintText: label,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  PopupProps<String> _buildPopupProps(String hint) {
    return PopupProps.menu(
      showSearchBox: true,
      itemBuilder: (context, item, isSelected) => ListTile(title: Text(item)),
      searchFieldProps: TextFieldProps(
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }

  String? _dropdownValidator(String? val) {
    if (val == null || val.trim().isEmpty) return 'Please select a value';
    return null;
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: label,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colorutils.userdetailcolor, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildNumericField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: _inputDecoration(label),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      hintText: label,
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        gradient: LinearGradient(colors: [Colors.teal.shade50, Colors.white]),
        boxShadow: [
          BoxShadow(color: Colors.teal.withOpacity(0.3), blurRadius: 2)
        ],
      ),
      child: Center(
        child: spinner
            ? Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Center(child: spinkitNew))
            : GestureDetector(
          onTap: () async {
            final medicineController = Get.find<MedicineController>();
            final brandController = Get.find<BrandController>();
            final frequencyController = Get.find<FrequencyController>();

            // Match selected values to get the corresponding model and fetch ID
            final selectedMedicineModel = medicineController
                .medicineList
                .firstWhereOrNull((e) => e?.name == selectedMedicine);
            final selectedBrandModel = brandController.brandList
                .firstWhereOrNull((e) => e?.brandName == selectedBrand);
            final selectedFrequencyModel = frequencyController
                .frequencyList
                .firstWhereOrNull((e) => e?.name == selectedFrequency);

            context.loaderOverlay.show();
            Map<String, dynamic> resp = await ApiServices.submitMedicine(
              token: widget.token,
              medineId: widget.id,
              medicine: selectedMedicineModel?.id ?? 0,
              frequency:selectedFrequencyModel?.id ?? 0,
              brand: selectedBrandModel?.brand ?? 0,
              period: int.tryParse(periodController.text.trim()) ?? 0,
              quantity: int.tryParse(quantityController.text.trim()) ?? 0,
              strength:strengthController.text.trim(),
              dosage: dosageController.text.trim(),
              Uom: selectedUOM ?? "",
              route: routeController.text.trim(),
              remarks: remarksController.text.trim(),);
            if (resp['status'] == "OK") {

              await Get.find<DoctorParticularPatientMedicineController>()
                  .DoctorParticularPatientMedicineDataz(widget.token, widget.patientId);
              context.loaderOverlay.hide();

              ProductAppPopUps.submit2Back(
                title: "Success",
                message: resp['message'] ?? 'Something went wrong.',
                actionName: "Close",
                iconData: Icons.done,
                iconColor: Colorutils.userdetailcolor,
              );
            } else {
              context.loaderOverlay.hide();

              ProductAppPopUps.submit(
                title: "Failed",
                message: 'Something went wrong.',
                actionName: "Close",
                iconData: Icons.error_outline,
                iconColor: Colors.red,
              );
            }

            // if (_formKey.currentState!.validate()) {
            //   // Access each controller
            //   final medicineController = Get.find<MedicineController>();
            //   final brandController = Get.find<BrandController>();
            //   final frequencyController = Get.find<FrequencyController>();
            //
            //   // Match selected values to get the corresponding model and fetch ID
            //   final selectedMedicineModel = medicineController
            //       .medicineList
            //       .firstWhereOrNull((e) => e?.name == selectedMedicine);
            //   final selectedBrandModel = brandController.brandList
            //       .firstWhereOrNull((e) => e?.brandName == selectedBrand);
            //   final selectedFrequencyModel = frequencyController
            //       .frequencyList
            //       .firstWhereOrNull((e) => e?.name == selectedFrequency);
            //
            //   // Build your payload with IDs
            //   final data = {
            //     "medicine_id": selectedMedicineModel?.id,
            //     "brand_id": selectedBrandModel?.brand,
            //     "frequency_id": selectedFrequencyModel?.id,
            //     "strength": strengthController.text.trim(),
            //     "dosage": dosageController.text.trim(),
            //     "uom": selectedUOM,
            //     "route": routeController.text.trim(),
            //     "remarks": remarksController.text.trim(),
            //     "period": int.tryParse(periodController.text.trim()) ?? 0,
            //     "quantity":
            //         int.tryParse(quantityController.text.trim()) ?? 0,
            //   };
            //
            //   print(data); // Submit this to your API
            // }
          },
          child: Container(
            width: 180.w,
            height: 45.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(
                  color: Colorutils.userdetailcolor, width: 0.8),
            ),
            child: Center(
              child: Text(
                'SUBMIT',
                style: GoogleFonts.inter(fontSize: 16.h),
              ),
            ),
          ),
        ),
      ),
    );
  }
}