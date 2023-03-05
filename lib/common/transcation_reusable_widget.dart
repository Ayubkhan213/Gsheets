// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

//Height
Widget ph(double height) {
  return SizedBox(
    height: height,
  );
}

//width
Widget pw(double width) {
  return SizedBox(
    width: width,
  );
}

//Input TextField
Widget inputField({
  required String hintText,
  obscureText,
  controller,
  validation,
  save,
  suffix,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
    child: TextFormField(
      style: TextStyle(color: Colors.grey.shade600),
      controller: controller,
      validator: validation,
      onSaved: save,
      decoration: InputDecoration(
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.grey[100],
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
      ),
      obscureText: obscureText ?? false,
    ),
  );
}

//Text
Widget text({
  required String txt,
  double? size,
  weight,
  alignmant,
  color,
}) {
  return Text(
    txt,
    style: TextStyle(
      color: color,
      fontSize: size,
      fontWeight: weight,
    ),
    textAlign: alignmant,
  );
}

//Expence INCOM Record
Widget inconEcpanceRecord({
  required String title,
  required double amount,
  required IconData arrow,
  required iconColor,
}) {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Icon(
          arrow,
          size: 25.0,
          color: iconColor,
        ),
      ),
      pw(5.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text(
            txt: title,
            size: 18.0,
            color: Colors.grey.shade500,
          ),
          text(
            txt: '\$${amount.toString()}',
            size: 14.0,
            color: Colors.grey.shade800,
          ),
        ],
      ),
    ],
  );
}

//Transcations
Widget transcations({
  money,
  transcationName,
  expanceorincom,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 50.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: text(
                    txt: '\$',
                    size: 18.0,
                    color: Colors.white,
                  ),
                ),
                pw(5.0),
                text(txt: transcationName),
              ],
            ),
            text(
              txt: (expanceorincom == 'income' ? '+' : '-') +
                  '\$' +
                  money.toString(),
              color: expanceorincom == 'expance'
                  ? Colors.redAccent
                  : Colors.greenAccent,
            ),
          ],
        ),
      ),
    ),
  );
}





//Stickybox
// Widget stickyBox({
//   required txt,
// }) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         color: Colors.pinkAccent,
//       ),
//       child: Center(
//         child: text(
//           txt: txt,
//         ),
//       ),
//     ),
//   );
// }

