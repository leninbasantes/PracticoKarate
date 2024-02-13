package examples.pets;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration; // Importación corregida
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;


public class ManagementTest {
    @Test
    void testParallel(){
        Results results = Runner.path("classpath:pets")
                .outputCucumberJson(true)
                .tags("~@ignore").parallel(4);
        generateReport(results.getReportDir());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));

        File reportOutputDirectory = new File("target"); // Asegúrate de tener este directorio
        String buildNumber = "1"; // Ajusta según sea necesario
        String projectName = "demo";
        Configuration config = new Configuration(reportOutputDirectory, projectName);
        config.setBuildNumber(buildNumber); // Opcional: establece el número de build

        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
