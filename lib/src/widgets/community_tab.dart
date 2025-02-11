import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchat_frontend/src/common.dart';
import 'package:tchat_frontend/src/providers/community_providers.dart';
import 'package:tchat_frontend/src/widgets/app_bar_dashboard.dart';
import 'package:tchat_frontend/src/widgets/custom_text.dart';

class CommunityTab extends StatefulWidget {
  const CommunityTab({super.key});
  @override
  State<CommunityTab> createState() => _CommunityTab();
}

class _CommunityTab extends State<CommunityTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          const CustomAppBar(searchHint: "Search community, groups"),
          Expanded(
            child: ListView.separated(
              itemCount: communities.length,
              separatorBuilder: (context, index) => const Divider(height: 0.5),
              itemBuilder: (context, index) {
                final community = communities[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      child: Row(
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 226, 226, 226),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: community.profileImage == null || community.profileImage!.isEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SvgPicture.asset(
                                      "assets/svgs/user_group_2.svg",
                                      width: 25,
                                      height: 25,
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: "assets/svgs/user_group_2.svg",
                                      image: community.profileImage!,
                                      fit: BoxFit.cover,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CustomText(
                              weight: FontWeight.w500,
                              text: community.name,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      itemCount: community.groups.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, groupIndex) {
                        final group = community.groups[groupIndex];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: const Color.fromARGB(255, 226, 226, 226),
                            child: group.groupImage == null || group.groupImage!.isEmpty ?
                            SvgPicture.asset("assets/svgs/user_group.svg", width: 25, height: 25,) :
                            ClipOval(
                              child:  FadeInImage.assetNetwork(placeholder: "assets/svgs/user_group.svg", image: group.groupImage!,
                              fit: BoxFit.cover, width: 50, height: 50,),
                            )
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: group.groupName,
                                weight: FontWeight.w500,
                              ),
                              CustomText(text: group.lastMessageTimestamp.toString(), size: 10,)
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Expanded(
                                child: CustomText(
                                  text: group.lastMessage,
                                  size: 14,
                                  color: const Color.fromARGB(255, 63, 63, 63),
                                  maxlines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.18,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (group.isPin ?? false)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: SvgPicture.asset(
                                          "assets/svgs/pin_filled.svg",
                                          height: 15,
                                          width: 15,
                                        ),
                                      ),
                                    if (group.isMute ?? false)
                                      const Padding(
                                        padding: EdgeInsets.only(left: 4.0),
                                        child: Icon(Icons.notifications_off, size: 15, color: grey),
                                      ),
                                    if (group.unreadCount > 0)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4.0),
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).colorScheme.primary,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: Alignment.center,
                                          child: FittedBox(
                                            child: CustomText(
                                              text: group.unreadCount > 99 ? "99+" : group.unreadCount.toString(),
                                              size: 8,
                                              color: white,
                                              align: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
