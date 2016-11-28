## Inversion of Control (IoC)

> Each object defines its dependencies only through constructor 
> arguments, arguments to a factory method, or properties that 
> are set on the object instance after it is constructed or 
> returned from a factory method.

Applications are built from objects that work together

An object depends on other objects

An object does not know how to construct or locate the objects it
depends on

When an object is created, its dependencies are **injected** to it


## Spring Framework

> Build enterprise-ready Java applications

* Beans
* Transactions
* JDBC
* ORM
* Web
* ...


## Beans

> Define building blocks

Beans are objects that are instantiated, assembled and managed by
a container

Bean definitions are recipes for creating beans

Containers look at recipes and create beans


## Configuration metadata

> Tell the container how to instantiate, configure and assemble 
> beans 

XML-based

```XML
<beans ...>
    <bean ...>
    </bean>
</beans>
```

Annotation-based

```java
@Component
...
```

Java-based

```java
@Configuration
...
```

## Bean scopes

Singleton (default): only one

Prototype: one per injection (or per `getBean()` invocation)

Request: one per HTTP request

Session: one per HTTP session


## @Configuration

Indicates that the class contains bean definitions

```java
@Configuration
public class AppConfig {

}
```


## @Bean

Indicates that the method instantiates, configures and initialises
a new object to be managed by the container

```java
@Configuration
public class AppConfig {

    @Bean
    public A a() {
        return new A();
    }

}
```


## @ComponentScan

Configures component scanning

```java
@Configuration
@ComponentScan(basePackages = "org.afdemp")
public class AppConfig  {
    ...
}
```


## @Component

Indicates that the class is a component

```java
@Component
public class A {
    ...
}
```


## @Repository

Indicates that the class is a repository (e.g. a DAO)

```java
@Repository
public class A {
    ...
}
```

## @Service

Indicates that the class is a service

```java
@Service
public class A {
    ...
}
```


## @Autowired

Marks a constructor, a field, a setter method or a config method 
as to be autowired


```java
@Component
public class A {

    ...
    @Autowired
    private B b;
    ...
    
}
```

* By name
* By name
* Constructor


## @Scope

Indicates the scope to use for the bean

```java
@Component
@Scope("prototype")
public class A {

    ...
  
}
```


## Spring MVC

> Build web applications

The DispatcherServlet dispatches requests to handlers


## @EnableWebMvc


## @Controller

Indicates that the class is a controller

```java
@Controller
public class AController {
    ...
}
```


## @RequestMapping

Maps web requests onto specific handler classes and/or handler 
methods

```java
@Controller
@RequestMapping("/a")
public class AController {
    
    @RequestMapping(path = "/b", method = RequestMethod.GET)
    public ... b() {
        ...
    }

}
```

## @RequestParam

Indicates that the method parameter should be bound to a web 
request parameter

```java
@Controller
public class AController {
    
    @RequestMapping(path = "/b", method = RequestMethod.GET)
    public ... b(@RequestParam("x") String x) {
        ...
    }

}
```


## @RequestHeader

Indicates that the method parameter should be bound to a web 
request header

```java
@Controller
public class AController {
    
    @RequestMapping(path = "/b", method = RequestMethod.GET)
    public ... b(@RequestHeader("Accept-Encoding") String encoding) {
        ...
    }

}
```

## @PathVariable

Indicates that the method parameter should be bound to a URI 
template variable

```java
@Controller
public class AController {
    
    @RequestMapping(path = "/b/{c}", method = RequestMethod.GET)
    public ... b(@PathVariable String c) {
        ...
    }

}
```

## @ResponseBody

Indicates that the method return value should be bound to the web
response body

```java
@Controller
public class AController {
    
    @RequestMapping(path = "/b", method = RequestMethod.GET)
    @ResponseBody
    public String b() {
        return "B";
    }

}
```


## @RestController

Indicates that the controller implements a REST API, thus serving
only JSON, XML or custom MediaType content

@Controller + @ResponseBody

```java
@RestController
public class AController {
    
    @RequestMapping(path = "/b", method = RequestMethod.GET)
    public String b() {
        return "B";
    }

}
```


## Spring Boot

> Create standalone, production-grade Spring-based applications 
> with minimum fuss

Minimise configuration

Embed the servlet container (Tomcat, Jetty, Undertow)


## Spring Initializr

> Generate basic projects that use Spring Boot

Deployed @ https://start.spring.io

Can be accessed with web browsers (e.g. Google Chrome), through 
IDEs (e.g. STS), or from the command-line (e.g. cURL)

Source code available @ https://github.com/spring-io/initializr
