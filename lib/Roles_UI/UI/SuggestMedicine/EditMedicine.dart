import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class Editmedicine extends StatefulWidget {


  const Editmedicine(
      {super.key});

  @override
  _EditmedicineState createState() => _EditmedicineState();
}

class _EditmedicineState extends State<Editmedicine> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade50,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Text
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Text(
                "ENQUIRED PATIENT LIST",
                style: GoogleFonts.shanti(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.h,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Card(
                margin: EdgeInsets.all(10),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade50,
                        Colors.white,
                        Colors.blue.shade50,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: DropdownSearch<String>(
                              items: ["Option 1", "Option 2", "Option 3"],
                              selectedItem: "Option 1",
                              onChanged: (value) {},
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  hintText: "Select Option",
                                  labelText: "Select Option",
                                  labelStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.teal, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.teal),
                                  ),
                                ),
                              ),
                              popupProps: PopupProps.menu(
                                showSearchBox: true,
                                itemBuilder: (context, item, isSelected) => ListTile(
                                  title: Text(item),
                                ),
                                constraints: BoxConstraints(maxHeight: 250),
                                searchFieldProps: TextFieldProps(
                                  decoration: InputDecoration(
                                    hintText: "Search Option",
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(Icons.search, color: Colors.teal),
                                    ),
                                    contentPadding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.teal),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.teal, width: 1.0),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                ),
                              ),
                              validator: (val) =>
                              val == null || val.trim().isEmpty ? 'Please select an option' : null,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: DropdownSearch<String>(
                              items: ["Option 1", "Option 2", "Option 3"],
                              selectedItem: "Option 1",
                              onChanged: (value) {},
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  hintText: "Select Option",
                                  labelText: "Select Option",
                                  labelStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.teal, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.teal),
                                  ),
                                ),
                              ),
                              popupProps: PopupProps.menu(
                                showSearchBox: true,
                                itemBuilder: (context, item, isSelected) => ListTile(
                                  title: Text(item),
                                ),
                                constraints: BoxConstraints(maxHeight: 250),
                                searchFieldProps: TextFieldProps(
                                  decoration: InputDecoration(
                                    hintText: "Search Option",
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(Icons.search, color: Colors.teal),
                                    ),
                                    contentPadding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.teal),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.teal, width: 1.0),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                ),
                              ),
                              validator: (val) =>
                              val == null || val.trim().isEmpty ? 'Please select an option' : null,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: DropdownSearch<String>(
                              items: ["Option 1", "Option 2", "Option 3"],
                              selectedItem: "Option 1",
                              onChanged: (value) {},
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  hintText: "Select Option",
                                  labelText: "Select Option",
                                  labelStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.teal, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Colors.teal),
                                  ),
                                ),
                              ),
                              popupProps: PopupProps.menu(
                                showSearchBox: true,
                                itemBuilder: (context, item, isSelected) => ListTile(
                                  title: Text(item),
                                ),
                                constraints: BoxConstraints(maxHeight: 250),
                                searchFieldProps: TextFieldProps(
                                  decoration: InputDecoration(
                                    hintText: "Search Option",
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(Icons.search, color: Colors.teal),
                                    ),
                                    contentPadding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.teal),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.teal, width: 1.0),
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                ),
                              ),
                              validator: (val) =>
                              val == null || val.trim().isEmpty ? 'Please select an option' : null,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),












      ),
    );
  }}