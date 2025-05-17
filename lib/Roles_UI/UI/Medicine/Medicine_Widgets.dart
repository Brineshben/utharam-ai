import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:patient/Controller/Medicine_Controller/AddMedicineController.dart';
import 'package:patient/Controller/Medicine_Controller/Brand_Controller.dart';
import 'package:patient/Controller/Medicine_Controller/FrequencyController.dart';
import 'package:patient/Controller/Medicine_Controller/Medicine_Controller.dart';
import 'package:patient/Model/Medicine_model/AddMedicineModel.dart';
import 'package:patient/Model/Medicine_model/BrandModel.dart';

import '../../../Model/Medicine_model/Frequency_Model.dart';
import '../../../Model/Medicine_model/Medicine_List_Model.dart';
import '../../../utils/color_util.dart';

Widget buildDropdownSearchField({
  required String hintText,
  required List<String> items,
  // required TextEditingController controller,
  required bool validation,
  required int index,
  required String type,
}) {
  String? getSelectedItem() {
    switch (type) {
      case 'medicine':
        return Get.find<AddMedicineController>()
                .addMedicineData
                .value
                .isNotEmpty
            ? Get.find<AddMedicineController>()
                .addMedicineData
                .value[index]
                .medicine
                ?.name
            : null;
      case 'brand':
        return Get.find<AddMedicineController>()
                .addMedicineData
                .value
                .isNotEmpty
            ? Get.find<AddMedicineController>()
                .addMedicineData
                .value[index]
                .brand
                ?.name
            : null;
      case 'frequency':
        return Get.find<AddMedicineController>()
                .addMedicineData
                .value
                .isNotEmpty
            ? Get.find<AddMedicineController>()
                .addMedicineData
                .value[index]
                .frequency
                ?.name
            : null;
      default:
        return null;
    }
  }

  return Padding(
    padding: const EdgeInsets.all(4),
    child: SizedBox(
      height: 45.h, // Reduced from 50 to 40
      width: double.infinity,
      child: DropdownSearch<String>(
        items: items,
        selectedItem: getSelectedItem(),
        onChanged: (value) {
          if (type == 'medicine') {
            List<MedicineData?> medicine = Get.find<MedicineController>()
                .medicineList
                .value
                .where((element) => element?.name == value)
                .toList();
            if (medicine.isNotEmpty) {
              Get.find<AddMedicineController>()
                  .addMedicineData
                  .value[index]
                  .medicine = medicine.first;
              Get.find<AddMedicineController>().addMedicineData.refresh();
            }
          }
          if (type == 'brand') {
            List<BrandData?> brand = Get.find<BrandController>()
                .brandList
                .value
                .where((element) => element?.name == value)
                .toList();
            if (brand.isNotEmpty) {
              Get.find<AddMedicineController>()
                  .addMedicineData
                  .value[index]
                  .brand = brand.first;
              Get.find<AddMedicineController>().addMedicineData.refresh();
            }
          }
          if (type == 'frequency') {
            List<FrequencyData?> frequency = Get.find<FrequencyController>()
                .frequencyList
                .value
                .where((element) => element?.name == value)
                .toList();
            if (frequency.isNotEmpty) {
              Get.find<AddMedicineController>()
                  .addMedicineData
                  .value[index]
                  .frequency = frequency.first;
              Get.find<AddMedicineController>().addMedicineData.refresh();
            }
          }
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            hintText: hintText,
            labelText: hintText,
            labelStyle: TextStyle(
              fontSize: 13, // Slightly smaller font
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
            contentPadding:
                const EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
            // Reduced padding
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              // Slightly smaller border radius
              borderSide:
                  BorderSide(color: Colorutils.userdetailcolor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colorutils.userdetailcolor),
            ),
          ),
        ),
        popupProps: PopupProps.menu(
          showSearchBox: true,
          itemBuilder: (context, item, isSelected) => ListTile(
            title: Text(item),
          ),
          constraints: BoxConstraints(
            maxHeight: 250,
          ),
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.grey),
              hintText: "Search $hintText",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 20, // Smaller icon
                  width: 20,
                  child: SvgPicture.asset(
                    "assets/images/MagnifyingGlass.svg",
                    color: Colorutils.userdetailcolor,
                  ),
                ),
              ),
              contentPadding:
                  const EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
              // Reduced padding
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colorutils.userdetailcolor),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colorutils.userdetailcolor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
        validator: validation
            ? (val) => val == null || val.trim().isEmpty
                ? 'Please select $hintText'
                : null
            : null,
      ),
    ),
  );
}

