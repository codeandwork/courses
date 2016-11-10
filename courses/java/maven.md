## The problems

> *"I want to structure my project in a way that is independent of the IDE I (or others) use."*

> *"I want to have an easy way to package and deploy my project on Tomcat."*

> *"I want to be able to manage the dependencies of my project in a less messy way."*


## The tool

[Apache Maven](https://maven.apache.org) is a tool to manage Java 
projects.

There are similar tools both for Java and for other programming 
languages.

* Gradle
* Apache Ant + Apache Ivy
* SBT
* npm
* bower
* pip
* ...


## The projects

Each Maven project has a **group ID** and an **artifact ID**.

**Group ID**: follows package naming rules

E.g. `org.afdemp`

**Artifact ID**: contains lowercase letters and no strange symbols

E.g. `coding-bootcamp`

A project is **uniquely identified** by the combination of its group 
and artifact ID.


## The POM

The `pom.xml` file resides in the root directory of the project.

It is the main (and, in most cases, the only) **configuration file** for the project.

It is an **XML file**.

```XML
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">

  <modelVersion>4.0.0</modelVersion>

  <groupId>org.afdemp</groupId>
  <artifactId>coding-bootcamp</artifactId>
  <version>1.0.0</version>

  <packaging>jar</packaging>

  <name>Coding bootcamp</name>
  <description>The project for the 1st coding bootcamp.</description>
  
  <dependencies>
  ...
  </dependencies>
  
  <build>
  ...
  </build>
  
</project>
```


## The structure

All Maven projects are expected to have the following **directory layout**.

`src/main/java`: the application sources

`src/main/resources`: the application resources

`src/main/webapp`:the  web application sources

`src/test/java`: the test sources

`src/test/resources`: the test resources


## The dependencies

Dependencies are listed in the `<dependencies>` element.

**Group ID**, **artifact ID** and **version** must be specified for all dependencies.

```XML
<dependencies>
  ...
  <dependency>
    <groupId>commons-io</groupId>
    <artifactId>commons-io</artifactId>
    <version>2.5</version>
  </dependency>
  ...
</dependencies>
```

## The build process

The `<build>` element contains most build settings.

The final name of the packaged project.

```XML
<build>
  ...
  <finalName>coding-bootcamp</finalName>
  ...
</build>
```

The version of the Java compiler.

```XML
<build>
  ...
  <plugins>
    <plugin>
      <groupId>org.apache.maven.plugins</groupId>
      <artifactId>maven-compiler-plugin</artifactId>
      <version>3.2</version>
      <configuration>
        <source>1.8</source>
        <target>1.8</target>
      </configuration>
    </plugin>
  </plugins>
  ...
</build>
```


## The phases

The **build lifecycle** is made of **phases**.

`compile`: compile the sources

`test`: run the tests

`package`: package the compiled code in its distributable format (e.g. JAR)

`install`: install the package into the local repository

`clean`: clean up after previous builds


## Hello Maven

`hello-maven/pom.xml`

```XML
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>hellos</groupId>
  <artifactId>hello-maven</artifactId>

  <version>1.0.0</version>

  <name>Hello Maven</name>
  <description>Says hello to Maven.</description>

  <packaging>jar</packaging>

  <build>
    <plugins>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.2</version>
        <configuration>
          <source>1.8</source>
          <target>1.8</target>
        </configuration>
      </plugin>
     </plugins>
  </build>

</project>
```


## Hello Maven

`hello-maven/src/main/java/hellos/HelloMaven.java`

```java
package hellos;

public class HelloMaven {
  public static void main(String...args) {
    System.out.println("Hello Maven!");
  }
}
```

## Say hello to Maven

```
$ mvn clean package

$ java -cp target/hello-maven-1.0.0.jar hellos.HelloMaven
```


## Hello Web

`pom.xml`

```XML
?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">

  <modelVersion>4.0.0</modelVersion>

  <groupId>hellos</groupId>
  <artifactId>hello-web</artifactId>

  <version>1.0.0</version>

  <name>Hello Web</name>
  <description>Says hello to the Web.</description>

  <packaging>war</packaging>

  <dependencies>
    <dependency>
      <groupId>javax.servlet</groupId>
      <artifactId>servlet-api</artifactId>
      <version>2.5</version>
    </dependency>
  </dependencies>

  <build>
    <finalName>hello-web</finalName>
  </build>
 
</project>
```


## Hello Web

`src/main/webapp/index.html`

```HTML
<html>
  <head>
    <title>Hello Web!</title>
  </head>
  <body>
    <p>Hello Web!</p>
  </body>
</html>
```


## Hello Web

`src/main/webapp/WEB-INF/web.xml`

```XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE web-app
  PUBLIC "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
  "http://java.sun.com/dtd/web-app_2_3.dtd">
<web-app>
  <welcome-file-list>
    <welcome-file>index.html</welcome-file>
  </welcome-file-list>
</web-app>   
```


## Say hello to the Web

```
$ mvn clean package

$ cp target/hello-web.war $CATALINA_HOME/webapps/

$ $CATALINA_HOME/bin/catalina.sh run

```


## Exercise

Write a Java application that receives a number as a command-line 
argument, and prints whether that number is prime or not.

Use Apache Maven.

Use [Apache Commons Math Library](http://commons.apache.org/proper/commons-math/).
