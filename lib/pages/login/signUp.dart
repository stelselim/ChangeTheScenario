import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email = "";
  String nickname = "";
  String password = "";
  bool checkBoxVal = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.red.shade500,
            Color.fromRGBO(125, 92, 255, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Join US!",
            textScaleFactor: 1.25,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            // Nickname
            Container(
              padding:
                  const EdgeInsets.only(left: 15, bottom: 2, right: 2, top: 2),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: Colors.white),
              ),
              child: TextFormField(
                maxLines: 1,
                autocorrect: false,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintText: "Nickname",
                  border: InputBorder.none,
                ),
                obscureText: false,
                style: TextStyle(
                  color: Colors.white,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                onChanged: (val) => email = val,
                onSaved: (val) => email = val,
              ),
            ),
            // Email
            Container(
              padding:
                  const EdgeInsets.only(left: 15, bottom: 2, right: 2, top: 2),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: Colors.white),
              ),
              child: TextFormField(
                maxLines: 1,
                autocorrect: false,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintText: "Email",
                  border: InputBorder.none,
                ),
                obscureText: false,
                style: TextStyle(
                  color: Colors.white,
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                onChanged: (val) => email = val,
                onSaved: (val) => email = val,
              ),
            ),

            /// Password
            Container(
              padding:
                  const EdgeInsets.only(left: 15, bottom: 2, right: 2, top: 2),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: Colors.white),
              ),
              child: TextFormField(
                maxLines: 1,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintText: "Password",
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) => password = val,
                onSaved: (val) => password = val,
              ),
            ),

            CheckboxListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 30),
              activeColor: Colors.white,
              checkColor: Colors.black,
              value: checkBoxVal,
              onChanged: (bool value) {
                if (value == true) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            height: height * 0.5,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Terms Of Service",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text("$termsOfService"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ButtonBar(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FlatButton(
                                          child: Text(
                                            "Agreed",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }
                setState(() {
                  checkBoxVal = value;
                });
              },
              title: Text(
                "Agree to The Terms Of Service",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 60),
                width: width * 0.4,
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Text(
                      "Send Email!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                print(email);
                if (email != "") Navigator.pushReplacementNamed(context, "/");
              },
            ),
          ],
        ),
      ),
    );
  }
}

const termsOfService =
    """This summary is designed to help you understand some of the key updates we’ve made to our Terms of Service (Terms). We hope this serves as a useful guide, but please ensure you read the new Terms in full.

Welcome to YouTube!
This section outlines our relationship with you. It includes a description of the Service, defines our Agreement, and names your service provider. Key updates:

Service Provider. Your service provider is now Google LLC.
Policies. We have added a link to the Policy, Safety and Copyright Policies, and our Advertising on YouTube Policies, which all form part of the Agreement. These are the policies that underpin our Community Guidelines, and we wanted to make sure to call out this detail to you upfront in our Terms.
Affiliates. To ensure you understand exactly who we mean when we talk about our group companies, we’ve included a definition of our “Affiliates”, meaning the companies in the Alphabet corporate group.
Who May Use the Service?
This section sets out certain requirements for use of the Service, and defines categories of users. Key updates:

Age Requirements. We have stated the specific age requirements for your country, reflecting our Google wide policies, and included a notice that, if you are a minor in your country, you must always have your parent or guardian’s permission before using the Service.
Parental Permission. We’ve added a section to explain your responsibility if you allow your child to use YouTube.
Businesses. Our Terms now make clear that, if you are using the Service on behalf of a company or organisation, that business accepts this Agreement.
Your Use of the Service
This section explains your rights to use the Service, and the conditions that apply to your use of the Service. It also explains how we may make changes to the Service. Key updates:

Google Accounts and YouTube Channels. We’ve provided details about which features of the Service can be accessed without a Google account or YouTube channel, and which features require one.
Your Information. We haven’t made any changes to the way we treat your information. You can read about our privacy practices by reviewing the Privacy Policy and YouTube Kids Privacy Notice. As a reminder, you can always review your privacy settings and manage your data and personalisation by visiting your Google Account.
Restrictions. We have updated this section to reflect our requirements around contests, and to include a prohibition on manipulating metrics.  
Service Changes. We have improved our Terms to be more transparent about why we might need to make changes to the Service, and provided a commitment to give you notice when those changes might affect you.
Your Content and Conduct
This section applies to users who provide Content to the Service. It defines the scope of the permissions that you grant by uploading your Content, and includes your agreement not to upload anything that infringes on anyone else’s rights. Key updates:

License. We’ve clarified the content license you grant us to make it easier to understand. We’re not asking for additional permissions and there’s no difference in how we’re using your content.
Duration. We have removed the right for YouTube to use your comments in perpetuity.
Removals. We have included a link to the tools you will need to remove your content, as well as a clear description about why we might need to take down content, and how to appeal removals. 
Analyzing Content. We may automatically analyze content on YouTube, to help detect abuse and keep the platform safe.
Account Suspension and Termination
This section explains how you and YouTube may terminate this relationship. Key updates:

Terminations. Our Terms now include more details about when we might need to terminate our Agreement with bad actors. We provide a greater commitment to give notice when we take such action and what you can do to appeal if you think we’ve got it wrong. We’ve also added instructions for you, if you decide you no longer want to use the Service.
About Software in the Service
This section includes details about software on the Service. Key updates:

Software Licences. We’ve made the software licence we grant you more specific, and included some details around open source.
Other Legal Terms
This section includes our service commitment to you. It also explains that there are some things we will not be responsible for. Key updates:

Our liability. We’ve made changes to the disclaimers and limitations of liability in the Terms.
About this Agreement
This section includes some further important details about our contract, including what to expect if we need to make changes to these Terms; or which law applies to them. Key updates:

Modifications. We want to give you the chance to review future material updates to these Terms.
Still have questions?

You can also find further details in our Help Center.

-----""";
