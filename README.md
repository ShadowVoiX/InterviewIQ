Link to github: https://github.com/ShadowVoiX/InterviewIQ.git

PART 1: PROJECT IDEATION & INITIATION
1.0 Project Ideation & Initiation
1.1 Project Title
InterviewIQ: An Intelligent Mobile Interview Preparation Application Using Flutter and Firebase
1.2 Background of the Problem
  Companies have become more competitive when it comes to finding candidates, they expect candidates to have knowledge of not only academics but also communication skills, confidence, and problem-solving skills. Interviews are still a vital component of the recruitment process as it allows the employers to gauge the candidates capability, personality and pressure performance. Nevertheless, students and recent graduates often lack experience, are nervous, and not getting enough constructive feedback at the interview, while a growing gap between the skills employers seek and the graduates' skills persists (Tushar & Sooraksa, 2023).
  
  While traditional interview preparation techniques (lecturing, friends or a career counsellor) can be beneficial, they can be constrained by time, lack of availability and consistency. Professional coaching services can offer more direction, but are often costly and not available to every student. This means that many job seekers use articles, videos, and sample questions found online, but do not receive personalized feedback on their answers.
  
  Recent developments in Artificial Intelligence (AI), especially Natural Language Processing (NLP) and Large Language Models (LLMs), make it possible to create smarter interview preparation tools. AI can create role-specific questions, understand responses, pinpoint gaps, and offer comprehensive recommendations for improvement (Bin Nofal et al., 2025). Having a practice interview with an AI interviewer can make candidates more comfortable and better prepared than they would be using standard interview preparation techniques. This, when paired with mobile technology, forms a flexible learning resource which can be used anywhere, anytime.
  
  If you want to build such an app, Flutter and Firebase can provide you with a convenient foundation. The Flutter platform is great for fast cross-platform mobile development, and Firebase provides authentication and cloud database services without needing to build the backend. (Saraf, 2022) The technologies developed in this project are used in the development of a project based mobile application, "InterviewIQ," which mimics interview sessions, assesses responses with AI, and records interview history for later review. The application's purpose is to improve, access and reduce the cost of interview preparation.
  
1.3 Purpose and Objectives
  InterviewIQ's primary goal is to assist students, graduates, and job seekers in becoming better prepared for interviews by using the power of AI to simulate and provide feedback on an interview. The application is designed to be used as a learning support that lets the user practice autonomously, and be evaluated after each practice session.
  The first goal is to create a mobile application which can create the questions for the interviews based on selected job roles. This guarantees that interviewees are presented with questions that are related with their career objectives and not generic interview questions.
  
  The second goal is to analyze user responses with the help of AI. The system assesses answers for clarity, relevance, completeness, professionalism, communication quality, and technical accuracy, and offers constructive feedback on ways to improve the response, a process similar to recently developed AI interview-simulation systems that score responses on multiple domains of the interview and provide explanatory feedback specific to the areas where the response fell short (Bin Nofal et al., 2025).
  
  The other goal is to provide a transparent report on interview performance. The application does not just display scores, but also provides an overview of strengths, weaknesses, confidence level and improvement recommendations so users can understand their performance well.
  
  The project aims to also store interview history using Firebase Cloud Firestore, a NoSQL Cloud database service that provides an easy and efficient way to store and retrieve user's information in real-time and secure manner for the mobile app (Saraf, 2022). This enables users to view previous sessions, compare progress and monitor improvement over time.
  The project showcases the seamless integration of various software tools and technologies, including Flutter, Firebase Authentication, Cloud Firestore, and AI APIs, into a single mobile solution. It is an example of modern mobile development as well as an application of the cloud-based development.
  
1.4 Target Users
  InterviewIQ is principally for university students who are getting ready for Industrial Training, University Internships, Graduate employment and Scholarship interviews. Interview application is great for students who know about their subjects well but don't have much interview experience. Working in a non-judgmental and low stakes environment can help candidates feel less anxious and better prepared for real interviews.
  
  Another important user group is the fresh graduates. Academic-to-workplace transitions require them to enhance their capacity to communicate clearly and professionally in interviews and in problem solving and teamwork, as these skills have been identified as consistent across all industries in the employability skills list (Tushar & Sooraksa, 2023). They get a safe space to practice on before taking part in real interviews thanks to InterviewIQ.
  
  This application is also helpful for job seekers who have switched careers, or who have taken a break and are considering coming back to work. These users might require additional training in meeting the expectations and requirements of the industry in the context of an interview.
  
  Moreover, InterviewIQ can be used by lecturers and career counselors as an aid in employability training. It can be used in conjunction with workshops and career development courses that give students the opportunity to practice on their own.
  
