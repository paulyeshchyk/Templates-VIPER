
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

1. Create a new project
![new project step 1](https://cloud.githubusercontent.com/assets/4526112/14106417/a91cd910-f5b9-11e5-9b06-b220f08705d8.png)
![new project step 2](https://cloud.githubusercontent.com/assets/4526112/14106418/a91d41ca-f5b9-11e5-9eca-7826128ef5ed.png)
![new project step 3](https://cloud.githubusercontent.com/assets/4526112/14106416/a91bc8c2-f5b9-11e5-9342-b10d3676c4f4.png)
![new project step 4](https://cloud.githubusercontent.com/assets/4526112/14106415/a8efafbc-f5b9-11e5-879a-9c1a11dc4fc7.png)



1. Run ```generamba setup``` in the project root folder. This command helps to create Rambafile that define all configuration needed to generate code. You can modify this file directly in future.
2. Add all templates planned to use in the project to the generated Rambafile. You can begin with one of the templates from our catalog: {name: 'rviper_controller'}.
3. Run ```generamba template install```. All the templates will be placed in the '/Templates' folder of your current project.
4. Run ```generamba gen [MODULE_NAME] [TEMPLATE_NAME]``` It creates module with specific name from specific template. To create DetailModule using template run ```generamba gen SimpleDetailModule DetailModuleTemplate```




