// ignore_for_file: unused_field, prefer_const_declarations, unused_local_variable

import 'package:g_sheets/model/transcation_model.dart';
import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';

class GSheetServices {
  //credentials
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "flutter-gsheet-379405",
  "private_key_id": "66aa7070def19503d431c14ee1ff9d58514c2ddc",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC7tGg/QHRfFMmN\nBH0VYxdnl/cCyXYY4pI6kSL2MJzaFcXVKMxxHLkB9VM8X8vqiiFlniix8u0Pd4Kb\nBukGwfHf9J82Og/iiGOARZ+G2BNAeAsR6Z+gdCY1D/MeafGyiFgvfCkyahISTxo8\nnH1RmIkgLBqmqlzLNmGnoA8lZ4g4E21vt9XTMZ4g6V82ALR8qqFrg/A602HXr+3i\nEP25L/7MaTuVDnPnjPEjetT6/EUiK6oN3uVJIBwzn47p+4XebGjJynyuSOpbepJ3\njnPVvbTnN/TUqX9qbOf285LpxbHxHUe7VGHrlnTwKwb388NcPmV/0F+OjCm81h7O\nEv+nqYbNAgMBAAECggEANBIhgz55qfDF0uFmY7r4AKx3ASZrJQ8heq7NkJc+w/8b\nQP1O7agGqMTqIMsAciF8j0iXSHo4CjzgleoOVeoSk8q0KiJkSrcER07JKOqjOJS0\nmXUCa8wc10aD7rF8M8dAE3gxo4MqXTrlb+AHoc2baLnjcM287UC6SXqNCRbWApvi\nppRYHmsKXQHnH5Hk/6MfcFXdVZ8ld6mIBISgaxpseOhSIBH1cCpWIE6utS2kuD6p\nH+plsQ4SWpKlTgs5DEyYmRolA7Mc1ffEm/YXYunSBWUo7kcwq6NTtM7WvAhc1VIW\nY5JQsGaKgILpxO5Dym+7rq7pIECUv6zdMKV0CBJO/wKBgQD2BwSctOfUEMIysYs+\nqgx+odRMMj/bdPQcnTUwm29nYcrODVF33Q54ZyqK8rj5/BiklIcSfHuxN5NbEbpe\n+NpOdKBFH79hSDhT51CBZ8PIRSyi9VAzbVW9KJiSPFKxx4BJlNTj8Slkolm15r2+\nFs2tDFKDLhTiJMpOAZQlDvxRnwKBgQDDUC9jA0Acl16LsQD+wpzo5r67tDIufNNo\nXVuH9DyUsbW12hU1hJnMfMv9oXA01sO/QDkceNI+8bK4J4Xxh4WEEHQByJdtBlLq\nTKSpw7EKumbeuczReNsM7JugfB8914Wi7mkSSmOPdHFtkcUvrjIbilugIsuRkm7r\ndDvRlY2IEwKBgAzyl5qLpruxWhcC4vocRuYPLDYKWvP4trQezeLN+1HsgpjPeJ8f\nQhiyDTocxgFZ9A4NRwKBDJ1p+FZNm4pN/GcumhSpNBAxlc1Mmh8FT/dlNJEq6dqb\nAW0gCs9/Xza98hFtRLruQShrpt780rWDS7W0tU70CONR3le2m45LuJmvAoGBALvZ\nzonjoXEeYW/nwXZGRdZ3wDEWwkEWC9tQF23uianWNlf+tfFwZOBZk3WRJTOc8E5s\n/cEVr9mca/FVCi3g05jOnlTs0j+pGmyBZMpnDkusNq63c3hxTfXjSFeVqhK3zK+F\nsIdIBvP94e6pikcuusDkVPXzIWoUthw+Ah61QZgDAoGBALsXKvTZRt0zEFzzSu69\nGD6NgxTaBQwUT9f+pYDXMmkVrMruEzymKGetv2wgEhLS4ShyQBo8bB4VQaZEPR+j\n0D9iC00K6KlX37rYBmd1ujYWqRHkuiE4r/nJSVGx+K5jQAPtOAi9s069hn43slZT\ns8GLDtmb41to94udXrShpg62\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-gsheets@flutter-gsheet-379405.iam.gserviceaccount.com",
  "client_id": "116171468425357524294",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-gsheets%40flutter-gsheet-379405.iam.gserviceaccount.com"
}
''';
//Spreadsheet id
  static final spreedSheetId = '1qwc5EWcpJbsGQO_CV5y-FmQhB5Jhf0fe-GWZvpEDHyM';

  //init Gsheet
  static final gSheets = GSheets(_credentials);

  //initate worksheet
  static Worksheet? workSheet;

//list for storing Transcations
  static RxList<TranscationModel> transcationData = <TranscationModel>[].obs;

  //count  numberofTransctions
  static var numberOfTransaction = 0.obs;

  //variable for totalincom and expance
  static var totalincome = 0.0.obs;
  static var totalexpance = 0.0.obs;
  static var balance = 0.0.obs;

/*Initial Function Which must 
when app Start*/
  static Future<void> init() async {
    //give id of spreadsheet id
    var ss = await gSheets.spreadsheet(spreedSheetId);
    //initial worksheet
    workSheet = ss.worksheetByTitle('worksheet1');

    //Counts Row
    countTranscation();
  }

  static countTranscation() async {
    while ((await workSheet!.values
            .value(column: 1, row: numberOfTransaction.value + 1) !=
        '')) {
      numberOfTransaction++;
    }
    //load Notes
    loadNotes();
  }

//Load Data
  static loadNotes() async {
    if (workSheet == null) return;
    for (int i = 0; i < numberOfTransaction.value; i++) {
      final String transcationName =
          await workSheet!.values.value(column: 1, row: i + 1);
      final transcationAmount =
          await workSheet!.values.value(column: 2, row: i + 1);
      final String transcationType =
          await workSheet!.values.value(column: 3, row: i + 1);
      if (transcationData.length < numberOfTransaction.value) {
        if (i == 0) {
          continue;
        } else {
          transcationData.add(
            TranscationModel(
              transcationName: transcationName,
              transcationAmount: transcationAmount,
              transcationType: transcationType,
            ),
          );
        }
      }
    }
    totalExpance();
    totalIncome();
    balance.value = totalexpance.value - totalincome.value;
  }

//Insert Data
  static Future<bool> insert(
    String transcationName,
    String transcationAmount,
    String transcationType,
  ) async {
    if (workSheet == null) {
      return false;
    }
    numberOfTransaction++;
    transcationData.add(TranscationModel(
      transcationName: transcationName,
      transcationAmount: transcationAmount,
      transcationType: transcationType,
    ));
    var isInsert = await workSheet!.values
        .appendRow([
          transcationName,
          transcationAmount,
          transcationType,
        ])
        .then((value) => true)
        .catchError((e) => false);
    return isInsert;
  }

  //Total Income
  static void totalIncome() {
    for (int i = 0; i < transcationData.length; i++) {
      if (i == 0) {
        continue;
      } else {
        if (transcationData[i].transcationType == 'income') {
          totalincome.value +=
              double.parse(transcationData[i].transcationAmount);
        }
      }
    }
  }

  //Total Expance
  static void totalExpance() {
    for (int i = 0; i < transcationData.length; i++) {
      if (i == 0) {
        continue;
      } else {
        if (transcationData[i].transcationType == 'expance') {
          totalexpance.value +=
              double.parse(transcationData[i].transcationAmount);
        }
      }
    }
  }
//Update Data
//   static update(int index, int isTaskComplete) async {
//     workSheet!.values.insertValue(isTaskComplete, column: 2, row: index + 1);
//   }
}