1.5 Preferred Platform
  The application was built using Flutter, with Android being the main platform and is called InterviewIQ. The platform was selected to be Android since it is a widely adopted platform among students at the University and has a large range of devices.
  
  The choice of Flutter was due to its features of enabling cross-platform development from a single codebase, responsive user interfaces, and performance. It is also widget-based, which speeds up the UI development process and ensures consistency across devices.
  
  Cloud services, Authentication, Cloud Firestore were all are implemented in Firebase. This eliminates the need for a separate back-end server, and makes managing user accounts and interview records much easier, as Firebase is a Backend-as-a-Service that manages authentication, data storage, and security rules without requiring much configuration on the server (Saraf, 2022). The AI part is integrated by external language model APIs that process the questions and judge the answers.
  
1.6 Features and Functionalities
  InterviewIQ has some features that facilitate interview preparation. To gain access to their personal data securely, users have to register or log in with the help of Firebase Authentication. Firebase Authentication supports secure sign-in using email, phone number, and other credential types (Saraf, 2022). Once they log in, they are directed to the Dashboard, where they can initiate a new interview or review previous interviews.
  
  Users choose a role to interview when they start the interview. Then the AI produces the interview questions pertaining to a certain job. The user responds to each question sequentially and may browse through the session by clicking on navigation buttons (such as Next, Skip and Submit).
  
  Once the interview is finished, the responses are sent to the AI service for analysis. The AI assesses each answer and gives comprehensive feedback on its strengths and weaknesses, missing points, and possible improvements.
  
  After evaluation, users get the feedback on the questions, their score on each question and a feedback on their overall performance. Each interview is stored in Firebase Cloud Firestore and users can see and delete previous interviews as necessary.
  
1.6 Justification of Proposed Application
  The reason for creating InterviewIQ is that many students and graduates have the same problems when preparing for an interview. There is a large amount of information available online but most of it is static information and does not test individual performance. Current interview apps also typically make use of set questions and restricted feedback.
  
  AI is a more effective alternative, as it will provide more dynamic and individualized interview practice. Rather than just indicating right or wrong answers, InterviewIQ provides feedback on why an answer requires improvement and offers suggestions for how users can better articulate and be more confident in their answers in the future, as there is strong evidence that AI-driven interview tools can more effectively help candidates improve their articulation and confidence than static preparation tools (Bin Nofal et al., 2025).
  
  Flutter and Firebase were selected due to their user-friendliness and the fact that they provide a scalable and responsive application. Flutter allows the creation of mobile user experience efficiently and Firebase offers secure authentication and cloud storage that require little backend management (Saraf, 2022).
  
  In conclusion, InterviewIQ is a valuable resource that caters to the needs of those seeking to excel in their interviews, while providing a cost-effective and intelligent solution. It is a fusion of mobile development, cloud computing and artificial intelligence technologies for employability, lifelong learning and skills development.

PART 2: REQUIREMENT ANALYSIS & PLANNING
2.0 Requirement Analysis & Planning
2.1 Requirement Analysis
  Requirement analysis is crucial in the Software Development Life Cycle (SDLC) as it establishes the functional and technical foundation of InterviewIQ. At this phase the needs of the application were identified to ensure that the system is practical, secure and fit its intended users. This process creates a dynamic baseline that enables engineering teams to maximize the utilization of their resources and make sure that ongoing changes to the software meet the needs of the users in the real world (Soureya et al., 2025). User needs have been analysed, technologies have been considered, the system structure has been determined, and the possibilities of using artificial intelligence, cloud storage, and authentication services have been explored.

InterviewIQ is built to enable users to register safely, log into their accounts, practice mock interviews for job roles selected, get AI-generated interview questions, detailed feedback, and store interview records for future review. The usability, reliability, security and responsiveness are the key aspects that these requirements highlight. The analysis will ensure that each component of the system is used to create a realistic and personalised interview preparation.

