# Introduction

This app allows the user to select red, green and blue intensities to setup a color in a preview view.

It is the homework for the module 1 of [Kodeko iOS Bootcamp](https://bootcamp.kodeco.com/accelerator/ios).

<p align="center">
  <img src="./doc/rgb.png" width="400" />
</p>

# Assignment

## Week 2

a) Describe the two size classes in iOS.

- compact: indicates that the space is constrained
- regular: indicates that there is more space to layout the view components

b) What is Continuous Learning, and why is it important in mobile development?

It basically means always learning to get new skills and extend our knowledge. It is important in mobile development because things are moving fast and change is continuous. So we want to be up to date to create and make evolve our apps.

c) How can you find out what modifiers a View has?

One way is to select the view in the preview, go to the attributes inspector and select the "Add Modifier" field. The list of modifiers for this view will be visible. 

d) What is a breakpoint?

It is a location in a program where we want the app to pause when we are running it in debug mode. 

e) How can you access environment values in your App?

Thanks to then `@Environment` annotation.

f) How can you determine, in code, if the App is in Dark or Light Mode?

We can retrieve the color schema thanks to an environment property, using a syntax similar to below:

```Swift
  @Environment(\.colorScheme) var colorScheme
```

Then, in the code we can have some logic to check if the app is in dark or light mode, for example:

```Swift
if colorScheme == .dark {
  // dark mode
} else {
  // light mode
}
```

g) Why are magic numbers an issue, and how should you avoid them?

A magic number is an hardcoded value that appears in the code. They are an issue because it can be hard to understand their meaning or they can be duplicated in different areas of the code, making the app harder to maintain.

To avoid them, we can create named constants with a meaningful name and use those constants instead of the hardcoded values.

h) How can you view your App in Light and Dark Modes simultaneously?

We can create different previews, one for each mode. For example:

```Swift
#Preview {
  ContentView()
}

#Preview {
  ContentView().preferredColorScheme(.dark)
}
```

i) Below is an image of the Canvas from Xcode. The Canvas is in selectable mode. Can you explain why the red background does not cover the entire button area?

It is probably because the padding of the component has been defined after the background color has been set. Moving the padding definition before the color definition should fix it.

j) Modifier padding(10) adds padding to the view's top, bottom, left, and right sides. How could a padding of 10 be added to only the left and right sides of the view? The answer for this question should be a short section of code.

Here is how it could be done:

```Swift
view.padding(.horizontal)
```

k) Provide two reasons why you would want to extract views.

- make the code easier to read & avoid spaghetti code
- make views reusable

l) How can you determine, in code, if the device is in Portrait or Landscape mode?

We can use size classes for this. For example:

```Swift

  // retrieve the environment classes somewhere
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  // ...and use them somewhere else
  if verticalSizeClass == .regular && horizontalSizeClass == .compact {
    // portrait mode
  } else {
    // landscape mode
  }
```

m) What is a literal value?

It is usually a number, a string, boolean, etc.

o) What are the safe areas?

A safe area is used to define a view that will not contain any navigation bar, tab bar or toolbar.


p) This line of code was in the lesson on animation. Can you state in English what the line means?

.frame(width: wideShapes ? 200 : 100)


q) Describe the two transitions you were introduced to in this week’s lesson.

The scale and opacity transitions.


r) In Bullseye, the Game struct is what type of object?

It's a model object.

s) What are SFSymbols?

Those are symboles created by Apple to be used in iOS (and macOS, etc.) apps.

t) What is the difference between “step into” and “step over " in the debugger?”

- step into: the debugger will go in the code of the function that is called at the current point of execution. 
- step over:the debugger will not go in the code of the function that is called at the current point of execution.

u) Name some items you would place in the Asset Catalog (Assets.)

- colors
- app icon

v) How do you change the Display Name of your app?

In the project navigator, we select the app target and the General tab. In the identity section, we are able to change the app's display name.


