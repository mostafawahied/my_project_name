import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_project_name/ArabStrings.dart';
import 'package:my_project_name/SharedPreferenceConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'EngStrings.dart';

class Strings {
  static bool english = true;
  static bool isLogin = false;
  static bool goToOnBoardScreens = true;
  static String userLocations = '';
  static String userToken;
  static String userMobile;
  static String lastVerificationDate;

  static String userRefreshToken;

  static bool isCompleteForgetVerificstion = true;
  static bool isCompleteForgetPassword = true;

  static List<TextInputFormatter> preventedSpecialCharacters = [
    // ignore: deprecated_member_use
    BlacklistingTextInputFormatter(new RegExp(r'_|[^\w\s\u0621-\u064A]+')),
    // ignore: deprecated_member_use
    BlacklistingTextInputFormatter(new RegExp(r'^\s*'))
  ];

  static Future initiateLanguage(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    english = prefs.getBool(languagePreference);
    String language = Localizations.localeOf(context).languageCode;
    print(language);
    if (english == null) setLanguage(language == 'en' ? true : false);
  }

  static Future setLanguage(bool english) async {
    Strings.english = english;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(languagePreference, english);
  }

  static Future setRememberMe(bool isLogin) async {
    Strings.isLogin = isLogin;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isRememberPreference, isLogin);
  }

  static Future getRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool(isRememberPreference);
    if (isLogin == null) setRememberMe(false);
  }

  //==============================================================================
  static Future setIsCompleteForgetVerificstion(bool isComplete) async {
    Strings.isCompleteForgetVerificstion = isComplete;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(completeForgetVerificstion, isComplete);
  }

  static Future getIsCompleteForgetVerificstion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isCompleteForgetVerificstion = prefs.getBool(completeForgetVerificstion);
    if (isCompleteForgetVerificstion == null)
      setIsCompleteForgetVerificstion(true);
  }

  //==============================================================================

  static Future setIsCompleteForgetPassword(bool isComplete) async {
    Strings.isCompleteForgetPassword = isComplete;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(completeForgetPassword, isComplete);
  }

  static Future getIsCompleteForgetPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isCompleteForgetPassword = prefs.getBool(completeForgetPassword);
    if (isCompleteForgetPassword == null) setIsCompleteForgetPassword(true);
  }

  //==============================================================================

  static Future setGoToOnBoardScreens(bool goToOnBoardScreens) async {
    Strings.goToOnBoardScreens = goToOnBoardScreens;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(getGoToOnBoardScreensPreference, goToOnBoardScreens);
  }

  static Future getGoToOnBoardScreens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    goToOnBoardScreens = prefs.getBool(getGoToOnBoardScreensPreference);
    if (goToOnBoardScreens == null) setGoToOnBoardScreens(true);
  }

//==============================================================================

  static Future getUserLocations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userLocations = prefs.getString(userLocationsPreference);
    if (userLocations == null) setUserLocations('');
  }

  static Future setUserLocations(String userLocation) async {
    Strings.userLocations = userLocation;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userLocationsPreference, userLocation);
  }

  //====================================================================

  static Future getLastVerificationDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lastVerificationDate = prefs.getString(lastVerificationDatePreference);
    if (lastVerificationDate == null) setLastVerificationDate('');
  }

  static Future setLastVerificationDate(String verificationDate) async {
    Strings.lastVerificationDate = verificationDate;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(lastVerificationDatePreference, verificationDate);
  }

  //====================================================================
  static Future getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userToken = prefs.getString(userTokenPreference);
    if (userToken == null) setUserToken('');
  }

  static Future setUserToken(String userToken) async {
    Strings.userToken = userToken;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userTokenPreference, userToken);
  }

//====================================================================

  static Future getUserMobile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userMobile = prefs.getString(userMobilePreference);
    if (userMobile == null) setUserMobile('');
  }

  static Future setUserMobile(String mobile) async {
    Strings.userMobile = mobile;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userMobilePreference, mobile);
  }

