import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onproperty/screens/about_us.dart';
import 'package:onproperty/screens/add_property.dart';
import 'package:onproperty/screens/agent_details.dart';
import 'package:onproperty/screens/agents.dart';
import 'package:onproperty/screens/audio_call.dart';
import 'package:onproperty/screens/contact_us.dart';
import 'package:onproperty/screens/dashboard.dart';
import 'package:onproperty/screens/filters.dart';
import 'package:onproperty/screens/followers.dart';
import 'package:onproperty/screens/following.dart';
import 'package:onproperty/screens/forgot_password.dart';
import 'package:onproperty/screens/house_details.dart';
import 'package:onproperty/screens/inner_chat.dart';
import 'package:onproperty/screens/location.dart';
import 'package:onproperty/screens/my_leads.dart';
import 'package:onproperty/screens/new_contact_us.dart';
import 'package:onproperty/screens/news_and_blog.dart';
import 'package:onproperty/screens/news_and_blog_details.dart';
import 'package:onproperty/screens/notifications.dart';
import 'package:onproperty/screens/opt_screen.dart';
import 'package:onproperty/screens/properties.dart';
import 'package:onproperty/screens/saved_searches.dart';
import 'package:onproperty/screens/search_properties.dart';
import 'package:onproperty/screens/search_property.dart';
import 'package:onproperty/screens/see_all_screen.dart';
import 'package:onproperty/screens/settings.dart';
import 'package:onproperty/screens/sign_in.dart';
import 'package:onproperty/screens/sign_up.dart';
import 'package:onproperty/screens/splash.dart';
import 'package:onproperty/screens/terms_and_conditions.dart';
import 'package:onproperty/screens/video_call.dart';
import 'package:onproperty/screens/wishlist.dart';

class RouteGenerator {

  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => Splash());
      case 'Dashboard':
        return MaterialPageRoute(builder: (context)=>DashBoard());
      case 'SignUp':
        return MaterialPageRoute(builder: (context)=>SignUp());
      case 'SignIn':
        return MaterialPageRoute(builder: (context)=>SignIn());
        case 'ForgotPassword':
        return MaterialPageRoute(builder: (context)=>ForgotPassword());
      case 'OtpScreen':
        return MaterialPageRoute(builder: (context)=>OtpScreen());
      case 'AboutUs':
        return MaterialPageRoute(builder: (context)=>AboutUs());
      case 'AgentDetails':
        return MaterialPageRoute(builder: (context)=>AgentDetails());
      case 'Agents':
        return MaterialPageRoute(builder: (context)=>Agents());
      case 'InnerChat':
        return MaterialPageRoute(builder: (context)=>InnerChat());
      case 'ContactUs':
        return MaterialPageRoute(builder: (context)=>ContactUs());
      case 'MyLeads':
        return MaterialPageRoute(builder: (context)=>MyLeads());
      case 'HouseDetails':
        return MaterialPageRoute(builder: (context)=>HouseDetails());
      case 'Filters':
        return MaterialPageRoute(builder: (context)=>Filters());
      case 'Location':
        return MaterialPageRoute(builder: (context)=>Location());
      case 'Notifications':
        return MaterialPageRoute(builder: (context)=>Notifications());
      case 'Wishlist':
        return MaterialPageRoute(builder: (context)=>Wishlist());
      case 'SearchProperties':
        return MaterialPageRoute(builder: (context)=>SearchProperties());
      case 'SearchProperty':
        return MaterialPageRoute(builder: (context)=>SearchProperty());
      case 'SavedSearches':
        return MaterialPageRoute(builder: (context)=>SavedSearches());
      case 'Notifications':
        return MaterialPageRoute(builder: (context)=>Notifications());
      case 'NewsAndBlog':
        return MaterialPageRoute(builder: (context)=>NewsAndBlog());
      case 'NewsAndBlogDetails':
        return MaterialPageRoute(builder: (context)=>NewsAndBlogDetails());
      case 'NewContactUs':
        return MaterialPageRoute(builder: (context)=>NewContactUs());
      case 'TermsAndConditions':
        return MaterialPageRoute(builder: (context)=>TermsAndConditions());
      case 'Settings':
        return MaterialPageRoute(builder: (context)=>Settings());
      case 'AddProperty':
        return MaterialPageRoute(builder: (context)=>AddProperty());
      case 'VideoCall':
        return MaterialPageRoute(builder: (context)=>VideoCall());
      case 'AudioCall':
        return MaterialPageRoute(builder: (context)=>AudioCall());
      case 'SeeAllScreen':
        return MaterialPageRoute(builder: (context)=>SeeAllScreen());
      case 'SearchProperty':
        return MaterialPageRoute(builder: (context)=>SearchProperty());
      case 'Followers':
        return MaterialPageRoute(builder: (context)=>Followers());
      case 'Following':
        return MaterialPageRoute(builder: (context)=>Following());
      case 'Properties':
        return MaterialPageRoute(builder: (context)=>Properties());

    }
  }
}
