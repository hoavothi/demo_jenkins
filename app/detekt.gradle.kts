//task<io.gitlab.arturbosch.detekt.Detekt>("detektFailFast") {
//    description = "Runs a failfast detekt build."
//
//    input = files("src/main/kotlin", "src/test/kotlin")
//    config = files("$rootDir/config.yml")
//    debug = true
//    reports {
//        xml {
//            destination = file("build/reports/failfast.xml")
//        }
//        html.destination = file("build/reports/failfast.html")
//    }
//    include("**/*.kt")
//    include("**/*.kts")
//    exclude("resources/")
//    exclude("build/")
//}