//====================================================================
  static Future getUserRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userRefreshToken = prefs.getString(userRefreshTokenPreference);
    if (userRefreshToken == null) setUserRefreshToken('');
  }

  static Future setUserRefreshToken(String userToken) async {
    Strings.userRefreshToken = userToken;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userRefreshTokenPreference, userToken);
  }

  static clearSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static String getNoInternetConnection() {
    return english ? EngStrings.NO_INTERNET : ArbStrings.NO_INTERNET;
  }

  static String getNOINTERNET_SUB_TXT() {
    return english
        ? EngStrings.NO_INTERNET_SUB_TXT
        : ArbStrings.NO_INTERNET_SUB_TXT;
  }

  static String quit() {
    return english ? EngStrings.QUI : ArbStrings.QUI;
  }

  static String notifications() {
    return english ? EngStrings.NOTIFICATIONS : ArbStrings.NOTIFICATIONS;
  }

  static String changeLanguage() {
    return english ? EngStrings.CHANGE_LANGUAGE : ArbStrings.CHANGE_LANGUAGE;
  }

  static String explore() {
    return english ? EngStrings.Explore : ArbStrings.Explore;
  }

  static String txt_guide_search() {
    return english ? EngStrings.txt_guide_search : ArbStrings.txt_guide_search;
  }

  static String txt_tv_find_it() {
    return english ? EngStrings.txt_tv_find_it : ArbStrings.txt_tv_find_it;
  }

  static String txt_guide_find_it() {
    return english
        ? EngStrings.txt_guide_find_it
        : ArbStrings.txt_guide_find_it;
  }

  static String txt_tv_fast_delivery() {
    return english
        ? EngStrings.txt_tv_fast_delivery
        : ArbStrings.txt_tv_fast_delivery;
  }

  static String txt_guide_fast_delivery() {
    return english
        ? EngStrings.txt_guide_fast_delivery
        : ArbStrings.txt_guide_fast_delivery;
  }

  static String txt_get_started() {
    return english ? EngStrings.txt_get_started : ArbStrings.txt_get_started;
  }

  static String next() {
    return english ? EngStrings.next : ArbStrings.next;
  }

  static String skip() {
    return english ? EngStrings.skip : ArbStrings.skip;
  }

  static String tv_discover_login() {
    return english
        ? EngStrings.tv_discover_login
        : ArbStrings.tv_discover_login;
  }

  static String txt_hint_mobile_number() {
    return english
        ? EngStrings.txt_hint_mobile_number
        : ArbStrings.txt_hint_mobile_number;
  }

  static String txt_hint_password() {
    return english
        ? EngStrings.txt_hint_password
        : ArbStrings.txt_hint_password;
  }

  static String txt_tv_forgot_password() {
    return english
        ? EngStrings.txt_tv_forgot_password
        : ArbStrings.txt_tv_forgot_password;
  }

  static String enterUSERNAMEPASS() {
    return english
        ? EngStrings.EnterUSERNAMEPASS
        : ArbStrings.EnterUSERNAMEPASS;
  }

  static String Incorrect_login_response() {
    return english
        ? EngStrings.Incorrect_login_response
        : ArbStrings.Incorrect_login_response;
  }

  static String enterMobileNumber() {
    return english
        ? EngStrings.enterMobileNumber
        : ArbStrings.enterMobileNumber;
  }

  static String txt_btn_login() {
    return english ? EngStrings.txt_btn_login : ArbStrings.txt_btn_login;
  }

  static String txt_tv_have_not_account() {
    return english
        ? EngStrings.txt_tv_have_not_account
        : ArbStrings.txt_tv_have_not_account;
  }

  static String txt_tv_new_user() {
    return english ? EngStrings.txt_tv_new_user : ArbStrings.txt_tv_new_user;
  }

  static String txt_privacy() {
    return english ? EngStrings.txt_privacy : ArbStrings.txt_privacy;
  }

  static String txt_tv_terms_of_use() {
    return english
        ? EngStrings.txt_tv_terms_of_use
        : ArbStrings.txt_tv_terms_of_use;
  }

  static String txt_tv_privacy_policy() {
    return english
        ? EngStrings.txt_tv_privacy_policy
        : ArbStrings.txt_tv_privacy_policy;
  }

  static String tv_continue_as_guest() {
    return english
        ? EngStrings.tv_continue_as_guest
        : ArbStrings.tv_continue_as_guest;
  }

  static String txt_tv_regisration() {
    return english
        ? EngStrings.txt_tv_regisration
        : ArbStrings.txt_tv_regisration;
  }

  static String txt_tv_mobile_num() {
    return english
        ? EngStrings.txt_tv_mobile_num
        : ArbStrings.txt_tv_mobile_num;
  }

  static String txt_tv_reset_mobile_num() {
    return english
        ? EngStrings.txt_tv_reset_mobile_num
        : ArbStrings.txt_tv_reset_mobile_num;
  }

  static String txt_error_phone_number() {
    return english
        ? EngStrings.txt_error_phone_number
        : ArbStrings.txt_error_phone_number;
  }

  static String txt_btn_get_code() {
    return english ? EngStrings.txt_btn_get_code : ArbStrings.txt_btn_get_code;
  }

  static String txt_title_account_info() {
    return english
        ? EngStrings.txt_title_account_info
        : ArbStrings.txt_title_account_info;
  }

  static String txt_hint_full_name() {
    return english
        ? EngStrings.txt_hint_full_name
        : ArbStrings.txt_hint_full_name;
  }

  static String txt_enter_full_name() {
    return english
        ? EngStrings.txt_enter_full_name
        : ArbStrings.txt_enter_full_name;
  }

  static String txt_error_password_length() {
    return english
        ? EngStrings.txt_error_password_length
        : ArbStrings.txt_error_password_length;
  }

  static String txt_error_confirm_passLword() {
    return english
        ? EngStrings.txt_error_confirm_passLword
        : ArbStrings.txt_error_confirm_passLword;
  }

  static String txt_tv_have_account() {
    return english
        ? EngStrings.txt_tv_have_account
        : ArbStrings.txt_tv_have_account;
  }

  static String txt_title_verify_code() {
    return english
        ? EngStrings.txt_title_verify_code
        : ArbStrings.txt_title_verify_code;
  }

  static String txt_tv_hint_verify_code() {
    return english
        ? EngStrings.txt_tv_hint_verify_code
        : ArbStrings.txt_tv_hint_verify_code;
  }

  static String txt_btn_verify() {
    return english ? EngStrings.txt_btn_verify : ArbStrings.txt_btn_verify;
  }

  static String txt_tv_not_receive_code() {
    return english
        ? EngStrings.txt_tv_not_receive_code
        : ArbStrings.txt_tv_not_receive_code;
  }

  static String txt_tv_resend() {
    return english ? EngStrings.txt_tv_resend : ArbStrings.txt_tv_resend;
  }

  static String appSettings() {
    return english ? EngStrings.AppSettings : ArbStrings.AppSettings;
  }

  static String txt_tv_hint_setting() {
    return english
        ? EngStrings.txt_tv_hint_setting
        : ArbStrings.txt_tv_hint_setting;
  }

  static String txt_allow_notification() {
    return english
        ? EngStrings.txt_allow_notification
        : ArbStrings.txt_allow_notification;
  }

  static String tv_deliver_to() {
    return english ? EngStrings.tv_deliver_to : ArbStrings.tv_deliver_to;
  }

  static String txt_tv_farargy() {
    return english ? EngStrings.txt_tv_farargy : ArbStrings.txt_tv_farargy;
  }

  static String txt_search_tv_farargy() {
    return english
        ? EngStrings.txt_search_tv_farargy
        : ArbStrings.txt_tv_farargy;
  }

  static String txt_tv_fruits() {
    return english ? EngStrings.txt_tv_fruits : ArbStrings.txt_tv_fruits;
  }

  static String txt_search_tv_fruits() {
    return english ? EngStrings.txt_search_tv_fruits : ArbStrings.txt_tv_fruits;
  }

  static String txt_tv_plus() {
    return english ? EngStrings.txt_tv_plus : ArbStrings.txt_tv_plus;
  }

  static String txt_tv_pharma() {
    return english ? EngStrings.txt_tv_pharma : ArbStrings.txt_tv_pharma;
  }

  static String txt_search_tv_pharma() {
    return english
        ? EngStrings.txt_search_tv_pharma
        : ArbStrings.txt_search_tv_pharma;
  }

  static String txt_tv_restaurants() {
    return english
        ? EngStrings.txt_tv_restaurants
        : ArbStrings.txt_tv_restaurants;
  }

  static String txt_search_tv_restaurants() {
    return english
        ? EngStrings.txt_search_tv_restaurants
        : ArbStrings.txt_search_tv_restaurants;
  }

  static String txt_tv_dry_clean() {
    return english ? EngStrings.txt_tv_dry_clean : ArbStrings.txt_tv_dry_clean;
  }

  static String txt_tv_service_super_market() {
    return english
        ? EngStrings.txt_tv_service_super_market
        : ArbStrings.txt_tv_service_super_market;
  }

  static String txt_search_tv_service_super_market() {
    return english
        ? EngStrings.txt_search_tv_service_super_market
        : ArbStrings.txt_tv_service_super_market;
  }

  static String txt_tv_nav_my_profile() {
    return english
        ? EngStrings.txt_tv_nav_my_profile
        : ArbStrings.txt_tv_nav_my_profile;
  }

  static String txt_tv_nav_my_order() {
    return english
        ? EngStrings.txt_tv_nav_my_order
        : ArbStrings.txt_tv_nav_my_order;
  }

  static String txt_tv_nav_contact_us() {
    return english
        ? EngStrings.txt_tv_nav_contact_us
        : ArbStrings.txt_tv_nav_contact_us;
  }

  static String txt_tv_nav_about() {
    return english ? EngStrings.txt_tv_nav_about : ArbStrings.txt_tv_nav_about;
  }

  static String txt_tv_nav_invite() {
    return english
        ? EngStrings.txt_tv_nav_invite
        : ArbStrings.txt_tv_nav_invite;
  }

  static String txt_nav_sign_out() {
    return english ? EngStrings.txt_nav_sign_out : ArbStrings.txt_nav_sign_out;
  }

  static String txt_shops() {
    return english ? EngStrings.txt_shops : ArbStrings.txt_shops;
  }

  static String txt_servinglist_shops() {
    return english ? EngStrings.txt_shops : ArbStrings.txt_shop;
  }

  static String txt_tv_order_until() {
    return english
        ? EngStrings.txt_tv_order_until
        : ArbStrings.txt_tv_order_until;
  }

  static String txt_tv_rate() {
    return english ? EngStrings.txt_tv_rate : ArbStrings.txt_tv_rate;
  }

  static String txt_tv_distance() {
    return english ? EngStrings.txt_tv_distance : ArbStrings.txt_tv_distance;
  }

  static String txt_km() {
    return english ? EngStrings.txt_km : ArbStrings.txt_km;
  }

  static String txt_tv_choose_location() {
    return english
        ? EngStrings.txt_tv_choose_location
        : ArbStrings.txt_tv_choose_location;
  }

  static String txt_btn_lets_go() {
    return english ? EngStrings.txt_btn_lets_go : ArbStrings.txt_btn_lets_go;
  }

  static String txt_map_not_supported() {
    return english
        ? EngStrings.txt_map_not_supported
        : ArbStrings.txt_map_not_supported;
  }

  static String txt_map_not_add() {
    return english ? EngStrings.txt_map_not_add : ArbStrings.txt_map_not_add;
  }

  static String tv_add_pin() {
    return english ? EngStrings.tv_add_pin : ArbStrings.tv_add_pin;
  }

  static String tv_choose_another_location() {
    return english
        ? EngStrings.tv_choose_another_location
        : ArbStrings.tv_choose_another_location;
  }

  static String search_for_a() {
    return english ? EngStrings.search_for_a : ArbStrings.search_for_a;
  }

  static String txt_shop() {
    return english ? EngStrings.txt_shop : ArbStrings.txt_shop;
  }

  static String available() {
    return english ? EngStrings.available : ArbStrings.available;
  }

  static String available_pharmacy() {
    return english ? EngStrings.available : ArbStrings.available_pharmacy;
  }

  static String noDataAvailable() {
    return english ? EngStrings.NoDataAvailable : ArbStrings.NoDataAvailable;
  }

  static String tv_no_result_hint() {
    return english
        ? EngStrings.tv_no_result_hint
        : ArbStrings.tv_no_result_hint;
  }

  static String txt_tv_cancel() {
    return english ? EngStrings.txt_tv_cancel : ArbStrings.txt_tv_cancel;
  }

  static String txt_error_code() {
    return english ? EngStrings.txt_error_code : ArbStrings.txt_error_code;
  }

  static String txt_tv_services_title() {
    return english
        ? EngStrings.txt_tv_services_title
        : ArbStrings.txt_tv_services_title;
  }

  static String error_already_exist() {
    return english
        ? EngStrings.error_already_exist
        : ArbStrings.error_already_exist;
  }

  static String txt_error_verify_code() {
    return english
        ? EngStrings.txt_error_verify_code
        : ArbStrings.txt_error_verify_code;
  }

  static String txt_title_new_password() {
    return english
        ? EngStrings.txt_title_new_password
        : ArbStrings.txt_title_new_password;
  }

  static String txt_btn_change_pass() {
    return english
        ? EngStrings.txt_btn_change_pass
        : ArbStrings.txt_btn_change_pass;
  }

  static String txt_hint_new_password() {
    return english
        ? EngStrings.txt_hint_new_password
        : ArbStrings.txt_hint_new_password;
  }

  static String txt_hint_confirm_password() {
    return english
        ? EngStrings.txt_hint_confirm_password
        : ArbStrings.txt_hint_confirm_password;
  }

  static String txt_hint_confirm_new_password() {
    return english
        ? EngStrings.txt_hint_confirm_new_password
        : ArbStrings.txt_hint_confirm_new_password;
  }

  static String txt_tv_failed_login_title() {
    return english
        ? EngStrings.txt_tv_failed_login_title
        : ArbStrings.txt_tv_failed_login_title;
  }

  static String txt_tv_failed_login_hint() {
    return english
        ? EngStrings.txt_tv_failed_login_hint
        : ArbStrings.txt_tv_failed_login_hint;
  }

  static String txt_tv_try_again() {
    return english ? EngStrings.txt_tv_try_again : ArbStrings.txt_tv_try_again;
  }

  static String txt_tv_create_account() {
    return english
        ? EngStrings.txt_tv_create_account
        : ArbStrings.txt_tv_create_account;
  }

  static String txt_tv_set_your_location() {
    return english
        ? EngStrings.txt_tv_set_your_location
        : ArbStrings.txt_tv_set_your_location;
  }

  static String txt_all() {
    return english ? EngStrings.txt_all : ArbStrings.txt_all;
  }

  static String txt_closed() {
    return english ? EngStrings.txt_closed : ArbStrings.txt_closed;
  }

  static String txt_close() {
    return english ? EngStrings.txt_close : ArbStrings.txt_close;
  }

  static String txt_busy() {
    return english ? EngStrings.txt_busy : ArbStrings.txt_busy;
  }

  static String txt_egp() {
    return english ? EngStrings.txt_egp : ArbStrings.txt_egp;
  }

  static String txt_new() {
    return english ? EngStrings.txt_new : ArbStrings.txt_new;
  }

  static String gallery() {
    return english ? EngStrings.GALLERY : ArbStrings.GALLERY;
  }

  static String camera() {
    return english ? EngStrings.CAMERA : ArbStrings.CAMERA;
  }

  static String txt_tv_delivery() {
    return english ? EngStrings.txt_tv_delivery : ArbStrings.txt_tv_delivery;
  }

  static String txt_time() {
    return english ? EngStrings.txt_time : ArbStrings.txt_time;
  }

  static String txt_tv_min_order() {
    return english ? EngStrings.txt_tv_min_order : ArbStrings.txt_tv_min_order;
  }

  static String txt_tv_rating() {
    return english ? EngStrings.txt_tv_rating : ArbStrings.txt_tv_rating;
  }

  static String txt_daily_offer() {
    return english ? EngStrings.txt_daily_offer : ArbStrings.txt_daily_offer;
  }

  static String txt_tv_view_cart() {
    return english ? EngStrings.txt_tv_view_cart : ArbStrings.txt_tv_view_cart;
  }

  static String txt_tv_total() {
    return english ? EngStrings.txt_tv_total : ArbStrings.txt_tv_total;
  }

  static String txt_tv_total_amount() {
    return english
        ? EngStrings.txt_tv_total_amount
        : ArbStrings.txt_tv_total_amount;
  }

  static String txt_shoppint_cart() {
    return english
        ? EngStrings.txt_shoppint_cart
        : ArbStrings.txt_shoppint_cart;
  }

  static String tv_you_saved() {
    return english ? EngStrings.tv_you_saved : ArbStrings.tv_you_saved;
  }

  static String txt_tv_proceed() {
    return english ? EngStrings.txt_tv_proceed : ArbStrings.txt_tv_proceed;
  }

  static String txt_tv_expire() {
    return english ? EngStrings.txt_tv_expire : ArbStrings.txt_tv_expire;
  }

  static String txt_tv_days() {
    return english ? EngStrings.txt_tv_days : ArbStrings.txt_tv_days;
  }

  static String price_based_on_selection() {
    return english
        ? EngStrings.price_based_on_selection
        : ArbStrings.price_based_on_selection;
  }

  static String starting_from() {
    return english ? EngStrings.starting_from : ArbStrings.starting_from;
  }

  static String special_requests() {
    return english ? EngStrings.special_requests : ArbStrings.special_requests;
  }

  static String add_to_card() {
    return english ? EngStrings.add_to_card : ArbStrings.add_to_card;
  }

  static String required() {
    return english ? EngStrings.required : ArbStrings.required;
  }

  static String optional() {
    return english ? EngStrings.optional : ArbStrings.optional;
  }

  static String choose_up_to() {
    return english ? EngStrings.choose_up_to : ArbStrings.choose_up_to;
  }

  static String item() {
    return english ? EngStrings.item : ArbStrings.item;
  }

  static String cuisine() {
    return english ? EngStrings.cuisine : ArbStrings.cuisine;
  }

  static String all_cuisine() {
    return english ? EngStrings.all_cuisine : ArbStrings.all_cuisine;
  }

  static String items_list() {
    return english ? EngStrings.items_list : ArbStrings.items_list;
  }

  static String txt_tv_new_order_title() {
    return english
        ? EngStrings.txt_tv_new_order_title
        : ArbStrings.txt_tv_new_order_title;
  }

  static String txt_tv_place_new_order_title() {
    return english
        ? EngStrings.txt_tv_place_new_order_title
        : ArbStrings.txt_tv_place_new_order_title;
  }

  static String txt_tv_order_hint() {
    return english
        ? EngStrings.txt_tv_order_hint
        : ArbStrings.txt_tv_order_hint;
  }

  static String txt_btn_record() {
    return english ? EngStrings.txt_btn_record : ArbStrings.txt_btn_record;
  }

  static String txt_btn_confirm_voice_order() {
    return english
        ? EngStrings.txt_btn_confirm_voice_order
        : ArbStrings.txt_btn_confirm_voice_order;
  }

  static String voice() {
    return english ? EngStrings.voice : ArbStrings.voice;
  }

  static String text() {
    return english ? EngStrings.text : ArbStrings.text;
  }

  static String prescription() {
    return english ? EngStrings.prescription : ArbStrings.prescription;
  }

  static String txt_btn_delete() {
    return english ? EngStrings.txt_btn_delete : ArbStrings.txt_btn_delete;
  }

  static String txt_tv_no_record() {
    return english ? EngStrings.txt_tv_no_record : ArbStrings.txt_tv_no_record;
  }

  static String txt_btn_confirm_order() {
    return english
        ? EngStrings.txt_btn_confirm_order
        : ArbStrings.txt_btn_confirm_order;
  }

  static String txt_tv_record_order() {
    return english
        ? EngStrings.txt_tv_record_order
        : ArbStrings.txt_tv_record_order;
  }

  static String txt_et_type_order() {
    return english
        ? EngStrings.txt_et_type_order
        : ArbStrings.txt_et_type_order;
  }

  static String add() {
    return english ? EngStrings.add : ArbStrings.add;
  }

  static String txt_tv_img_order_hint() {
    return english
        ? EngStrings.txt_tv_img_order_hint
        : ArbStrings.txt_tv_img_order_hint;
  }

  static String txt_tv_add_more() {
    return english ? EngStrings.txt_tv_add_more : ArbStrings.txt_tv_add_more;
  }

  static String txt_tv_hint_img_note() {
    return english
        ? EngStrings.txt_tv_hint_img_note
        : ArbStrings.txt_tv_hint_img_note;
  }

  static String txt_no_img() {
    return english ? EngStrings.txt_no_img : ArbStrings.txt_no_img;
  }

  static String txt_tv_title_order() {
    return english
        ? EngStrings.txt_tv_title_order
        : ArbStrings.txt_tv_title_order;
  }

  static String txt_tv_market_details() {
    return english
        ? EngStrings.txt_tv_market_details
        : ArbStrings.txt_tv_market_details;
  }

  static String txt_tv_change() {
    return english ? EngStrings.txt_tv_change : ArbStrings.txt_tv_change;
  }

  static String txt_tv_delivery_address() {
    return english
        ? EngStrings.txt_tv_delivery_address
        : ArbStrings.txt_tv_delivery_address;
  }

  static String txt_tv_add() {
    return english ? EngStrings.txt_tv_add : ArbStrings.txt_tv_add;
  }

  static String txt_tv_add_notes() {
    return english ? EngStrings.txt_tv_add_notes : ArbStrings.txt_tv_add_notes;
  }

  static String hint_notes() {
    return english ? EngStrings.hint_notes : ArbStrings.hint_notes;
  }

  static String txt_tv_order_list() {
    return english
        ? EngStrings.txt_tv_order_list
        : ArbStrings.txt_tv_order_list;
  }

  static String txt_tv_bring_change() {
    return english
        ? EngStrings.txt_tv_bring_change
        : ArbStrings.txt_tv_bring_change;
  }

  static String txt_hint_change() {
    return english ? EngStrings.txt_hint_change : ArbStrings.txt_hint_change;
  }

  static String txt_tv_reject_order() {
    return english
        ? EngStrings.txt_tv_reject_order
        : ArbStrings.txt_tv_reject_order;
  }

  static String txt_tv_hint_reject_order() {
    return english
        ? EngStrings.txt_tv_hint_reject_order
        : ArbStrings.txt_tv_hint_reject_order;
  }

  static String txt_tv_promo_code() {
    return english
        ? EngStrings.txt_tv_promo_code
        : ArbStrings.txt_tv_promo_code;
  }

  static String txt_hint_promo_code() {
    return english
        ? EngStrings.txt_hint_promo_code
        : ArbStrings.txt_hint_promo_code;
  }

  static String txt_tv_redeem() {
    return english ? EngStrings.txt_tv_redeem : ArbStrings.txt_tv_redeem;
  }

  static String image() {
    return english ? EngStrings.image : ArbStrings.image;
  }

  static String txt_tv_delivery_order_title() {
    return english
        ? EngStrings.txt_tv_delivery_order_title
        : ArbStrings.txt_tv_delivery_order_title;
  }

  static String txt_tv_order_not_confirmed() {
    return english
        ? EngStrings.txt_tv_order_not_confirmed
        : ArbStrings.txt_tv_order_not_confirmed;
  }

  static String txt_tv_order_number() {
    return english
        ? EngStrings.txt_tv_order_number
        : ArbStrings.txt_tv_order_number;
  }

  static String txt_tv_order_status() {
    return english
        ? EngStrings.txt_tv_order_status
        : ArbStrings.txt_tv_order_status;
  }

  static String txt_tv_market_num() {
    return english
        ? EngStrings.txt_tv_market_num
        : ArbStrings.txt_tv_market_num;
  }

  static String txt_tv_order_date() {
    return english
        ? EngStrings.txt_tv_order_date
        : ArbStrings.txt_tv_order_date;
  }

  static String txt_tv_time() {
    return english ? EngStrings.txt_tv_time : ArbStrings.txt_tv_time;
  }

  static String txt_tv_total_ammount() {
    return english
        ? EngStrings.txt_tv_total_ammount
        : ArbStrings.txt_tv_total_ammount;
  }

  static String txt_tv_delivery_fees() {
    return english
        ? EngStrings.txt_tv_delivery_fees
        : ArbStrings.txt_tv_delivery_fees;
  }

  static String txt_tv_price() {
    return english ? EngStrings.txt_tv_price : ArbStrings.txt_tv_price;
  }

  static String txt_order_confirm_mins() {
    return english
        ? EngStrings.txt_order_confirm_mins
        : ArbStrings.txt_order_confirm_mins;
  }

  static String txt_tv_cart_empty() {
    return english
        ? EngStrings.txt_tv_cart_empty
        : ArbStrings.txt_tv_cart_empty;
  }

  static String hint_tv_cart_empty() {
    return english
        ? EngStrings.hint_tv_cart_empty
        : ArbStrings.hint_tv_cart_empty;
  }

  static String txt_btn_continue_shopping() {
    return english
        ? EngStrings.txt_btn_continue_shopping
        : ArbStrings.txt_btn_continue_shopping;
  }

  static String txt_tv_warning() {
    return english ? EngStrings.txt_tv_warning : ArbStrings.txt_tv_warning;
  }

  static String txt_tv_ask_delete() {
    return english
        ? EngStrings.txt_tv_ask_delete
        : ArbStrings.txt_tv_ask_delete;
  }

  static String txt_tv_send_request() {
    return english
        ? EngStrings.txt_tv_send_request
        : ArbStrings.txt_tv_send_request;
  }

  static String txt_tv_collect_clothes() {
    return english
        ? EngStrings.txt_tv_collect_clothes
        : ArbStrings.txt_tv_collect_clothes;
  }

  static String txt_tv_send_pickup_request() {
    return english
        ? EngStrings.txt_tv_send_pickup_request
        : ArbStrings.txt_tv_send_pickup_request;
  }

  static String txt_hold_recording() {
    return english
        ? EngStrings.txt_hold_recording
        : ArbStrings.txt_hold_recording;
  }

  static String txt_no_text() {
    return english ? EngStrings.txt_no_text : ArbStrings.txt_no_text;
  }

  static String txt_error_max_resend() {
    return english
        ? EngStrings.txt_error_max_resend
        : ArbStrings.txt_error_max_resend;
  }

  static String txt_welcome_title() {
    return english
        ? EngStrings.txt_welcome_title
        : ArbStrings.txt_welcome_title;
  }

  static String txt_sent_verification_title() {
    return english
        ? EngStrings.txt_sent_verification_title
        : ArbStrings.txt_sent_verification_title;
  }

  static String txt_sent_enter_mobile_title() {
    return english
        ? EngStrings.txt_sent_enter_mobile_title
        : ArbStrings.txt_sent_enter_mobile_title;
  }

  static String txt_reset_password_title() {
    return english
        ? EngStrings.txt_reset_password_title
        : ArbStrings.txt_reset_password_title;
  }

  static String txt_reset() {
    return english ? EngStrings.txt_reset : ArbStrings.txt_reset;
  }

  static String txt_success_send() {
    return english ? EngStrings.txt_success_send : ArbStrings.txt_success_send;
  }

  static String txt_successful() {
    return english ? EngStrings.txt_successful : ArbStrings.txt_successful;
  }

  static String txt_too_many() {
    return english ? EngStrings.txt_too_many : ArbStrings.txt_too_many;
  }

  static String txt_try_again() {
    return english ? EngStrings.txt_try_again : ArbStrings.txt_try_again;
  }

  static String txt_mobile_exist() {
    return english ? EngStrings.txt_mobile_exist : ArbStrings.txt_mobile_exist;
  }

  static String txt_email() {
    return english ? EngStrings.txt_email : ArbStrings.txt_email;
  }

  static String txt_email_address() {
    return english ? EngStrings.txt_email_address : ArbStrings.txt_email;
  }

  static String txt_create_account_welcome() {
    return english
        ? EngStrings.txt_create_account_welcome
        : ArbStrings.txt_create_account_welcome;
  }

  static String txt_bringi() {
    return english ? EngStrings.txt_bringi : ArbStrings.txt_bringi;
  }

  static String txt_welcome_back() {
    return english ? EngStrings.txt_welcome_back : ArbStrings.txt_welcome_back;
  }

  static String txt_valid_email() {
    return english ? EngStrings.txt_valid_email : ArbStrings.txt_valid_email;
  }

  static String txt_what_do_you_need() {
    return english
        ? EngStrings.txt_what_do_you_need
        : ArbStrings.txt_what_do_you_need;
  }

  static String txt_bringi_share() {
    return english ? EngStrings.txt_bringi_share : ArbStrings.txt_bringi_share;
  }

  static String txt_select_location() {
    return english
        ? EngStrings.txt_select_location
        : ArbStrings.txt_select_location;
  }

  static String txt_select_current_location() {
    return english
        ? EngStrings.txt_select_current_location
        : ArbStrings.txt_select_current_location;
  }

  static String txt_our_delivery_areas() {
    return english
        ? EngStrings.txt_our_delivery_areas
        : ArbStrings.txt_our_delivery_areas;
  }

  static String txt_personal_info() {
    return english
        ? EngStrings.txt_personal_info
        : ArbStrings.txt_personal_info;
  }

  static String txt_my_addresses() {
    return english ? EngStrings.txt_my_addresses : ArbStrings.txt_my_addresses;
  }

  static String txt_app_settings() {
    return english ? EngStrings.txt_app_settings : ArbStrings.txt_app_settings;
  }

  static String txt_add_address() {
    return english ? EngStrings.txt_add_address : ArbStrings.txt_add_address;
  }

  static String txt_edit_address() {
    return english ? EngStrings.txt_edit_address : ArbStrings.txt_edit_address;
  }

  static String txt_select_location_map() {
    return english
        ? EngStrings.txt_select_location_map
        : ArbStrings.txt_select_location_map;
  }

  static String txt_move_location_pin() {
    return english
        ? EngStrings.txt_move_location_pin
        : ArbStrings.txt_move_location_pin;
  }

  static String txt_title() {
    return english ? EngStrings.txt_title : ArbStrings.txt_title;
  }

  static String txt_city() {
    return english ? EngStrings.txt_city : ArbStrings.txt_city;
  }

  static String txt_area() {
    return english ? EngStrings.txt_area : ArbStrings.txt_area;
  }

  static String txt_street() {
    return english ? EngStrings.txt_street : ArbStrings.txt_street;
  }

  static String txt_building() {
    return english ? EngStrings.txt_building : ArbStrings.txt_building;
  }

  static String txt_floor() {
    return english ? EngStrings.txt_floor : ArbStrings.txt_floor;
  }

  static String txt_flat() {
    return english ? EngStrings.txt_flat : ArbStrings.txt_flat;
  }

  static String txt_other() {
    return english ? EngStrings.txt_other : ArbStrings.txt_other;
  }

  static String txt_make_default() {
    return english ? EngStrings.txt_make_default : ArbStrings.txt_make_default;
  }

  static String txt_save_address() {
    return english ? EngStrings.txt_save_address : ArbStrings.txt_save_address;
  }

  static String txt_tv_choose_city() {
    return english
        ? EngStrings.txt_tv_choose_city
        : ArbStrings.txt_tv_choose_city;
  }

  static String txt_tv_choose_area() {
    return english
        ? EngStrings.txt_tv_choose_area
        : ArbStrings.txt_tv_choose_area;
  }

  static String txt_home() {
    return english ? EngStrings.txt_home : ArbStrings.txt_home;
  }

  static String txt_balance() {
    return english ? EngStrings.txt_balance : ArbStrings.txt_balance;
  }

  static String txt_city_not_empty() {
    return english
        ? EngStrings.txt_city_not_empty
        : ArbStrings.txt_city_not_empty;
  }

  static String txt_area_not_empty() {
    return english
        ? EngStrings.txt_area_not_empty
        : ArbStrings.txt_area_not_empty;
  }

  static String txt_street_not_empty() {
    return english
        ? EngStrings.txt_street_not_empty
        : ArbStrings.txt_street_not_empty;
  }

  static String txt_building_not_empty() {
    return english
        ? EngStrings.txt_building_not_empty
        : ArbStrings.txt_building_not_empty;
  }

  static String txt_floor_not_empty() {
    return english
        ? EngStrings.txt_floor_not_empty
        : ArbStrings.txt_floor_not_empty;
  }

  static String txt_flat_not_empty() {
    return english
        ? EngStrings.txt_flat_not_empty
        : ArbStrings.txt_flat_not_empty;
  }

  static String txt_delete_address() {
    return english
        ? EngStrings.txt_delete_address
        : ArbStrings.txt_delete_address;
  }

  static String txt_sure_delete_address() {
    return english
        ? EngStrings.txt_sure_delete_address
        : ArbStrings.txt_sure_delete_address;
  }

  static String txt_yes() {
    return english ? EngStrings.txt_yes : ArbStrings.txt_yes;
  }

  static String txt_no() {
    return english ? EngStrings.txt_no : ArbStrings.txt_no;
  }

  static String txt_out_of_delivery() {
    return english
        ? EngStrings.txt_out_of_delivery
        : ArbStrings.txt_out_of_delivery;
  }

  static String txt_not_currently_deliver_here() {
    return english
        ? EngStrings.txt_not_currently_deliver_here
        : ArbStrings.txt_not_currently_deliver_here;
  }

  static String txt_logout_bringi_app() {
    return english
        ? EngStrings.txt_logout_bringi_app
        : ArbStrings.txt_logout_bringi_app;
  }

  static String txt_success_create_account() {
    return english
        ? EngStrings.txt_success_create_account
        : ArbStrings.txt_success_create_account;
  }

  static String txt_goto_home() {
    return english ? EngStrings.txt_goto_home : ArbStrings.txt_goto_home;
  }

  static String txt_confirm_selected_address() {
    return english
        ? EngStrings.txt_confirm_selected_address
        : ArbStrings.txt_confirm_selected_address;
  }

  static String txt_alert() {
    return english ? EngStrings.txt_alert : ArbStrings.txt_alert;
  }

  static String txt_choose_default_address() {
    return english
        ? EngStrings.txt_choose_default_address
        : ArbStrings.txt_choose_default_address;
  }

  static String txt_save_selected_address() {
    return english
        ? EngStrings.txt_save_selected_address
        : ArbStrings.txt_save_selected_address;
  }

  static String txt_written_missed() {
    return english
        ? EngStrings.txt_written_missed
        : ArbStrings.txt_written_missed;
  }

  static String txt_my_orders() {
    return english ? EngStrings.txt_my_orders : ArbStrings.txt_my_orders;
  }

  static String txt_all_orders() {
    return english ? EngStrings.txt_all_orders : ArbStrings.txt_all_orders;
  }

  static String txt_orders() {
    return english ? EngStrings.txt_orders : ArbStrings.txt_orders;
  }

  static String txt_order() {
    return english ? EngStrings.txt_order : ArbStrings.txt_order;
  }

  static String txt_orders_filter() {
    return english
        ? EngStrings.txt_orders_filter
        : ArbStrings.txt_orders_filter;
  }

  static String txt_orders_Confirmed() {
    return english
        ? EngStrings.txt_orders_Confirmed
        : ArbStrings.txt_orders_Confirmed;
  }

  static String txt_orders_Expired() {
    return english
        ? EngStrings.txt_orders_Expired
        : ArbStrings.txt_orders_Expired;
  }

  static String txt_orders_Cancelled() {
    return english
        ? EngStrings.txt_orders_Cancelled
        : ArbStrings.txt_orders_Cancelled;
  }

  static String txt_orders_Not_Delivered() {
    return english
        ? EngStrings.txt_orders_Not_Delivered
        : ArbStrings.txt_orders_Not_Delivered;
  }

  static String txt_orders_New() {
    return english ? EngStrings.txt_orders_New : ArbStrings.txt_orders_New;
  }

  static String txt_orders_Delivered() {
    return english
        ? EngStrings.txt_orders_Delivered
        : ArbStrings.txt_orders_Delivered;
  }

  static String txt_orders_On_Delivery() {
    return english
        ? EngStrings.txt_orders_On_Delivery
        : ArbStrings.txt_orders_On_Delivery;
  }

  static String txt_orders_Rejected() {
    return english
        ? EngStrings.txt_orders_Rejected
        : ArbStrings.txt_orders_Rejected;
  }

  static String txt_cancel_order() {
    return english ? EngStrings.txt_cancel_order : ArbStrings.txt_cancel_order;
  }

  static String txt_orders_Confirm() {
    return english
        ? EngStrings.txt_orders_Confirm
        : ArbStrings.txt_orders_Confirm;
  }

  static String txt_canceled_by() {
    return english ? EngStrings.txt_canceled_by : ArbStrings.txt_canceled_by;
  }

  static String txt_customer() {
    return english ? EngStrings.txt_customer : ArbStrings.txt_customer;
  }

  static String txt_rejection_reason() {
    return english
        ? EngStrings.txt_rejection_reason
        : ArbStrings.txt_rejection_reason;
  }

  static String txt_media_not_available() {
    return english
        ? EngStrings.txt_media_not_available
        : ArbStrings.txt_media_not_available;
  }

  static String txt_have_complaint() {
    return english
        ? EngStrings.txt_have_complaint
        : ArbStrings.txt_have_complaint;
  }

  static String txt_contant_customer_service() {
    return english
        ? EngStrings.txt_contant_customer_service
        : ArbStrings.txt_contant_customer_service;
  }

  static String txt_you_want_cancel_order() {
    return english
        ? EngStrings.txt_you_want_cancel_order
        : ArbStrings.txt_you_want_cancel_order;
  }

  static String txt_order_cancel_success() {
    return english
        ? EngStrings.txt_order_cancel_success
        : ArbStrings.txt_order_cancel_success;
  }

  static String txt_default() {
    return english ? EngStrings.txt_default : ArbStrings.txt_default;
  }

  static String txt_your_message() {
    return english ? EngStrings.txt_your_message : ArbStrings.txt_your_message;
  }

  static String txt_send() {
    return english ? EngStrings.txt_send : ArbStrings.txt_send;
  }

  static String txt_choose_purpose() {
    return english
        ? EngStrings.txt_choose_purpose
        : ArbStrings.txt_choose_purpose;
  }

  static String txt_complain() {
    return english ? EngStrings.txt_complain : ArbStrings.txt_complain;
  }

  static String txt_enquiry() {
    return english ? EngStrings.txt_enquiry : ArbStrings.txt_enquiry;
  }

  static String txt_suggestion() {
    return english ? EngStrings.txt_suggestion : ArbStrings.txt_suggestion;
  }

  static String txt_message_not_empty() {
    return english
        ? EngStrings.txt_message_not_empty
        : ArbStrings.txt_message_not_empty;
  }

  static String txt_successfully_send() {
    return english
        ? EngStrings.txt_successfully_send
        : ArbStrings.txt_successfully_send;
  }

  static String txt_about_bringi() {
    return english ? EngStrings.txt_about_bringi : ArbStrings.txt_about_bringi;
  }

  static String txt_app_feedback() {
    return english ? EngStrings.txt_app_feedback : ArbStrings.txt_app_feedback;
  }

  static String txt_social_accounts() {
    return english
        ? EngStrings.txt_social_accounts
        : ArbStrings.txt_social_accounts;
  }

  static String txt_facebook() {
    return english ? EngStrings.txt_facebook : ArbStrings.txt_facebook;
  }

  static String txt_twitter() {
    return english ? EngStrings.txt_twitter : ArbStrings.txt_twitter;
  }

  static String txt_instagram() {
    return english ? EngStrings.txt_instagram : ArbStrings.txt_instagram;
  }

  static String txt_version() {
    return english ? EngStrings.txt_version : ArbStrings.txt_version;
  }
}
