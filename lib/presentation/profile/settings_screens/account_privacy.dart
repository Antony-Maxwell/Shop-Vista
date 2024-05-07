import 'package:flutter/material.dart';
import 'package:shop_vista/presentation/widgets/appbar_widgets/appbar.dart';
import 'package:url_launcher/link.dart';

class AccountPrivacyScreen extends StatelessWidget {
  const AccountPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Privcy Policy',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('''
𝘀𝗵𝗼𝗽𝗩𝗶𝘀𝘁𝗮
              
This privacy policy applies to the ShopVista app (hereby referred to as "Application") for mobile devices that was created by (hereby referred to as "Service Provider") as a Free service. This service is intended for use "AS IS".
              
              
𝗜𝗻𝗳𝗼𝗿𝗺𝗮𝘁𝗶𝗼𝗻 𝗖𝗼𝗹𝗹𝗲𝗰𝘁𝗶𝗼𝗻 𝗮𝗻𝗱 𝗨𝘀𝗲
              
The Application collects information when you download and use it. This information may include information such as
              
* 𝗬𝗼𝘂𝗿 𝗱𝗲𝘃𝗶𝗰𝗲'𝘀 𝗜𝗻𝘁𝗲𝗿𝗻𝗲𝘁 𝗣𝗿𝗼𝘁𝗼𝗰𝗼𝗹 𝗮𝗱𝗱𝗿𝗲𝘀𝘀 (𝗲.𝗴. 𝗜𝗣 𝗮𝗱𝗱𝗿𝗲𝘀𝘀)         
* 𝗧𝗵𝗲 𝗽𝗮𝗴𝗲𝘀 𝗼𝗳 𝘁𝗵𝗲 𝗔𝗽𝗽𝗹𝗶𝗰𝗮𝘁𝗶𝗼𝗻 𝘁𝗵𝗮𝘁 𝘆𝗼𝘂 𝘃𝗶𝘀𝗶𝘁,
* 𝗧𝗵𝗲 𝘁𝗶𝗺𝗲 𝗮𝗻𝗱 𝗱𝗮𝘁𝗲 𝗼𝗳 𝘆𝗼𝘂𝗿 𝘃𝗶𝘀𝗶𝘁
* 𝗧𝗵𝗲 𝘁𝗶𝗺𝗲 𝘀𝗽𝗲𝗻𝘁 𝗼𝗻 𝘁𝗵𝗼𝘀𝗲 𝗽𝗮𝗴𝗲𝘀              
* 𝗧𝗵𝗲 𝘁𝗶𝗺𝗲 𝘀𝗽𝗲𝗻𝘁 𝗼𝗻 𝘁𝗵𝗲 𝗔𝗽𝗽𝗹𝗶𝗰𝗮𝘁𝗶𝗼𝗻             
* 𝗧𝗵𝗲 𝗼𝗽𝗲𝗿𝗮𝘁𝗶𝗻𝗴 𝘀𝘆𝘀𝘁𝗲𝗺 𝘆𝗼𝘂 𝘂𝘀𝗲 𝗼𝗻 𝘆𝗼𝘂𝗿 𝗺𝗼𝗯𝗶𝗹𝗲 𝗱𝗲𝘃𝗶𝗰𝗲
                     
The Application does not gather precise information about the location of your mobile device.
               
The Service Provider may use the information you provided to contact you from time to time to provide you with important information, required notices and marketing promotions.
                     
For a better experience, while using the Application, the Service Provider may require you to provide us with certain personally identifiable information, including but not limited to Email, Phone number, name, username, Google email, Google account, Facebook Account, Profile picture, Address, Personal Preferences. The information that the Service Provider request will be retained by them and used as described in this privacy policy.
                     
𝗧𝗵𝗶𝗿𝗱 𝗣𝗮𝗿𝘁𝘆 𝗔𝗰𝗰𝗲𝘀𝘀
              
Only aggregated, anonymized data is periodically transmitted to external services to aid the Service Provider in improving the Application and their service. The Service Provider may share your information with third parties in the ways that are described in this privacy statement.
                           
Please note that the Application utilizes third-party services that have their own Privacy Policy about handling data. Below are the links to the Privacy Policy of the third-party service providers used by the Application:
              
* 𝗚𝗼𝗼𝗴𝗹𝗲 𝗣𝗹𝗮𝘆 𝗦𝗲𝗿𝘃𝗶𝗰𝗲𝘀              
* 𝗙𝗮𝗰𝗲𝗯𝗼𝗼𝗸
                       
The Service Provider may disclose User Provided and Automatically Collected Information:
              
as required by law, such as to comply with a subpoena, or similar legal process;
              
when they believe in good faith that disclosure is necessary to protect their rights, protect your safety or the safety of others, investigate fraud, or respond to a government request;
              
with their trusted services providers who work on their behalf, do not have an independent use of the information we disclose to them, and have agreed to adhere to the rules set forth in this privacy statement.
                            
𝗢𝗽𝘁-𝗢𝘂𝘁 𝗥𝗶𝗴𝗵𝘁𝘀

You can stop all collection of information by the Application easily by uninstalling it. You may use the standard uninstall processes as may be available as part of your mobile device or via the mobile application marketplace or network.
              
𝗗𝗮𝘁𝗮 𝗥𝗲𝘁𝗲𝗻𝘁𝗶𝗼𝗻 𝗣𝗼𝗹𝗶𝗰𝘆
              
The Service Provider will retain User Provided data for as long as you use the Application and for a reasonable time thereafter. If you'd like them to delete User Provided Data that you have provided via the Application, please contact them at antonymaxwell619@gmail.com and they will respond in a reasonable time.
                        
𝗖𝗵𝗶𝗹𝗱𝗿𝗲𝗻
              
The Service Provider does not use the Application to knowingly solicit data from or market to children under the age of 13.
                       
The Application does not address anyone under the age of 13. The Service Provider does not knowingly collect personally identifiable information from children under 13 years of age. In the case the Service Provider discover that a child under 13 has provided personal information, the Service Provider will immediately delete this from their servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact the Service Provider (antonymaxwell619@gmail.com) so that they will be able to take the necessary actions.
                        
𝗦𝗲𝗰𝘂𝗿𝗶𝘁𝘆
              
The Service Provider is concerned about safeguarding the confidentiality of your information. The Service Provider provides physical, electronic, and procedural safeguards to protect information the Service Provider processes and maintai         
              
𝗖𝗵𝗮𝗻𝗴𝗲𝘀
              
This Privacy Policy may be updated from time to time for any reason. The Service Provider will notify you of any changes to the Privacy Policy by updating this page with the new Privacy Policy. You are advised to consult this Privacy Policy regularly for any changes, as continued use is deemed approval of all changes.
                           
This privacy policy is effective as of 2024-05-05
              
𝗬𝗼𝘂𝗿 𝗖𝗼𝗻𝘀𝗲𝗻𝘁
              
By using the Application, you are consenting to the processing of your information as set forth in this Privacy Policy now and as amended by us.
                        
𝗖𝗼𝗻𝘁𝗮𝗰𝘁 𝗨𝘀
              
If you have any questions regarding privacy while using the Application, or have questions about the practices, please contact the Service Provider via email at 𝗮𝗻𝘁𝗼𝗻𝘆𝗺𝗮𝘅𝘄𝗲𝗹𝗹𝟲𝟭𝟵@𝗴𝗺𝗮𝗶𝗹.𝗰𝗼𝗺.
              ''',
              textAlign: TextAlign.left,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('contact us: '),
                    Link(
                      uri: Uri.parse("mailto:antonymaxwell619@gmail.com"),
                      target: LinkTarget.blank,
                      builder: (context, followLink) {
                        return TextButton(
                          onPressed: followLink, 
                          child: const Text(
                        "𝗮𝗻𝘁𝗼𝗻𝘆𝗺𝗮𝘅𝘄𝗲𝗹𝗹𝟲𝟭𝟵@𝗴𝗺𝗮𝗶𝗹.𝗰𝗼𝗺"
                      ));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