Widget buildTextFieldMedicine(String hintText, String svgAssetPath,
    bool isPassword, int index, bool validation, TextEditingController controller) {
  // String? getControllerText() {
  //   switch(hintText) {
  //     case 'Strength': return Get.find<AddMedicineController>().addMedicineData.value[index].strength;
  //     case 'Dosage': return Get.find<AddMedicineController>().addMedicineData.value[index].dosage;
  //     case 'UOM': return Get.find<AddMedicineController>().addMedicineData.value[index].uom;
  //     case 'Route': return Get.find<AddMedicineController>().addMedicineData.value[index].route;
  //     // case 'Period': return Get.find<AddMedicineController>().addMedicineData.value[index].period;
  //     // case 'Quantity': return Get.find<AddMedicineController>().addMedicineData.value[index].quantity;
  //     case 'Remarks': return Get.find<AddMedicineController>().addMedicineData.value[index].remarks;
  //     default: return null;
  //   }
  // }
  // controller.text = getControllerText() ?? '';
  return Padding(
    padding: const EdgeInsets.all(4),
    child: SizedBox(
      height: 45.h,
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        validator: validation
            ? (val) => val!.trim().isEmpty ? 'Please enter $hintText' : null
            : null,
        obscureText: isPassword,
        onChanged: (value) {
          // print("----------strength--------------${Get.find<AddMedicineController>().addMedicineData.value[index].strength}");
          // Get.find<AddMedicineController>().addMedicineData.refresh();
          if (hintText == "Strength") {
            Get.find<AddMedicineController>()
                .addMedicineData
                .value[index]
                .strength = value;
            Get.find<AddMedicineController>().addMedicineData.refresh();
          }
          if (hintText == "Dosage") {
            Get.find<AddMedicineController>()
                .addMedicineData
                .value[index]
                .dosage = value;
            Get.find<AddMedicineController>().addMedicineData.refresh();
          }
          if (hintText == "UOM") {
            Get.find<AddMedicineController>().addMedicineData.value[index].uom =
                value;
            Get.find<AddMedicineController>().addMedicineData.refresh();
          }
          if (hintText == "Route") {
            Get.find<AddMedicineController>()
                .addMedicineData
                .value[index]
                .route = value;
            Get.find<AddMedicineController>().addMedicineData.refresh();
          }
          if (hintText == "Period") {
            Get.find<AddMedicineController>()
                .addMedicineData
                .value[index]
                .period = value;
            Get.find<AddMedicineController>().addMedicineData.refresh();
          }
          if (hintText == "Quantity") {
            Get.find<AddMedicineController>()
                .addMedicineData
                .value[index]
                .quantity = value;
            Get.find<AddMedicineController>().addMedicineData.refresh();
          }
          if (hintText == "Remarks") {
            Get.find<AddMedicineController>()
                .addMedicineData
                .value[index]
                .remarks = value;
            Get.find<AddMedicineController>().addMedicineData.refresh();
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
          labelText: hintText,
          labelStyle: TextStyle(
            fontSize: 15.h,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colorutils.userdetailcolor),
          ),
        ),
      ),
    ),
  );
}

Widget buildTextFieldMedicineNumber(String hintText, String svgAssetPath,
    bool isPassword, int index, bool validation, TextEditingController controller) {
  // String? getControllerText() {
  //   switch(hintText) {
  //     // case 'Strength': return Get.find<AddMedicineController>().addMedicineData.value[index].strength;
  //     // case 'Dosage': return Get.find<AddMedicineController>().addMedicineData.value[index].dosage;
  //     // case 'UOM': return Get.find<AddMedicineController>().addMedicineData.value[index].uom;
  //     // case 'Route': return Get.find<AddMedicineController>().addMedicineData.value[index].route;
  //   case 'Period': return Get.find<AddMedicineController>().addMedicineData.value[index].period;
  //   case 'Quantity': return Get.find<AddMedicineController>().addMedicineData.value[index].quantity;
  //     // case 'Remarks': return Get.find<AddMedicineController>().addMedicineData.value[index].remarks;
  //     default: return null;
  //   }
  // }
  // controller.text = getControllerText() ?? '';
  return Padding(
    padding: const EdgeInsets.all(4),
    child: SizedBox(
      height: 45.h,
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        validator: validation
            ? (val) => val!.trim().isEmpty ? 'Please enter $hintText' : null
            : null,
        // controller: controller,
        obscureText: isPassword,
        onChanged: (value) {
          // if (hintText == "Strength") {
          //   Get.find<AddMedicineController>()
          //       .addMedicineData
          //       .value[index]
          //       .strength = value;
          //   Get.find<AddMedicineController>().addMedicineData.refresh();
          // }
          // if (hintText == "Dosage") {
          //   Get.find<AddMedicineController>()
          //       .addMedicineData
          //       .value[index]
          //       .dosage = value;
          //   Get.find<AddMedicineController>().addMedicineData.refresh();
          // }
          // if (hintText == "UOM") {
          //   Get.find<AddMedicineController>().addMedicineData.value[index].uom =
          //       value;
          //   Get.find<AddMedicineController>().addMedicineData.refresh();
          // }
          // if (hintText == "Route") {
          //   Get.find<AddMedicineController>()
          //       .addMedicineData
          //       .value[index]
          //       .route = value;
          //   Get.find<AddMedicineController>().addMedicineData.refresh();
          // }
          if (hintText == "Period") {
            Get.find<AddMedicineController>()
                .addMedicineData
                .value[index]
                .period = value;
            Get.find<AddMedicineController>().addMedicineData.refresh();
          }
          if (hintText == "Quantity") {
            Get.find<AddMedicineController>()
                .addMedicineData
                .value[index]
                .quantity = value;
            Get.find<AddMedicineController>().addMedicineData.refresh();
          }
          // if (hintText == "Remarks") {
          //   Get.find<AddMedicineController>()
          //       .addMedicineData
          //       .value[index]
          //       .remarks = value;
          //   Get.find<AddMedicineController>().addMedicineData.refresh();
          // }
        },
        decoration: InputDecoration(
          hintText: hintText,
          labelText: hintText,
          labelStyle: TextStyle(
            fontSize: 15.h,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colorutils.userdetailcolor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colorutils.userdetailcolor),
          ),
        ),
      ),
    ),
  );
}

