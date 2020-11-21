class Config {
  
  static final String environment = 'PROD';

  static String url() {

    if (environment == 'DEV') {

      return "http://10.0.2.2:8080/";

    } else {

      return "http://ec2-3-80-243-186.compute-1.amazonaws.com:8080/";
    }
  }

  static final bool guestMode = false;

  static final String guestUser = "guest";

  static final String guestPassword = "guest";

  static final String guestToken = "hello_muser";
}