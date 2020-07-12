class Config {
  
  static final environment = 'PROD';

  static String url() {

    if (environment == 'DEV') {

      return "http://10.0.2.2:8080/";

    } else {

      return "http://ec2-107-21-31-185.compute-1.amazonaws.com:8080/";
    }
  }
}