2.2 Functional Requirements
  The functional requirements outline the key features of InterviewIQ. It is necessary for users to be able to sign up through Firebase Authentication using email and password.Users need to be able to register through Firebase Authentication using email and password. Users should be able to log in securely and be able to access their own interview history stored in Cloud Firestore. This guarantees that interview records are kept confidential and associated with the right interview.

  Once the user logs in they are directed to the Interview dashboard, where they can enter a new interview or access past interviews. An interview can be created by specifying a job role, and then asking the AI to provide interview questions related to that role. The questions should be similar to actual interview questions and be suitable for practice.

  In the interview session, users respond to questions, one at a time. They answer and their answers are submitted for evaluation to the AI service. These real-time generative AI sub-systems can be integrated to provide highly personalized, scalable, and automated feedback parameters (Diaz, 2026). The AI then provides feedback to each answer, such as strengths and weaknesses, missing points, suggested improvements, and sample improved answers, if needed. These automated assessments have been shown to greatly enhance key communication metrics, technical observation criteria, and structural response planning in simulated interview training sessions (Villagrán, 2026).

  Once the application has been evaluated, it will provide an overall summary with a performance score, a communication quality score, technical understanding score, confidence level score, and recommendations for improvement. Once the interview has been completed, the report is automatically saved in Cloud Firestore, where users can view or remove it at any time.

2.3 Non-Functional Requirements
  InterviewIQ also has to have several non-functional requirements that will make it a good user experience. There should be no excessive lag time during screen transitions and AI communication. The loading indicators depict that the AI is being evaluated and processing is taking place, as it requires an internet connection.

  The system should be fault-tolerant and correctly operate with the database when storing or accessing interview data. It is essential to use exception handling to avoid crashes resulting from invalid input, network issues or unexpected responses from the server. Error message should be clear and informative.

  The security is crucial as interview records are stored in the cloud. Firebase Authentication ensures that the data provided for each user is accessible only to the user who created it, while Cloud Firestore Security Rules applies a high level of verification to encrypt the data assets in the cloud and allow only the owner of the data profile to read and write to it (Sornmayura, 2026).

  Usability is also important. The user interface is designed according to the Material Design, which offers familiar navigation, consistent layout and user interaction in all screens. The ability to scale was also taken into consideration, because Firebase can handle more users without the need of significant changes to the system architecture.

2.4 Technical Feasibility Assessment
  Prior to development the technical feasibility of InterviewIQ was evaluated. Flutter was chosen as the primary framework due to its ability to write one code for both mobile platforms. According to empirical framework assessments, Flutter has consistently been delivering highly competitive user interface rendering times and simple CPU efficiency for mobile systems as compared to native apps (Lin, 2026). This directly decreases development time and maintenance.

  Firebase was selected as the Backend-as-a-Service (BaaS) platform as it offers authentication, cloud storage, and database services without having to maintain a separate server. This makes deployment easy and decreases backend complexity.

  An external Large Language Model API provides the functionality of Artificial Intelligence. The Flutter app sends questions to the AI service via secure HTTP connections; question generation and answer checking without heavy machine learning models running on the phone. In this way, device resources are conserved and detailed feedback to the user is still provided. In general, the chosen technologies are compatible and applicable for development of an intelligent interview coaching application.

2.5 Back-End Assessment
  The reason for choosing Firebase as the cloud backend for InterviewIQ is that it has the features of authentication, data storage, and synchronization. Firebase Authentication is used to generate a unique User ID for each user, which is then stored and retrieved in Cloud Firestore to keep track of interview records.

  Cloud Firestore is used for CRUD operations. Upon completion of an interview, a new document will be generated that includes the job role, questions, answers, AI feedback, summary, score, and date. The user can read their interview history from the database or remove information that isn't needed anymore. Cloud Firestore's serverless operational profile easily facilitates persistent connections and automatic cloud data synchronization across multi-platform networks (Sornmayura, 2026). This will be followed by an update feature that will allow for editing of saved or preference data in future versions.

  Because Firestore is a NoSQL document database, it stores interview data in a flexible structure that is easy to expand. This allows it to be used in future features such as analytics or multimedia support.

2.6 Packages and Plugins
  firebase_core was used to connect Flutter and Firebase services; firebase_auth to register, log in, and log out users; cloud_firestore to store interview history and user data; and flutter_dotenv to store API keys outside the source code, which keeps them secure.

  The http package allows communication with the AI service used for generating questions and evaluating the answers. Other packages include state management, loading animations, icons and interface enhancements. All selected packages are actively developed and compatible with Flutter SDK, so it gives stability.
  
