# Flutter - Starwars land Clean Architecture with State Management :BLoC (The app saves the data offline)


![Build Status](https://github.com/guilherme-v/flutter-clean-architecture-example/actions/workflows/main.yaml/badge.svg)

## Main features: 
- show lists and details of
    - Characters
    - films
    - planets
    - vehicles
    - species
    - starships
      of the popular series Starwars
- Save data offline (after closing the app and when there is no internet connection you can still browse and see loaded -cached- data)
- Search (You can search the titles in real time in any of the above categories

## How the app is divided:
![screenshot-20240706-210919Z-selected](https://github.com/mhosnyessa/star_wars_land/assets/65831561/5fb19e83-eef9-459b-a5e9-bdc2d66f2996)

# Screenshots:
![screenshot-20240706-210619Z-current](https://github.com/mhosnyessa/star_wars_land/assets/65831561/89f0bee0-012a-4e4e-80c1-2fac210073b0)
![screenshot-20240706-210626Z-current](https://github.com/mhosnyessa/star_wars_land/assets/65831561/4343706b-03a2-4148-864e-179c504f1f66)
![screenshot-20240706-210629Z-current](https://github.com/mhosnyessa/star_wars_land/assets/65831561/ce9e71e9-82c9-4aa5-9a90-1261b09106c3)
![screenshot-20240706-210633Z-current](https://github.com/mhosnyessa/star_wars_land/assets/65831561/4749571c-5a4f-4ccb-8804-a1e3f5201f68)![screenshot-20240706-210617Z-current](https://github.com/mhosnyessa/star_wars_land/assets/65831561/38a4d1a3-2b12-4f85-a3b5-8b0f0a023200)
![screenshot-20240706-210634Z-current](https://github.com/mhosnyessa/star_wars_land/assets/65831561/08abf9df-73ec-409b-b65b-475ecfb65ba8)
![screenshot-20240706-210640Z-current](https://github.com/mhosnyessa/star_wars_land/assets/65831561/4412b281-a00a-470d-93ae-58b24e0913a5)
![screenshot-20240706-210646Z-current](https://github.com/mhosnyessa/star_wars_land/assets/65831561/e90028da-2bef-4c68-815f-8edfa2729f0c)
![screenshot-20240706-210648Z-current](https://github.com/mhosnyessa/star_wars_land/assets/65831561/61ab10c2-42d6-4b82-9d97-24c513150818)
![screenshot-20240706-210651Z-current](https://github.com/mhosnyessa/star_wars_land/assets/65831561/ae4f2292-b67b-4b96-a8ff-9355cb430b78)
![screenshot-20240706-210704Z-current](https://github.com/mhosnyessa/star_wars_land/assets/65831561/14ad198c-aee8-411d-a892-54598f33d2a9)
![screenshot-20240706-210708Z-current](https://github.com/mhosnyessa/star_wars_land/assets/65831561/8526ef6d-9000-4857-82f0-20e83c8db545)


## A short description about "Clean Architecture" ( credit: Silva.guilherme)

![architecture](./art/arch_1.png?raw=true)

There are two main points to understand about the architecture: it splits the project into different layers and conforms to the Dependency rule.

The number of layers used can vary slightly from one project to another, but by utilizing them, we promote the principle of 'separation of concerns.' If you're a new developer and have never heard of it before, it's simply a fancy way of saying, 'Hey! I'm a layer, and I'm concerned about a single aspect of the system only'. If a layer is responsible for displaying the UI, it won't handle database operations. Conversely, if a layer is responsible for data persistence, it won't have any knowledge of UI components

And what about the Dependency rule? Let's put it in simple terms. First, you need to understand that the layers discussed above are not stacked on top of each other; instead, they resemble the layers of an 'onion.' There is a central layer surrounded by outer layers. The Dependency rule states that classes within a layer can only access classes from their own layer or the outer layers, but never from the inner layers

Usually, when working with this architecture, you'll come across some additional terminology such as Entities, Interface Adapters, Use Cases, DTOs, and other terms. These terms are simply names given to components that also fulfill 'single responsibilities' within the project:

- Entities: Represent the core business objects, often reflecting real-world entities. Examples include Person, Episode, or Location classes. These entities usually correspond to real-world concepts or objects, possessing **_properties_** specific to them and encapsulating behavior through their own **_methods_**. You'll be **_reading, writting, and transforming entities throughout the layers_**

- Interface Adapters: Also known as Adapters, they're responsible for bridging the gap between layers of the system, **_facilitating the conversion and mapping of data between layers_**. There are various approaches available, such as specialized mapper classes or inheritance. The point is, by using these adapters, each layer can work with data in a format that suits better for its needs. As data moves between layers, it is mapped to a format that is suitable for the next layer. Thus, any future changes can be addressed by modifying these adapters to accommodate the updated format without impacting the layer's internals

- Use Cases: Also known as Interactors, **_they contain the core business logic and coordinate the flow of data_**. For example, they handle user login/logout, data saving or retrieval, and other functionalities. Use Case classes are typically imported and used by classes in the presentation (UI) layer. They also utilize a technique called 'inversion of control' to be independent of the data retrieval or sending mechanism, while coordinating the flow of data

- Data Transfer Objects (DTOs): Are objects used for transferring data between different layers of the system. They serve as _**simple containers that carry data**_ without any behavior or business logic

I recommend checking out [this link](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html), provided by Robert C. Martin ('Uncle Bob'), which offers what today may be considered the 'official' explanation

### Known limitations

- The initial setup involves dealing with some boilerplate code
- There is a risk of over-engineering the solution

### Known benefits

- A/B testing can be easily applied
- Feature toggles can be effortlessly implemented
- All layers can be independently unit tested
- The unidirectional data flow facilitates code comprehension
- UI becomes an implementation detail - In fact, we could even reuse the Domain and Data layers to create things like CLIs

## Clean Architecture and how it's applied in this project

The figure bellow represents the variation applied in this project:

![architecture](./art/arch_2.png?raw=true)

In this case, we're only using three layers: Presentation, Domain and Data.

### The presentation layer (UI)

This is the layer where the Flutter framework resides. Here, you'll find classes that are part of the framework, such as Widgets, BuildContexts, and libraries that consume the framework, including state management libraries.

Typically, the classes in this layer are responsible for:

- Managing the application's state.
- Handling UI aspects of an app, such as managing page navigation, displaying data, implementing internationalization, and ensuring proper UI updates.

### The domain layer

This layer represents the core domain of the problem we are addressing, encompassing the business rules. Hence, it should be an independent Dart module without dependencies on external layers. It includes:

- Plain entity classes (like Person entity)
- Use-case classes that encapsulate the specific business logic for a given use case (like GetAllPeople, SignInUser, and others...)
- Abstractions for data access, normally repository or services interfaces

A use-case has no knowledge of the data source, whether it comes from a memory cache, local storage, or the internet. All these implementation details have been abstracted out through the use of Repository Interfaces. From the use-case's perspective, all that matters is that it receives the required data.

### The data layer

This layer serves as a boundary between our application and the external world. Its primary responsibility is to load data from external sources, such as the internet or databases, and convert it to a format that aligns with our Domain expectations. It plays a vital role in supplying data to the use cases and performs the following tasks:

- Data retrieval: It makes network and/or database calls, retrieving data from the appropriate data sources.
- Repository implementations: It includes the implementations of the repositories defined in the domain layer, providing concrete functionality for accessing and manipulating data.
- Data coordination: It coordinates the flow of data between multiple sources. For example, it can fetch data from the network, store it locally, and then return it to the use case.
- Data (de)serialization: It handles the conversion of data to and from JSON format, transforming it into Data Transfer Objects (DTOs) for standardized representation.
- Caching management: It can incorporate caching mechanisms, optimizing performance by storing frequently accessed data for quicker retrieval.

### The DTOs, Entities and States

As mentioned previously, this architecture emphasizes two fundamental principles: 'Separation of Concerns' and 'Single Responsibility.' And to uphold these principles, it is crucial to allow each layer to effectively handle data according to its specific needs. This can be achieved by utilizing classes with specialized personistics that empower their usage within each layer.

In this project, the Data layer employs Data Transfer Objects (DTOs), the Domain layer utilizes Entities, and the Presentation layer the States classes.

DTOs are specifically designed for deserializing and serializing data when communicating with the network. Hence, it is logical for them to possess the necessary knowledge of JSON serialization. Entities, on the other hand, represent the core concepts of our domain and contain 'plain' data or methods relevant to their purpose. Lastly, in the Presentation layer, States are used to represent the way we display and interact with the data in the user interface.

The specific usage of these classes may vary from project to project. The names assigned to them can differ, and there can even be additional types of classes, such as those specifically designed for database mapping. However, the underlying principle remains consistent: By utilizing these classes alongside mappers, we can provide each layer with a suitable data format and the flexibility to adapt to future changes.

# References

- [Joe Birch - Google GDE: Clean Architecture Course](https://caster.io/courses/android-clean-architecture)
- [Reso Coder - Flutter TDD Clean Architecture](https://www.youtube.com/playlist?list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech)
- [Majid Hajian | Flutter Europe - Strategic Domain Driven Design to Flutter](https://youtu.be/lGv6KV5u75k)
- [Guide to app architecture - Jetpack Guides](https://developer.android.com/jetpack/docs/guide#common-principles)
- [ABHISHEK TYAGI - TopTal Developer: Better Android Apps Using MVVM with Clean Architecture](https://www.toptal.com/android/android-apps-mvvm-with-clean-architecture)
- [Jason Taylor (+20 years of experience) - Clean Architecture ](https://youtu.be/Zygw4UAxCdg)
- [Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
# star_wars_land
