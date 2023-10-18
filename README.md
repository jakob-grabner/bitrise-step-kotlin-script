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
## How to contribute to this Step

1. Fork this repository
2. `git clone` it
3. Create a branch you'll work on
4. To use/test the step just follow the **How to use this Step** section
5. Do the changes you want to
6. Run/test the step before sending your contribution
  * You can also test the step in your `bitrise` project, either on your Mac or on [bitrise.io](https://www.bitrise.io)
  * You just have to replace the step ID in your project's `bitrise.yml` with either a relative path, or with a git URL format
  * (relative) path format: instead of `- original-step-id:` use `- path::./relative/path/of/script/on/your/Mac:`
  * direct git URL format: instead of `- original-step-id:` use `- git::https://github.com/user/step.git@branch:`
  * You can find more example of alternative step referencing at: https://github.com/bitrise-io/bitrise/blob/master/_examples/tutorials/steps-and-workflows/bitrise.yml
7. Once you're done just commit your changes & create a Pull Request


## Share your own Step

You can share your Step or step version with the [bitrise CLI](https://github.com/bitrise-io/bitrise). If you use the `bitrise.yml` included in this repository, all you have to do is:

1. In your Terminal / Command Line `cd` into this directory (where the `bitrise.yml` of the step is located)
2. Run: `bitrise run test` to test the step
3. Run: `bitrise run audit-this-step` to audit the `step.yml`
4. Check the `share-this-step` workflow in the `bitrise.yml`, and fill out the
   `envs` if you haven't done so already (don't forget to bump the version number if this is an update
   of your step!)
5. Then run: `bitrise run share-this-step` to share the step (version) you specified in the `envs`
6. Send the Pull Request, as described in the logs of `bitrise run share-this-step`