2.7 Platform Compatibility
  The main reason of the creation of InterviewIQ is to make it available primarily for Android smartphones as they are widely used among students and job seekers. However, responsive layouts ensure that the app remains functional on various screen sizes and device configurations with Flutter.

  The current version has to be an Android version, but if you are developing for iOS, then you are lucky, since Flutter's hybrid UI framework has a very consistent representation throughout the platform and uniform visual logic layouts with minimal source changes (Lin, 2026). Firebase has support for both platforms making it easier to integrate the back end.

  The interface’s design is based on Material Design, which facilitates easy interaction on touch devices. Optimized for mobile use, buttons, forms, scrolling and navigation are optimized without sacrificing the tablet experience.
  
2.8 Logical Design
  The logical design illustrates the interactions between the user, mobile app, Firebase services, and AI system. User logs in via Firebase Authentication and then accesses the dashboard. Once you choose a job role, the app asks the AI service for interview questions. The user responds to the questions and their answers are sent for evaluation. The AI responds to the user with feedback, which is displayed to the user and saved to Cloud Firestore for subsequent use.
  
Figure 2.1: Sequence Diagram
<img width="1536" height="1024" alt="Untitled design" src="https://github.com/user-attachments/assets/49736624-0026-42b2-9c13-e2f077e2c4d6" />

 
  The navigation structure is designed to be simple and easy to follow. Users begin at the login or registration screen, move to the dashboard, start an interview, complete the session, view AI processing, read feedback, and then see the summary before returning to the dashboard or history page.
  
Figure 2.2: Screen Navigation Flow
<img width="520" height="605" alt="image" src="https://github.com/user-attachments/assets/d8272ac7-e0f2-44a5-9e20-a5957752fbc9" />

 
2.9 Project Planning
  Completion of InterviewIQ within the project timeframe and maintaining the quality of the product will require proper planning. The project is based on SDLC process, which includes initiation, requirement analysis, design, development, testing, debugging, documentation and presentation.

The schedule was designed to provide sufficient time to implement the features, build a Firebase environment, integrate with AI, test and fix bugs. Extra time was reserved for interface improvements and resolving issues found during integration. Some extra efforts were needed to get the AI-related tasks working due to the need for careful testing of the communication with the external APIs.

  It was developed using a modular (component) approach, which meant that each screen and feature was developed separately and then brought together into the whole application. Easier to manage development and easier to debug.
  
Figure 2.3: Project Gantt Chart
<img width="870" height="718" alt="image" src="https://github.com/user-attachments/assets/e5e0a2d6-3086-444e-b364-c91fc371a24c" />

 
PART 3: PROJECT DESIGN
3.0 Project Design
3.1 Introduction
  In project design, the requirements collected during the analysis phase are transformed into the plan of how the system will be developed. In case of a mobile application such as InterviewIQ, the design should be able to serve not only for functionality but also usability and simplicity of use so that users can concentrate on conducting interviews. As the purpose of the application is to assist users with employment interviews preparation, the design should be clear, efficient and professional.
  
  InterviewIQ has been designed based on the principles of Material Design provided by Google which includes simplicity, consistency, accessibility, and responsiveness. Such an approach provides users with easy navigation through the application while at the same time ensuring a modern design of it. Special attention has been paid to the design of screens, navigation, typography, space and color.

3.2 User Interface (UI) Design
  InterviewIQ’s user interface was designed on Flutter’s widget-based development model that allows designing responsive UIs for various Android phones. The widgets developed by Flutter allow building visually appealing and responsive UIs that feature good visual consistency and high performance.

  InterviewIQ’s interface design features clean and minimal design to prevent users from distractions while practicing interviews. Information is presented to users only in case it is necessary at the current stage, which increases readability and allows users to concentrate on the necessary information. Buttons and icons are used to highlight such actions as starting interview, submitting answers, reviewing history, and viewing feedback.

  Readability, correct space management, and easy-to-use input fields were used during the creation of the application’s user interface. Responsive design principles were applied to ensure the adaptability of the interface to various smartphones' screens.

