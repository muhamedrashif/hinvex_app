import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hinvex_app/features/location/presentation/provider/location_provider.dart';
import 'package:hinvex_app/general/utils/app_assets/image_constants.dart';
import 'package:hinvex_app/general/utils/app_theme/colors.dart';
import 'package:hinvex_app/general/utils/progress_indicator_widget/progress_indicator_widget.dart';
import 'package:provider/provider.dart';

class SearchLocationWidget extends StatefulWidget {
  const SearchLocationWidget({super.key});

  @override
  State<SearchLocationWidget> createState() => _SearchLocationWidgetState();
}

class _SearchLocationWidgetState extends State<SearchLocationWidget> {
  final TextEditingController _searchLocationController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Consumer<LocationProvider>(builder: (context, state, _) {
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
                            controller: _searchLocationController,
                            onChanged: (query) {
                              if (query.isNotEmpty) {
                                state.getLocations(query.toLowerCase());
                              } else {
                                state.clearSuggestions();
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: "Search City, Area or Neighborhood",
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

                            _searchLocationController.clear();
                            state.clearSuggestions();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SearchLocationWidget(),
                                ));
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
                            "Use Currant Location",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue),
                          ),
                          Text(
                            "Kunnamangalam, karanthur, 453345",
                            style: TextStyle(fontSize: 10, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Recently Used Locations",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                        child: Text("Kunnamangalam"),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Popular Places",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text("Eranamkulam"),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ]);
        }));
  }
}
