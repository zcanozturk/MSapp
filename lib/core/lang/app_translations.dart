abstract class AppTranslation {
  static Map<String, Map<String, String>> translationKeys = {
    "en_US": enUS,
    "tr_TR": trTR,
  };
}

final Map<String, String> enUS = {
  'hello': 'Welcome !',
  'emptyInputMessage':'Please fill the blanks.',
  'usernameInput':'USERNAME',
  'passwordInput':'PASSWORD',
  'loginTitle':'LOGIN'
};

final Map<String, String> trTR = {
  'hello': 'Hoşgeldiniz !',
  'emptyInputMessage':'Boş alanları doldurunuz.',
  'usernameInput':'Kullanıcı Adı',
  'passwordInput':'PASSWORD',
  'loginTitle':'GİRİŞ'

};