3.3 User Experience (UX) Design
  Ease of use and efficiency were key elements during the application's design due to the nature of the product which should be convenient for its users (Liu, 2025). InterviewIQ employs an effective workflow that minimizes the number of actions necessary to perform any task within the application. The user logs in or registers, opens the dashboard and starts an interview or examines previous interviews.

  The screen containing an interview session was created with the aim to emulate a live interview setting. At a time, only one question is displayed so that the user could answer it with ease without getting distracted. Navigation controls like "Next," "Skip" and "Analyze" are placed systematically making the procedure clear and understandable.

  Another useful element for the user is the screen with information about processing of data through artificial intelligence. It helps to minimize confusion while users wait until the analysis is completed and provides them with the assurance that the system performs well. After analysis is completed, feedback will be displayed in a structured form distinguishing the evaluation of separate questions and overall summary.

  History option adds value to the product by giving the possibility to examine previous interviews and get an idea about user's progress.

3.4 Design Consistency
  It is significant as it enables users to get acquainted with the application quickly. All screens of InterviewIQ have the same visual consistency.
A consistent color scheme has been used for the whole application in order to help build the brand and provide better readability. The primary actions in InterviewIQ will have the same base color, while secondary actions have a neutral background color. Typography is consistent across headers, bodies, and buttons so that it will be easier for users to understand the structure of the information.

  Icons have been chosen from Flutter’s Material Icons library according to Android design standards. Form inputs, buttons, and navigational elements on different screens are consistent as well as it eliminates any ambiguity and simplifies the application interface. The InterviewIQ brand is present in the splash page, login page, dashboard, interviews pages, feedbacks pages, and history section of the application.

3.5 Screen Design
  Login and Registration pages are secured using Firebase Authentication feature. Input fields, validation messages and authentication buttons only compose those screens; any user can receive error message instantly if some required information has been filled out wrongly.

  Having passed authentication, a user is redirected to Dashboard screen where he will find the menu to perform such actions as starting a new interview, viewing the interview history, account-related functions and logout from the application. All the most used features should be emphasized within this dashboard screen design to make the navigation simple and comfortable.
Interview Session screen is a heart of the application, where user sees an interview question and a multiline text field to fill in his answer. The screen is supposed to be convenient for answering and moving to next questions.

  Having filled out all the questions, a user moves to AI Processing screen where they see a loading message while his answers are being sent to the AI service for evaluation (Tan et al., 2026).

  The Question Feedback screen shows AI comments on each response. There are included strengths, weaknesses, things to include, how to improve, and examples of answers when necessary. This way, the application is not only the practice one but also the personalized learning platform.
  
  The Summary screen provides the overall picture of the interview through the combination of score, communication, technical evaluation, strengths, weaknesses, and suggestions. This allows the user to see the overall picture of his/her performance before getting specific feedback.

  Finally, the History screen retrieves the old interview sessions stored in Firebase Cloud Firestore. The user can either go through the old report or remove the report that is no longer needed.

3.6 Navigation Design
  The navigation pattern of InterviewIQ is the hierarchical pattern because of its similarity to how mobile applications work. Users navigate from authentication through the dashboard to the chosen feature of the application. There is a sequential order of actions during the interview process: question answering, waiting for AI analysis, looking at the feedback, and summary.
  
  This type of navigation minimizes the number of screens that a user needs to go through in order to find what he or she needs and always allows the user to understand where he or she is inside the application. Navigation controls and buttons are well labeled and positioned consistently, which makes it less likely to get lost.

3.7 Mobile Design Principles
  The app InterviewIQ uses several essential mobile design principles. It has simplicity because it displays necessary data for every step only. Visibility principle is fulfilled using appropriate text, spacing, and colors, which makes it easy to use in any lighting.

  Touch has been taken into consideration too. Large buttons make tapping easier and spacing between interactive elements prevents accidental inputs. Immediate feedback is provided when a user logs in, submits his answers, or deletes some record.

  Feedback is also used to notify a user about the work of the application when loading indicators or confirmations appear.

  Error prevention is another principle that is taken into consideration in the design of this application. There are no empty fields, clear messages when the login information is incorrect and user can not accidentally delete his history (Liu, 2025).

