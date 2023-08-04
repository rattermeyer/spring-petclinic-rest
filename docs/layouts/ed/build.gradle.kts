import com.github.gradle.node.npm.task.NpmTask

plugins {
  id("com.github.node-gradle.node")
}

node {
  download.set(true)
  version.set("18.16.0")
}

tasks.register<NpmTask>("build", NpmTask::class.java) {
  inputs.dir(file("src"))
  dependsOn("npmInstall")
  args.set(listOf("run", "build"))
  outputs.file("${projectDir}/build/ui-bundle.zip")
}
