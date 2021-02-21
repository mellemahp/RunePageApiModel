plugins {
    "java"
    id("software.amazon.smithy").version("0.5.2")
}

repositories {
    mavenLocal()
    mavenCentral()
}

dependencies {
    implementation("software.amazon.smithy:smithy-model:1.5.1")
    implementation("software.amazon.smithy:smithy-aws-traits:1.5.1")
}

buildscript {
    dependencies {
        classpath("software.amazon.smithy:smithy-openapi:1.5.1")
        classpath("software.amazon.smithy:smithy-aws-traits:1.5.1")
    }
}