3.8 Design Evaluation
  In its final version, the InterviewIQ project is a combination of the latest mobile UI trends and AI features presented in a comprehensible and efficient way. The application strikes a balance between usability and efficiency through providing organized and understandable feedback produced by the system. Material Design, responsive Flutter widgets, Firebase integration, and navigation create the atmosphere of professional design in the app.

  The design helps prepare efficiently for interviews due to the fact that all the user needs to do is practice instead of dealing with complex interface elements. The design of each screen was made with usability, accessibility, and consistency in mind, and InterviewIQ can act as an educational platform for students and graduates.

3.9 Summary
  Project design involved defining the look and feel of the system and the interactions within InterviewIQ. Due to the user interface, experience, consistency, and responsiveness incorporated during design, InterviewIQ creates an easy to use environment to prepare interviews. Project design lays the foundation for implementation whereby the planned screens are designed and incorporated in the mobile application using Flutter, Firebase, and Artificial Intelligence technology.

PART 4: PROJECT DEVELOPMENT
4.0 Project Development
4.1 Introduction
  The development stage converted the project design and planning artifacts to a complete and functional mobile application. In the case of InterviewIQ, the following components were incorporated during the development process: implementing the user interface, linking Firebase services, incorporating authentication functionality, designing interview-related features, integrating AI services, and testing for stability and usability. The process of development was done using the modular approach whereby each component would be developed, tested, and maintained individually before putting together the whole application.

  Flutter framework was chosen for development due to its ability to develop applications in an efficient manner in a cross-platform environment. Firebase services were used to incorporate authentication and data storage while AI services were used to develop questions and evaluate the answers of the users. In the entire process of development, the key factors included usability, security, scalability, maintainability, and user experience.

4.2 System Architecture
  The InterviewIQ system adopts a client-cloud architectural design that has three key elements. They include the Flutter mobile application, Firebase services, and the AI service. The Flutter mobile application serves as the user interface component, Firebase authentication deals with login and sign-up processes, while Cloud Firestore handles storing interview responses and user information. Finally, the AI service takes care of creating interview questions and evaluating answers from the users.

  Once a user begins an interview, the mobile application passes the job role to the AI service. Once the interview questions are generated, the user will see them on their mobile application and give their responses. As soon as the interview ends, the answers are passed to the AI service. The feedback provided by the AI service is shown to the user and saved in Firestore (Tan et al., 2026).

4.3 Development Environment
  The application has been built through Flutter framework and Dart language. The Visual Studio Code software has been employed for editing code, as well as for debugging and managing files, whereas the Android Studio program has been used for testing through emulators and configuring Android SDK. The Firebase Console service has been utilized for creating and managing Authentication and Cloud Firestore services.

  In order to increase security, API keys and configuration values have been saved in environment files, rather than being embedded into the source code directly. GitHub has been applied for version control and source code management.

4.4 Modular Code Structure
  Project structure allows for easy maintenance of the source code through the division of project into different modules. This is done by keeping the different screens and functionalities in different files depending on their functionality.

  The module for authentication will be used for handling registration and login processes for users. The module for interviews will contain functionalities of question generation, answer gathering, processing through AI, and displaying of feedback. History module will handle getting and storing of historical interview records. Some utility files will be created to store reusable code for handling API calls, database queries, and data modeling.

4.5 User Authentication Implementation
  For secure login and registration features, I have made use of Firebase Authentication. The users will be able to register their account and sign-in by providing their email ID and password credentials. In the registration feature, all the necessary validation checks are performed for ensuring that all the required details are provided and also that the email ID is formatted correctly.

  Once the user registers, a unique ID for each user is created by the Firebase service which helps to link the interviews to the relevant user account. During signing in, the credential details are verified via Firebase and the users stay logged in until they sign out. This makes signing in convenient for the users.

  The error handling part helps in handling the issues related to authentication including the errors like invalid password, duplicate account, wrong email ID, etc.

4.6 Dashboard Development
  Dashboard is the primary navigation screen of InterviewIQ. Once the user logs into the system, they are redirected to the dashboard screen, from which the user can create an interview or even check their past interviews. The screen design was intended to make sure the user can easily navigate the application’s main features. 

  Flutter routing is used in order to allow the smooth and consistent movement from one screen to another. The dashboard also provides user information in its simplest form and is the primary starting point for the entire application.

