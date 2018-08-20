cancelable in Global := true

// http://ammonite.io/

// libraryDependencies += "com.lihaoyi" % "ammonite" % "1.0.3" % "test" cross CrossVersion.full

// sourceGenerators in Test += Def.task {
//   val file = (sourceManaged in Test).value / "amm.scala"
//   IO.write(file, """object amm extends App { ammonite.Main.main(args) }""")
//   Seq(file)
// }.taskValue

// (fullClasspath in Test) ++= {
//   (updateClassifiers in Test).value
//     .configurations
//     .find(_.configuration == Test.name)
//     .get
//     .modules
//     .flatMap(_.artifacts)
//     .collect{case (a, f) if a.classifier == Some("sources") => f}
// }
