package examples.pets;

import com.intuit.karate.junit5.Karate;

public class PetsRunner {
    @Karate.Test
    Karate karateGet(){return Karate.run("pets").relativeTo(getClass());}
}
