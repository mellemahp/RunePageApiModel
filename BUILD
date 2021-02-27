package(default_visibility = ["//visibility:public"])

filegroup(
    name = "gradle",
    srcs = ["gradlew"],
    visibility = ["//visibility:public"]
)

filegroup(
    name = "gradle_config",
    srcs = ["build.gradle.kts", "settings.gradle"]
            + glob(["gradle/**/*"]),
    visibility = ["//visibility:public"]
)

filegroup(
    name = "smithy_config",
    srcs = ["smithy-build.json"] 
            + glob(["model/*"]),
    visibility = ["//visibility:public"]
)

genrule(
    name = "smithy_gen-openapi",
    srcs = [],
    cmd = """
     ./$(location gradle) -p $$(dirname ./$(location gradle)) build && 
     cp -R $$(dirname ./$(location gradle))/build/smithyprojections/RunePageApiModel/source/openapi/RecommenderService.openapi.json $(@D)
    """,
    outs = ["RecommenderService.openapi.json"],
    message = "Generating Jar file and projections from Smithy Model",
    tools = [":gradle"] + [":gradle_config"] + [":smithy_config"],
    visibility = ["//visibility:public"]
)

genrule(
    name="codegen_cli",
    srcs=[],
    cmd="""
    wget https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/5.0.1/openapi-generator-cli-5.0.1.jar -O $@
    """,
    outs=["openapi-generator-cli.jar"],
    visibility = ["//visibility:public"]
)

genrule(
    name = "smithy-model-java",
    cmd = """
    java -jar $(location codegen_cli) generate \
        -i $(location smithy_gen-openapi) \
        -g java \
        -o java-model-build-files && \
    ./$(location gradle) -p java-model-build-files build &&
    cp java-model-build-files/build/libs/openapi-java-client-2006-03-01.jar $@
    """,
    outs = ["runePageModel.jar"],
    message = "Generating files for building Java library",
    srcs = [":codegen_cli", ":smithy_gen-openapi"],
    tools = [":gradle"],
    visibility = ["//visibility:public"]
)

genrule(
    name = "generate_client-javascript",
    cmd = """
    java -jar $(location codegen_cli) generate \
        -i $(location smithy_gen-openapi) \
        -g javascript \
        -o $@
    """,
    outs = ["go_client"],
    message = "Building Javascript Client",
    srcs = [":codegen_cli", ":smithy_gen-openapi"],
    visibility = ["//visibility:public"]
)

