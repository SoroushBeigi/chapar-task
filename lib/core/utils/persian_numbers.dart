class PersianNumbers{

  static String convertEnToFa(String out){
    out =  out.replaceAll('0','۰');
    out =  out.replaceAll('1','۱');
    out =  out.replaceAll('2','۲');
    out =  out.replaceAll('3','۳');
    out =  out.replaceAll('4','۴');
    out =  out.replaceAll('5','۵');
    out =  out.replaceAll('6','۶');
    out =  out.replaceAll('7','۷');
    out =  out.replaceAll('8','۸');
    out =  out.replaceAll('9','۹');
    return out;
  }

  static String convertFaToEn(String out){
    out =  out.replaceAll('۰','0');
    out =  out.replaceAll('۱','1');
    out =  out.replaceAll('۲','2');
    out =  out.replaceAll('۳','3');
    out =  out.replaceAll('۴','4');
    out =  out.replaceAll('۵','5');
    out =  out.replaceAll('۶','6');
    out =  out.replaceAll('۷','7');
    out =  out.replaceAll('۸','8');
    out =  out.replaceAll('۹','9');
    return out;
  }

}