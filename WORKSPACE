load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

#######################
# Setup OpenApi tools
#######################
OPENAPI_GEN_VERSION = "0.1.5"

OPENAPI_GEN_SHA = "2daea1c94d6f101b4771ab3a82ef556ab1afb1669b135670b18000035ad8b60c"

http_archive(
    name = "openapi_tools_generator_bazel",
    sha256 = OPENAPI_GEN_SHA,
    url = "https://github.com/mellemahp/openapi-generator-bazel/releases/download/%s/openapi-tools-generator-bazel-%s.tar.gz" % (OPENAPI_GEN_VERSION, OPENAPI_GEN_VERSION),
)

load("@openapi_tools_generator_bazel//:defs.bzl", "openapi_tools_generator_bazel_repositories")

openapi_tools_generator_bazel_repositories()

#######################
# Setup Smithy Rules
#######################
SMITHY_RULES_TAG = "1.0.1"

SMITHY_RULES_SHA = "af438b7815c89156696c4097619f1b94a49090f8ea93808eef4f1e06f8187f8c"

http_archive(
    name = "smithy_rules",
    url = "https://github.com/mellemahp/smithy-bazel-rules/releases/download/%s/release.tar.gz" % SMITHY_RULES_TAG,
)

load("@smithy_rules//smithy:deps.bzl", "smithy_cli_init")

smithy_cli_init()

###############################################################
# Add maven support to bring in additional smithy requirements
###############################################################

# import libraries from maven
RULES_JVM_EXTERNAL_TAG = "2.8"

RULES_JVM_EXTERNAL_SHA = "79c9850690d7614ecdb72d68394f994fef7534b292c4867ce5e7dec0aa7bdfad"

http_archive(
    name = "rules_jvm_external",
    sha256 = RULES_JVM_EXTERNAL_SHA,
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    artifacts = [
        "software.amazon.smithy:smithy-aws-apigateway-traits:1.14.1",
    ],
    repositories = [
        "https://repo1.maven.org/maven2",
    ],
)
