filegroup(
    name = "gradlew",
    srcs= ["gradlew"] + glob(["gradle/**/*"]),
    visibility = ["PUBLIC"]
)

filegroup(
    name = "smithy_config",
    srcs = ["smithy-build.json"] + glob(["model/*"]),
    visibility = ["PUBLIC"]
)

genrule(
    name = "leagueRecommender",
    srcs = [":gradlew", ":smithy_config", "build.gradle.kts"],
    deps = [],
    cmd = "./gradlew build --build-file build.gradle.kts",
    outs = ["build"],
)