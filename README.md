# โจ todo_clean_solid โจ

๐ A basic ToDo app, made to show how I use some development principles like SOLID, Clean Architecture and Clean Code. State management, service location and tests also are used to develop the better version of this code. 

## Chosen dependencies
๐ค [BLoC with Cubit](https://bloclibrary.dev/#/flutterbloccoreconcepts) for state management ([flutter_bloc](https://pub.dev/packages/flutter_bloc))  
๐ **GetIt** for service location (dependency injection)  
๐ฅ Firebase as backend service, using the real time database and the auth service (**firebase_core**, **firebase_auth** and **cloud_firestore**)  
๐งช MockTail to make easy mock classes on tests  
๐ DartZ for error handling with functional programming  


## โผ๏ธ Considered subjects
In this project I shown my way to code following some important development subjects. The development always will be a cycle steps like develop-deliver-refactor, so mind about the difficult level to make changes on your code is really important. This is the point that a clean code, without dependency coupling and following best practices makes the workflow flow easier.
## Features already done
โ Sign in and Sign up pages with firebase auth  
โ Task list page, listing all your added tasks  
โ "Add a new task" widget. A quick way to create a task     
โ "Trash button", to delete a task that you no more want to see on your list     
## Next Steps
๐ Tests for features already developed and for core classes   
๐ Crashlytics service, logging when something went wrong, helping to track bug behaviors  
๐ Internationalization - translate the app texts depending on the device locale
## Send me a message!
Thierry Oliveira - [LinkedIn](https://www.linkedin.com/in/thierry-oliveira/)  
Email - [contato@thierryoliveira.com](mailto:contato@thierryoliveira.com)