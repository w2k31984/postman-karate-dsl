package dummyjson.auth;

import com.intuit.karate.junit5.Karate;

class authRunner {
    
    @Karate.Test
    Karate testAuth() {
        return Karate.run("auth").relativeTo(getClass());
    }    

}
