import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hinvex_app/features/sell/presentation/provider/sell_provider.dart';
import 'package:hinvex_app/general/utils/image_constants.dart';
import 'package:hinvex_app/general/utils/colors.dart';
import 'package:hinvex_app/general/utils/progress_indicator_widget/progress_indicator_widget.dart';
import 'package:provider/provider.dart';

class LocationSearchWidget extends StatefulWidget {
  const LocationSearchWidget({super.key});

  @override
  State<LocationSearchWidget> createState() => _LocationSearchWidgetState();
}

class _LocationSearchWidgetState extends State<LocationSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.titleTextColor),
          title: Text(
            "Choose Location",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.titleTextColor),
          ),
        ),
        body: Consumer<SellProvider>(builder: (context, state, _) {
          return CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Choose City",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 44,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            scrollPadding: const EdgeInsets.all(8),
                            style: const TextStyle(fontSize: 14),
                            autofocus: true,
                            controller: state.locationController,
                            onChanged: (query) {
                              if (query.isNotEmpty) {
                                state.getLocations(query.toLowerCase());
                              } else {
                                state.clearSuggestions();
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: "Enter The Selling Location",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.blue,
                                size: 35,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList.builder(
              itemBuilder: (context, index) {
                final suggestion = state.suggestions[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: ListTile(
                      title: Text(
                        "${suggestion.formattedAddress}",
                        style: TextStyle(
                            fontSize: 13, color: AppColors.titleTextColor),
                      ),
                      trailing: Icon(
                        Icons.north_west_outlined,
                        color: AppColors.textButtonColor,
                        size: 20,
                      ),
                      onTap: () {
                        showProgress(context);

                        state.searchLocationByAddress(
                          latitude:
                              suggestion.geometry!.location!.lat.toString(),
                          longitude:
                              suggestion.geometry!.location!.lng.toString(),
                          onSuccess: (placecell) {
                            log("SUCCESS");
                            log("placeCell$placecell");

                            state.locationController.text =
                                "${placecell.localArea},${placecell.district},${placecell.state},${placecell.pincode}";
                            state.placeCellUploadLocation = placecell;
                            state.clearSuggestions();
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          onFailure: () {
                            log("FAILED");
                            state.clearSuggestions();
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                );
              },
              itemCount: state.suggestions.length,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    showProgress(context);
                    state.getUserCurrentPosition(onSuccess: (placecell) {
                      log("Get current location Success");
                      log("SUCCESS");
                      log("placeCell$placecell");

                      state.locationController.text =
                          "${placecell.localArea},${placecell.district},${placecell.state},${placecell.pincode}";
                      state.placeCellUploadLocation = placecell;
                      state.clearSuggestions();

                      Navigator.pop(context);
                      Navigator.pop(context);
                    }, onFailure: () {
                      log("Get current location Failed");
                      Navigator.pop(context);
                    });
                  },
                  child: Row(
                    children: [
                      SizedBox(
                          height: 28,
                          width: 28,
                          child: Image.asset(
                            ImageConstant.locationIcon,
                          )),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Use Current Location",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue),
                            ),
                            // Text(
                            //   "Kunnamangalam, karanthur, 453345",
                            //   style:
                            //       TextStyle(fontSize: 10, color: Colors.blue),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]);
        }));
  }
}
