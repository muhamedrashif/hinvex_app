import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/features/sell/presentation/view/upload_property_details/screens/user_profile_screen.dart';
import 'package:hinvex_app/features/splash/presentation/view/widgets/custom_button_widget.dart';
import 'package:hinvex_app/general/utils/Customwidgets/CustomNetworkImageWidget.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/progress_indicator_widget/progress_indicator_widget.dart';
import 'package:hinvex_app/general/utils/textformfeild_widget/textFormField_widget.dart';
import 'package:hinvex_app/general/utils/toast/toast.dart';
import 'package:provider/provider.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        iconTheme: IconThemeData(color: AppColors.titleTextColor),
        title: Text(
          "Set A Price",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.titleTextColor,
          ),
        ),
      ),
      body: Consumer<SellProvider>(builder: (context, state, _) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (state.imageFile.length > 7) {
                                        showToast(
                                          "Maximum Allowed Images 7",
                                        );
                                        return;
                                      }

                                      showProgress(context);

                                      state.getImage(onSuccess: () {
                                        Navigator.pop(context);
                                      }, onFailure: () {
                                        showToast(
                                          "Maximum Allowed Images 7",
                                        );
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: const SizedBox(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.image,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                            "Edit",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  // decoration: BoxDecoration(
                                  //   color: AppColors.backgroundColor,
                                  //   borderRadius: BorderRadius.circular(6),
                                  //   boxShadow: [
                                  //     BoxShadow(
                                  //       color: Colors.black.withOpacity(0.2),
                                  //       blurRadius: 3,
                                  //       spreadRadius: 0,
                                  //       offset: const Offset(0, 0),
                                  //     ),
                                  //   ],
                                  // ),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.imageFile.length,
                                    itemBuilder: (context, index) {
                                      return Center(
                                        child: Stack(
                                          children: [
                                            CustomNetworkImageWidget(
                                              imageUrl: state.imageFile[index]
                                                  .toString(),
                                              width: 300,
                                              height: 200,
                                            ),
                                            Positioned(
                                                top: 10,
                                                right: 10,
                                                child: InkWell(
                                                  onTap: () {
                                                    state.removeImageAtIndex(
                                                        index);
                                                  },
                                                  child: const Icon(
                                                    Icons.cancel,
                                                    size: 20,
                                                  ),
                                                )),
                                            Positioned(
                                              bottom: 10,
                                              left: 10,
                                              child: Text(
                                                "${index + 1}/${state.imageFile.length}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const Text(
                                "Define Your Price*",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: CustomTextFormFieldWidget(
                                  hintText: "Enter Here",
                                  controller: state.priceController,
                                  keyboardType: TextInputType.number,
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Please Enter Here';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomButtonWidget(
                  height: 44,
                  width: MediaQuery.of(context).size.width,
                  buttonColor: AppColors.textButtonColor,
                  text: "Next",
                  textColor: AppColors.buttonTextColor,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserProfileScreen(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