## Week 1

a) What does the command ‘git status’ output?

The state of the git repository where it is executed: 

- the branch
- the files that have been modified locally and not staged yet and the files that have been staged but not commited yet.
- the files that are not tracked yet 

b) In SwiftUI, anything that gets drawn on the screen is a **View**.

c) print(“Hello world”) is an example of a **function** call.

viewModel.getData() is an example of a **method** call.

d) Name some Views you have seen so far in SwiftUI.

- Text view
- Slider view
- Button view

e) How do you create a new local repository using git? (Feel free to answer with how you use git, i.e. terminal or another app)

In the terminal with the following command:

`git init`

f) How do you preview your app in multiple orientations?

In the canvas with the orientation variants for a swift ui view or in the simulator

g) An app is made up of **definitions** of classes and structs that contain **properties** and **methods**.


h) Name two components of a SwiftUI Button.

- the label of the button that will be displayed
- a closure that will contain the action to execute when the button is tapped

i) In git, what is the difference between a local repository and a remote repository?

The local repository is a folder in our computer that contains the code we can modify until we commit them.

The remote repository is a location on a server where developers can synchronize their modifications to a same codebase. After commiting changes in a local repository, we usually push those modifications at some point in a remote repository. 

j) Give an example of camel case.

helloWorld

k) What is a branch in git, and how do you create one? (Feel free to answer with how you use git, i.e. terminal or another app)

A branch is a parallel track of work where developers can work in isolation to make modifications to their code.

Here is how to create and access one from the terminal:

```shell
git branch hello
git switch hello
```

l) What are some common mistakes that can lead to errors while programming?

- syntax errors


m) VStack, HStack, and ZStack are **container** views used for **building layouts**.



n) How do you list the branches on your local repository? (Feel free to answer with how you use git, i.e. terminal or another app)

From the terminal:

```shell
git branch
```

o) What happens when @State variable changes in SwiftUI?

The view is redrawned to take into account the new state value.

p) What is the Single Responsibility Principle?

It is a principle saying that a module can only have one and only one reason to change. The idea is that a module should not have too many responsibilities to keep the code easy to maintain.

q) What will the print statement below produce?

var name = “Ozma”

print(“Hello, \(name)!”)

**Hello, Ozma**

r) What commands can you use in git to download data from a remote repository? What commands can you use in git to send data to a remote repository? (Feel free to answer with how you use git, i.e. terminal or another app)

From the terminal:

- download data

```shell
git pull
```

- send data

```shell
git push
```

s) Why is a programming To-Do list important, and what is a minimum viable product?

The to-do list is important to help decompose complex tasks into smaller ones that are simpler and easier to focus on.

A MVP is a product that contains just enough features to satisfy customers in order to get users feedback to validate those features and improve the product.

t) What is a simple way of describing Binding in SwiftUI?

A binding create a two-way connection between an UI element and a class property. When the user interacts with the UI element, the property is updated appropriately and the other way around.

u) What command do you use in git to move changes from one branch to another? (Feel free to answer with how you use git, i.e. terminal or another app)

From the terminal, to move changes from the `hello` branch to my current branch:

```shell
git merge hello
```

v) What is the type of the variable defined below?

var a = 87

An integer.

w) What is the difference between var and let?

var is used to declare values that could change while let is used to declare constants only.

## Part 3

In ContentView, lines 1 and 2 show the definition of **state property**.

In ContentView, line 3 shows the definition of a **integer property**.

In ContentView, line 4 shows the definition of a **view property**.


In ContentView, line 5 shows an **instance** of Game calling the **method** points.


In ContentView, line 6 is the definition of the **method** doSomethingWithCounter().


In Game, lines a, b, and c show the definition of **integer properties**.


In Game, line d is the definition of the **method** points(sliderValue: Int).


Lines 3, a, b, and c are the **integer properties** and lines 6 and d are the **methods** of the structs.


