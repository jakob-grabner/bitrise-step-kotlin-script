# Kotlin Script

Step to execute kotlin script.

The step allows to execute arbitrary kotlin code. It is also possible to use external dependencies.

## How to use this Step

```yml
    - git::https://github.com/jakob-grabner/bitrise-step-kotlin-script.git@main:
        title: Kotlin Script
        inputs:
        - kotlin_script: |-
            @file:Repository("https://repo.maven.apache.org/maven2/") // define a repository if you need dependencies

            @file:DependsOn("com.google.code.gson:gson:2.10.1") // Add dependencies

            import com.google.gson.Gson

            data class Greeting(val greeting: String)

            val jsonString = Gson().toJson(Greeting("Hello World!"))
            println(jsonString)
            
```