4.7 Interview Question Generation
  One of the key features of InterviewIQ is the interview questions that are generated via AI technology. In this case, the user picks a desired job role, and then the application uses AI to come up with interview questions related to this particular job role (Luo, 2025). 

  This approach ensures that the interview process is personalized according to the user's preferred career path. As opposed to the traditional method, where only limited number of questions are present in the question bank, AI interview questions ensure variety and prevent users from doing repeated exercises.
4.8 Interview Session Implementation

  The questions from the session screen appear one at a time, with a text box where the user is expected to key in the response. This allows the users to respond to questions separately without getting confused with more questions being displayed all at once.
The users navigate the session using navigational controls, and their responses are recorded in the process, and then sent for analysis later on. State management technique has been implemented to make sure that answers are saved even when the user changes screens and navigates through the screen controls.

4.9 AI Processing and Feedback Generation
  Once the interview is completed, the user’s answers are submitted to the AI program to be analyzed. In order to let users know what is happening and to avoid re-submitting their answers, an upload window was created.

  In order to analyze user’s answers, the AI program uses several criteria, such as clarity, relevancy, completeness, professionalism, and technical knowledge. The user will receive comprehensive feedback in response, including the areas where he/she was successful and those where there is room for improvement (Thai et al., 2025).
Such feedback is more valuable for users than just a grade, as it provides them with some practical advice about how to improve the performance in the future interviews.

4.10 Question Feedback Screen Development
  Once the interview is completed, the user’s answers are submitted to the AI program to be analyzed. In order to let users know what is happening and to avoid re-submitting their answers, an upload window was created.

  In order to analyze user’s answers, the AI program uses several criteria, such as clarity, relevancy, completeness, professionalism, and technical knowledge. The user will receive comprehensive feedback in response, including the areas where he/she was successful and those where there is room for improvement.
Such feedback is more valuable for users than just a grade, as it provides them with some practical advice about how to improve the performance in the future interviews.

4.11 Summary Screen Development
  The Summary page provides a holistic view of the interview performance. It includes the output from all questions and highlights important details like the areas of strength, weakness, communication skills, technical skills, and suggestions for improvement.

  The Summary page helps users gain insight into their performance without analyzing each individual answer. It is particularly helpful for users who are experiencing recurring problems in many answers. It offers users a clear snapshot of their performance in the interview session.

4.12 Interview History Management
  Interview history is stored in Cloud Firestore in order for users to see their progress through time. Upon completion of each interview, selected role, questions, answers, feedback, summary, and completion date are saved in the user’s Firestore collection.

  History screen loads the saved interviews and shows them in the form of a list. Users may access old interviews to check their results or remove interviews which they no longer require. There are dialogs to prevent any accidental deletion of records. This allows making InterviewIQ not only a good tool to practice but also learn through time.

4.13 CRUD Operations Implementation
  The Cloud Firestore was chosen to back up CRUD operations in the application. The create operation helps store interview sessions in the database, the read operation enables viewing the history of interviews, and the delete operation deletes information that is not needed anymore.
  
The update operation is somewhat limited in the current version of the application, however, the database architecture was created in such a way to make it easy to implement updates in the future. Firestore being document-oriented database is quite appropriate for keeping interview reports due to its flexible nature.

4.14 Error Handling and Input Validation
  Error handling was included in the system for reliability and better user experience. Input validation ensures that users provide all the needed information when registering, signing in, and conducting interviews. Required fields are validated before any action, and if there is no valid data, then users get proper error messages.
  
  Network errors are also handled when Firebase or the AI system is not available. Rather than letting the system crash, meaningful error messages are displayed to the user. Loading screens and retries were also implemented to increase usability while experiencing network issues.

4.15 Packages and Plugin Integration
  Various Flutter packages were incorporated into the application to support its functioning. Firebase Core acts as a link between Flutter and Firebase, while Firebase Authentication and Cloud Firestore enable logins and storage of data respectively. Various HTTP packages were employed for communicating with the AI service.

  Other packages were included for loading animations, icons, state management, and user interface enhancements. All of the packages selected for integration were tested for their compatibility with the overall application. The selected packages turned out to be highly compatible and enabled faster development of the project (Vijayakumar, n.d.).

4.16 GitHub Collaboration and Version Control
  GitHub was employed in managing the source code and changes done during the development process. The branching method was applied where new features and bug fixing were done on separate branches before merging with the main branch. This assisted in making the development process more organized while reducing chances of having errors in the application. 

  The commit history was utilized as a way of recording changes that took place during the development of the project. Should any problem arise, an old version of the code can be used whenever required. Code reviews and pull requests were also useful in improving the code quality.

