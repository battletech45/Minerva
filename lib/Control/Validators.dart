class Validators{
  /*
  static String? validateEmail(String? value){
    if(value!.trim().isEmpty){
      return "Field cannot be empty";
    }
    return null;
  } */
  static String? validatePassword(String? value){
    if(value!.trim().isEmpty){
      return "Please provide a password";
    }
    if(value.length<6){
       return "Password has minimum 7 characters";
    }
    return null;
  }
  static String? checkEmptyFields(String? value){
     if(value!.trim().isEmpty){
      return "This field cannot be empty";
    }
    return null;
  }
  static String? checkTC(String? value){

    if(value?.length != 11){
      return "TC should have 11 characters";
    }
    return null;
  }
}