package(default_visibility = ["//visibility:public"])

load("@smithy_rules//smithy:smithy.bzl", "smithy_java_models")

filegroup(
    name = "model_files",
    srcs = [] + glob(["model/*"]),
)

SERVICE_NAME = "RecommenderService"

smithy_java_models(
    name = "api_model_files",
    srcs = [":model_files"],
    config = "smithy-build.json",
    model_namespace = "league.runePage",
    projection = "model",
    service_name = SERVICE_NAME,
    deps = [
        "@maven//:software_amazon_smithy_smithy_aws_apigateway_traits",
    ],
)