4.17 Testing and Debugging
  Continuous testing was performed throughout the process of developing the application in order to assess the functionalities and stability of the system. Functional testing proved the proper work of authentication, interview creation, feedback, history, and navigation of the application. Integration testing was conducted to verify communication among Flutter, Firebase, and the AI service.

  User interface testing was conducted for various Android-based devices as well as simulators to ensure responsiveness and consistency in terms of layout. Debugging was conducted in order to solve the problem with navigation, state management, communication with APIs, and database operations.

4.18 Summary
  In the development process, the team managed to build a working mobile application, known as InterviewIQ. Through the combination of the above mentioned technologies (Flutter, Firebase and AI), the system is able to provide a secure login, creation of interview questions, feedback, history of interviews, as well as an effective user interface.

Reference
Bin Nofal, A., Ali, H., Hadi, M., Ahmad, A., Qayyum, A., Johri, A., Al-Fuqaha, A., & Qadir, J. (2025). AI-enhanced interview simulation in the metaverse: Transforming professional skills training through VR and generative conversational AI. Computers and Education: Artificial Intelligence, 8, Article 100347. https://doi.org/10.1016/j.caeai.2024.100347
Saraf, P. R. (2022). A review on Firebase (backend as a service) for mobile application development. International Journal for Research in Applied Science and Engineering Technology, 10(1), 967–971. https://doi.org/10.22214/ijraset.2022.39958
Tushar, H., & Sooraksa, N. (2023). Global employability skills in the 21st century workplace: A semi-systematic literature review. Heliyon, 9(11), Article e21023. https://doi.org/10.1016/j.heliyon.2023.e21023
Diaz, P. (2026). How teacher students relate their experiences of AI-generated feedback to future teaching practice. Journal of Education for Teaching, 52(2), 115–128. https://doi.org/10.1080/10476210.2026.2655770
Lin, F. (2026). A comparative analysis of Flutter and native mobile application development (Master's thesis). University of Amsterdam.
Sornmayura, P. (2026). Effects of an exercise-assisting mobile app (Osteoarthritis-Rehabilitation Assistant [O-RA]) on rehabilitation outcomes in older adults: Randomized controlled parallel clinical trial. JMIR Rehabilitation and Assistive Technologies, 13(1), e80971. https://doi.org/10.2196/rehab.80971
Soureya, Y. G., Amougou, N., Moskolai Ngossaha, J., Bowong Tsakou, S., & Fouda Ndjodo, M. (2025). Adaptive software development: A comprehensive framework integrating artificial intelligence for sustainable evolution. The International Arab Journal of Information Technology, 22(2), 204–215. https://doi.org/10.34028/iajit/22/2/4
Villagrán, I. (2026). Human-AI feedback in clinical interview training: evidence and lessons in physiotherapy education. Assessment & Evaluation in Higher Education, 51(3), 412–426. https://doi.org/10.1080/02602938.2026.2644511
Liu, J. (2025). AI in Automated and Remote UX Evaluation: A Systematic Review (2014–2024). Advances in Human-Computer Interaction, 2025(1), 7442179. https://doi.org/10.1155/ahci/7442179
Luo, Y. (2025). Designing With AI: A Systematic Literature Review on the Use, Development, and Perception of AI-Enabled UX Design Tools. Advances in Human-Computer Interaction, 2025(1), 3869207. https://doi.org/10.1155/ahci/3869207
Tan, W. J., Lim, Z. R. L., Durgad, S., Obegi, K., & Li, A. Y. (2026). Avenir-UX: Automated UX Evaluation via Simulated Human Web Interaction with GUI Grounding (Version 2). arXiv. https://doi.org/10.48550/ARXIV.2604.09581
Thai, P., Montalvo, F., Stephens, P., Sasser, J., & Hinkle, S. (2025). Smarter UX Evaluations? Comparing AI and Human Experts in Usability Analysis. Proceedings of the Human Factors and Ergonomics Society Annual Meeting, 69(1), 1219–1222. https://doi.org/10.1177/10711813251369790
Vijayakumar, H. (n.d.). UX in the Age of AI: Rethinking Evaluation Metrics Through a Statistical Lens.

