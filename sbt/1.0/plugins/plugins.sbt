
resolvers += 
  "Sonatype releases" at "https://oss.sonatype.org/content/repositories/releases"

addSbtPlugin("org.ensime" %% "sbt-ensime" % "2.2.1")

addSbtPlugin("no.arktekk.sbt" % "aether-deploy" % "0.21")
// addSbtPlugin("com.github.saurfang" % "sbt-spark-submit" % "0.0.4")

addSbtPlugin("com.eed3si9n" % "sbt-assembly" % "0.14.6")

// addSbtPlugin("ch.epfl.scala" % "sbt-scalafix" % "0.5.7")
// https://scalacenter.github.io/scalafix/docs/users/installation
