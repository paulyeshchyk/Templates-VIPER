[back to contents](https://github.com/paulyeshchyk/Templates-VIPER/blob/master/README.md)

## Overview
templates was build using [Generamba](https://github.com/rambler-ios/Generamba)

## Check Ruby version
Ruby 2.2 required
check Ruby's version by running command 

```
$ ruby --version
```

for case when Ruby was not installed please follow [Installing Ruby With RVM guide](http://octopress.org/docs/setup/rvm/)

### Install Generamba

Run the command 

```
$ gem install generamba
```

### Setup your project
## Pull templates repository. Run terminal, then execute set of commands
```
$ cd ~/Documents/projects
$ git clone https://github.com/paulyeshchyk/Templates-VIPER sampleTemplates
```

## Create a new project ("~/Documents/projects/NoName" folder was used)

![new project step 1](https://cloud.githubusercontent.com/assets/4526112/14106417/a91cd910-f5b9-11e5-9b06-b220f08705d8.png)
![new project step 2](https://cloud.githubusercontent.com/assets/4526112/14106418/a91d41ca-f5b9-11e5-9eca-7826128ef5ed.png)
![new project step 3](https://cloud.githubusercontent.com/assets/4526112/14106416/a91bc8c2-f5b9-11e5-9342-b10d3676c4f4.png)
![new project step 4](https://cloud.githubusercontent.com/assets/4526112/14106415/a8efafbc-f5b9-11e5-879a-9c1a11dc4fc7.png)

## In terminal change current directory to projects root
```
$ cd ~/Documents/projects/NoName
```
### Setup generamba
run ```$ generamba setup```. This command helps to create Rambafile that define all configuration needed to generate code. You can modify this file directly in future.
answer all questions asked by Generamba

```
The company name which will be used in the headers: EPAM
The name of your project is NoName. Do you want to use it? (yes/no) yes
The project prefix (if any): NN
The path to a .xcodeproj file of the project is 'NoName.xcodeproj'. Do you want to use it? (yes/no) yes
Select the appropriate target for adding your MODULES (type the index):
0. NoName
1. NoNameTests
2. NoNameUITests
0
Are you using unit-tests in this project? (yes/no) no
Do you want to use the same paths for your files both in Xcode and the filesystem? (yes/no) yes
The default path for creating new modules: Modules
Are you using Cocoapods? (yes/no) no
Are you using Carthage? (yes/no) no
```

as a result tableview will be provided
i.e.
```

+--------------------+------------------+
|      Summary for generamba setup      |
+--------------------+------------------+
| company            | EPAM             |
| project_name       | NoName           |
| prefix             | NN               |
| xcodeproj_path     | NoName.xcodeproj |
| project_target     | NoName           |
| project_file_path  | Modules          |
| project_group_path | Modules          |
+--------------------+------------------+

Rambafile successfully created! Now add some templates to the Rambafile and run `$ generamba template install`.
```
### Configure Generamba
To configure Generamba you can simply open file 'Rambafile' in you text editor

Find templates section and change it following way

was
```
### Templates
templates:
#- {name: local_template_name, local: 'absolute/file/path'}
#- {name: remote_template_name, git: 'https://github.com/igrekde/remote_template'}
#- {name: catalog_template_name}
```

become
```
### Templates
templates:
- {name: DetailModuleTemplate, local: '/Users/John_Doe/Documents/projects/sampleTemplates/templates/DetailModuleTemplate/'}
```

### Template installation
This step is very important. Every time you pulled templates from git you should run this command
```
$ generamba template install
```

### Create you own module using template
To create a new module using templates you should execute
```
$ generamba gen YourNewModule DetailModuleTemplate
```
where YourNewModule is your module classname

DetailModuleTemplate - template, used to create YourNewModule

for case when everything was fine you will see a table like this
```

+--------------------+----------------------+
|       Summary for gen YourNewModule       |
+--------------------+----------------------+
| company            | EPAM                 |
| project_name       | NoName               |
| xcodeproj_path     | NoName.xcodeproj     |
| prefix             | NN                   |
| project_target     | NoName               |
| project_file_path  | Modules              |
| project_group_path | Modules              |
| templates          | DetailModuleTemplate |
+--------------------+----------------------+

Creating code files...
Module successfully created!
Name: YourNewModule
Module file path: Modules/YourNewModule
Module group path: Modules/YourNewModule
```




