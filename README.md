
# Overview
templates was build using [Generamba](https://github.com/rambler-ios/Generamba)



## Check Ruby version
Ruby 2.2 required
check Ruby's version by running command 
```
$ ruby --version
```

for case when Ruby was not installed please follow [Installing Ruby With RVM guide](http://octopress.org/docs/setup/rvm/)

## Install Generamba

Run the command 

```gem install generamba```

## Setup your project

1. Run ```generamba setup``` in the project root folder. This command helps to create Rambafile that define all configuration needed to generate code. You can modify this file directly in future.
2. Add all templates planned to use in the project to the generated Rambafile. You can begin with one of the templates from our catalog: {name: 'rviper_controller'}.
3. Run ```generamba template install```. All the templates will be placed in the '/Templates' folder of your current project.
4. Run ```generamba gen [MODULE_NAME] [TEMPLATE_NAME]``` It creates module with specific name from specific template. To create DetailModule using template run ```generamba gen SimpleDetailModule DetailModuleTemplate```




