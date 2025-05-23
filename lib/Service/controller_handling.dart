import 'package:get/get.dart';
import 'package:patient/Controller/Medicine_Controller/AddMedicineController.dart';

import '../Controller/AddTalktoHumanController.dart';
import '../Controller/AssignedDoctorPatients_Controller.dart';
import '../Controller/Assignement_Controller/PatientAssesMentLIst_Controller.dart';
import '../Controller/Call_HumanController.dart';
import '../Controller/Consult_Doctor_Controller.dart';
import '../Controller/DoctorToPatientController.dart';
import '../Controller/Doctor_List_Controller.dart';
import '../Controller/EnquiredListController.dart';
import '../Controller/GenerateReport_Controller.dart';
import '../Controller/JuniorDashoard_Controller.dart';
import '../Controller/Login_Controller.dart';
import '../Controller/Medicine_Controller/Brand_Controller.dart';
import '../Controller/Medicine_Controller/FrequencyController.dart';
import '../Controller/Medicine_Controller/Medicine_Controller.dart';
import '../Controller/Medicine_Controller/Particular_medicineList_Controller.dart';
import '../Controller/MultipleReportController.dart';
import '../Controller/PatientAppointmentDetailsController.dart';
import '../Controller/Patient_queue_Controller.dart';
import '../Controller/Quotes_Controller.dart';
import '../Controller/ReportPatientController.dart';
import '../Controller/SeniorDashboardController.dart';
import '../Controller/SheduleController.dart';
import '../Controller/Slot_Controller.dart';
import '../Controller/Slottopateient_Controller.dart';
import '../Controller/patientDetails_Controller.dart';

class HandleControllers {
  static createGetControllers() {
    Get.put(UserAuthController());
    Get.put(PatientQueueController());
    Get.put(DoctorListController());
    Get.put(ConsultDoctorListController());
    Get.put(DoctorToPatientController());
    Get.put(SlotController());
    Get.put(SlottopateientController());
    Get.put(AssignedDoctorToPatientController());
    Get.put(ScheduleController());
    Get.put(QuotesController());
    Get.put(JuniorDashboardController());
    Get.put(MedicineController());
    Get.put(BrandController());
    Get.put(FrequencyController());
    Get.put(AddMedicineController());
    Get.put(ParticularMedicinelistController());
    Get.put(PatientAssignmentController());
    Get.put(EnquiredListController());
    Get.put(CallHumanController());
    Get.put(GenerateReportController());
    Get.put(PatientdetailsController());
    Get.put(SeniorDashboardController());
    Get.put(ReportPatientController());
    Get.put(MultipleReportsController());
    Get.put(Patientappointmentdetailscontroller());
    Get.put(AddTalkToHumanController());
  }

  static deleteAllGetControllers() async {
    await Get.delete<UserAuthController>();
    await Get.delete<PatientQueueController>();
    await Get.delete<DoctorListController>();
    await Get.delete<ConsultDoctorListController>();
    await Get.delete<DoctorToPatientController>();
    await Get.delete<SlotController>();
    await Get.delete<SlottopateientController>();
    await Get.delete<AssignedDoctorToPatientController>();
    await Get.delete<ScheduleController>();
    await Get.delete<QuotesController>();
    await Get.delete<JuniorDashboardController>();
    await Get.delete<MedicineController>();
    await Get.delete<BrandController>();
    await Get.delete<FrequencyController>();
    await Get.delete<AddMedicineController>();
    await Get.delete<ParticularMedicinelistController>();
    await Get.delete<PatientAssignmentController>();
    await Get.delete<EnquiredListController>();
    await Get.delete<CallHumanController>();
    await Get.delete<GenerateReportController>();
    await Get.delete<PatientdetailsController>();
    await Get.delete<SeniorDashboardController>();
    await Get.delete<ReportPatientController>();
    await Get.delete<MultipleReportsController>();
    await Get.delete<Patientappointmentdetailscontroller>();
    await Get.delete<AddTalkToHumanController>();
  }
}
