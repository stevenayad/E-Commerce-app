import 'package:flutter/material.dart';
import 'package:flutter_application_1/myaccontfeature/Model/addressmodel.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/showdeleteconformation.dart';
import 'package:flutter_application_1/myaccontfeature/presentation/widget/widgeteditasressbottomshet.dart';
import 'package:flutter_application_1/utilis/appstyle.dart';

Widget buildAdress(
  BuildContext context,
  int index,
  AddressRepository AddressRepository,
) {
  final laddress = AddressRepository.getAddresses();
  final address = laddress[index];
  return Addresscard(
    address: address,
    ondelte: () {
      Showdailogdelteadrress.showdeleteconformationadress(context);
    },
    onuodate: () {
      showbottomshett(
        context,
        address: address,
        text: 'Edit Address',
        textbutton: 'Update Address',
      );
    },
  );
}

class Addresscard extends StatelessWidget {
  const Addresscard({
    super.key,
    required this.address,
    required this.ondelte,
    required this.onuodate,
  });
  final Address address;
  final VoidCallback ondelte;
  final VoidCallback onuodate;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.location_on,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            address.label,
                            style: AppTextStyle.withColor(
                              AppTextStyle.h3,
                              Theme.of(context).textTheme.bodyLarge!.color!,
                            ),
                          ),
                          if (address.isDefault) ...[
                            SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(
                                  context,
                                ).primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Default',
                                style: AppTextStyle.withColor(
                                  AppTextStyle.bodySmall,
                                  Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        '${address.fullAddress}\n ${address.city} ${address.state} ${address.zipCode} ',
                        style: AppTextStyle.withColor(
                          AppTextStyle.bodyMedium,
                          isDark ? Colors.grey[400]! : Colors.grey[600]!,
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: onuodate,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit_outlined,
                                    color: Theme.of(context).primaryColor,
                                    size: 20,
                                  ),
                                  Text(
                                    'Edit',
                                    style: AppTextStyle.withColor(
                                      AppTextStyle.buttonMedium,
                                      Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: ondelte,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete_outline,
                                    color: Theme.of(context).primaryColor,
                                    size: 20,
                                  ),
                                  Text(
                                    'Delete ',
                                    style: AppTextStyle.withColor(
                                      AppTextStyle.buttonMedium,
                                      Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
