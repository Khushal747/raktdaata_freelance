import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raktdata_app/View_model/admin_view_model.dart';
import 'package:raktdata_app/core/app_colors.dart';
import 'package:raktdata_app/core/app_export.dart';
import 'package:raktdata_app/presentation/widgets/custom_drawer.dart';
import 'package:raktdata_app/widgets/size_ext.dart';
import 'package:raktdata_app/widgets/translate_extension.dart';
import '../../theme/text_theme_helper.dart';
import '../widgets/displayCard.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final double horizontalPadding = 20.Sw;
  final double verticalPadding = 25.Sh;
  late NeedViewModel _needViewModel;

  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        print("Fetching data...");
        await _needViewModel.fetchData();
        print("Data fetched successfully!");
        print("Fetched data:");
        print(_needViewModel.requirementDetails);
      } catch (error) {
        print("888888888888888");
        print("Not successfull");
        // Handle error here (e.g., show a snackbar or log the error)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
      _needViewModel = context.watch<NeedViewModel>();
    print("000000000000000:");
    print(_needViewModel.requirementDetails);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.Red700,
      ),
      drawer: CustomDrawer(),
      // Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: getPadding(left: 10,right: 10,top:15,bottom: 0.0),
              // EdgeInsets.symmetric(horizontal: 10.Sw,vertical: 15.Sh),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Admin,".trTrans,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextThemeHelper.titleBoldBlackContainer_3,
                    // style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),

                ],
              ),
            ),

            // SizedBox(height: 25.Sh),

            Padding(
              padding: getPadding(left: 10.Sh,right: 10.Sh,top: 0.Sh),
              // EdgeInsets.symmetric(horizontal: 40.0.Sw,vertical: 25.Sh),
              child: const Divider(
                thickness: 1,
                color: Color.fromARGB(255, 204, 204, 204),
              ),
            ),

            // SizedBox(height: 25.Sh),

            // smart devices grid
            // Padding(
            //   padding: getPadding(
            //       left: 10.Sw,
            //       right: 10.Sw,
            //       bottom: 10.Sh),
            //   // EdgeInsets.symmetric(horizontal: horizontalPadding,vertical: 10.Sh),
            //   child: Column(
            //     children: [
            //       Text(
            //         "Requirement".trTrans,
            //         overflow: TextOverflow.ellipsis,
            //         textAlign: TextAlign.left,
            //         style: TextThemeHelper.titleBoldBlackContainer_3,
            //       ),
            //     ],
            //   ),
            // ),

            Expanded(
              child: ListView.builder(
                itemCount: _needViewModel.requirementDetails.length,
                padding: EdgeInsets.symmetric(horizontal: 10.Sw, vertical: 2.Sh),
                itemBuilder: (context, index) {
                  return DisplayCardWidget(
                    patientName: _needViewModel.requirementDetails[index].patientName,
                    disease: _needViewModel.requirementDetails[index].disease,
                    hospitalName: _needViewModel.requirementDetails[index].hospitalName,
                    mobileNumber: _needViewModel.requirementDetails[index].mobileNumber,
                    city: _needViewModel.requirementDetails[index].city,
                    bloodGroup: _needViewModel.requirementDetails[index].bloodGroup,
                    date: _needViewModel.requirementDetails[index].date,
                    // Assuming date is a DateTime object
                    bloodUnits: _needViewModel.requirementDetails[index].bloodUnits,
                    attendersName: _needViewModel.requirementDetails[index].attendersName,
                    prescriptionUrl: _needViewModel.requirementDetails[index].prescriptionUrl,
                    docId: _needViewModel.requirementDetails[index].docId,
                  );
                },
              )

            ),
          ],
        ),
      ),
    );
  }


}
