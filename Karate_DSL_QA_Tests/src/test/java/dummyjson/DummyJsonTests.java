package dummyjson;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class DummyJsonTests {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:dummyjson") //cambiamos por el nombre del package
                //.outputCucumberJson(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
