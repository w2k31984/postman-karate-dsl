function fn() {
  var config = {
    mainUrl: "https://dummyjson.com/auth/"
  }


  const result = karate.callSingle('classpath:dummyjson/Login.feature')
  config.auth = {Authorization: 'Bearer ' + result.token }

  return config;
}

