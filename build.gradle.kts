plugins {
    "java"
    id("software.amazon.smithy").version("0.5.2")
}

repositories {
    mavenLocal()
    mavenCentral()
}

dependencies {
        implementation("software.amazon.smithy:smithy-model:[1.0, 2.0[")
        implementation("software.amazon.smithy:smithy-aws-traits:[1.0, 2.0[")
        implementation("software.amazon.smithy:smithy-aws-apigateway-traits:[1.0, 2.0[")
}

buildscript {
    repositories { 
        mavenCentral()
    }
    dependencies {        
        classpath("software.amazon.smithy:smithy-openapi:1.5.1")
        classpath("software.amazon.smithy:smithy-aws-apigateway-openapi:1.6.1")
        classpath("software.amazon.smithy:smithy-aws-traits:1.5.1")
    }
}
