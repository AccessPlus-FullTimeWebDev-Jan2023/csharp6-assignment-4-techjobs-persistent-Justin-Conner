HW 4 breakdown
***********************************************************************
MODELS
***********************************************************************
MODELS Employer.cs
***********************************************************************
This code defines a C# class called Employer in the namespace TechJobs6Persistent.Models.

The Employer class has the following properties:

Id: an integer property that represents the unique identifier of the employer
Name: a string property that represents the name of the employer
Location: a string property that represents the location of the employer
Jobs: a list of Job objects representing the jobs associated with the employer
The class also has two constructors:

A parameterized constructor that takes in two arguments, name and location, and sets the Name and Location properties of the Employer object.
A default constructor that takes no arguments.
***********************************************************************
MODELS Job.cs
***********************************************************************
This is the Job class in the TechJobs6Persistent.Models namespace. It represents a job listing, which has an ID, name, employer, and a collection of skills associated with it. The properties in the class are:

Id: An integer representing the unique identifier for the job listing.
Name: A string representing the name of the job.
Employer: An instance of the Employer class representing the employer associated with the job.
EmployerId: An integer representing the foreign key to the Employer table in the database.
Skills: A collection of Skill objects representing the skills associated with the job.
The class has two constructors, one with parameters for name and Skills, and one with no parameters. The Skills property is initialized to an empty list in the constructors.
***********************************************************************
MODELS skill.cs
***********************************************************************
This code defines the Skill class in the TechJobs6Persistent.Models namespace. The Skill class has the following properties:

Id: an integer property that represents the unique identifier for the skill. This property has a public get and set accessor.
SkillName: a string property that represents the name of the skill. This property has a public get and set accessor.
Jobs: a collection of Job objects that have this skill. This property has a public get and set accessor.
This class also has the following constructors:

A constructor that takes a name parameter and initializes the SkillName property with that value. It also initializes the Jobs property with an empty list of Job objects.
A default constructor that doesn't take any parameters and initializes the Jobs property with an empty list of Job objects.
In addition to these properties and constructors, the Skill class also has validation attributes. The Required attribute ensures that the SkillName property is not null or empty. The StringLength attribute specifies that the SkillName property must have a length between 3 and 50 characters. If the SkillName property doesn't meet these requirements, an error message will be returned.
***********************************************************************
VIEW-MODELS AddEmployerViewModel.cs
***********************************************************************
This code defines a view model class called AddEmployerViewModel. A view model is a class that represents the data that a view (i.e., the user interface) needs to display and/or modify.

This view model has two properties: Name and Location. Both properties are annotated with the [Required] attribute, which means that they are required fields and the user must enter a value for them. If the user doesn't enter a value for a required field, an error message will be displayed.

The ? after the string type indicates that the property is nullable, which means that it can be assigned a null value. This allows the view model to handle situations where the user doesn't enter a value for a field.
***********************************************************************
VIEW-MODELS AddJobViewModel.cs
***********************************************************************
This code defines a view model called AddJobViewModel that represents the data needed to display and process the form for adding a new job. It contains the following properties:

Name: a string that represents the name of the job.
EmployerId: an integer that represents the ID of the employer associated with the job.
Employers: a list of SelectListItem objects that represent the employers available in the system.
The AddJobViewModel class has two constructors:

The default constructor takes no arguments and initializes the Employers property to an empty list.
The second constructor takes a list of Employer objects as a parameter and initializes the Employers property to a list of SelectListItem objects, each of which represents an employer in the system. The Value property of each SelectListItem object is set to the ID of the corresponding Employer object, and the Text property is set to the name of the employer.
***********************************************************************
VIEW-MODELS AddSkillViewModel.cs
***********************************************************************
This code defines a view model class called AddSkillViewModel. It has the following properties:

JobId: an integer that represents the ID of the job to which a new skill is being added.
Job: a reference to the job to which a new skill is being added.
Skills: a list of SelectListItem objects that represent the possible skills that can be added to the job.
SkillId: an integer that represents the ID of the skill being added.
The class has a constructor that takes in a Job object and a list of Skill objects. It initializes the Skills property by iterating over the list of Skill objects and adding each one to the Skills list as a new SelectListItem object, with the value set to the skill's ID and the text set to the skill name. The constructor also sets the Job property to the provided Job object.

There is also a default constructor that takes no arguments.
***********************************************************************
VIEW-MODELS JobDetailViewModel.cs
***********************************************************************
This is a class definition for a view model called JobDetailViewModel. It has four properties: JobId, Name, EmployerName, and SkillText.

JobId is an integer property that represents the ID of a job.
Name is a string property that represents the name of a job.
EmployerName is a string property that represents the name of the employer associated with the job.
SkillText is a string property that represents the skills required for the job.
The constructor of this view model takes a Job object as a parameter, and it populates the properties of the view model using the data from the job object. It sets the JobId property to the ID of the job, the Name property to the name of the job, and the EmployerName property to the name of the employer associated with the job.

Finally, it creates a SkillText property by iterating over the Skills property of the Job object and concatenating the names of the skills into a single string. Each skill name is separated by a comma and space, except for the last skill name.
***********************************************************************
DATA JobDbContext.cs
***********************************************************************
This is C# code for a class called JobDbContext which is a subclass of DbContext provided by Entity Framework Core, a popular Object-Relational Mapping (ORM) framework in C#.

The JobDbContext class is responsible for representing the database context for the Job, Employer, and Skill models. It contains properties for each of these models, which are defined using DbSet<T> generic class. DbSet allows the class to interact with these models within the database.

The OnModelCreating method is used to configure the relationships between these models. In this case, there is a one-to-many relationship between Employer and Job, and a many-to-many relationship between Skill and Job.

The code uses Fluent API to configure the relationships between the entities. The HasOne method specifies a one-to-many relationship between Job and Employer entities. The HasMany method specifies a many-to-many relationship between Job and Skill entities using an intermediate table called "JobSkills".

The constructor of the JobDbContext class takes a DbContextOptions<JobDbContext> parameter which is used to provide configuration options for the database context, such as the connection string to the database.
***********************************************************************
MAIN Program.cs
***********************************************************************
This is the entry point of an ASP.NET Core application.

First, the WebApplication.CreateBuilder(args) method creates a new instance of the WebApplicationBuilder class, which is used to configure the application.

The code then registers services to the application's dependency injection container. Specifically, it registers the JobDbContext class as a service and configures it to use a MySQL database using the connection string and server version provided.

Next, the code configures the HTTP request pipeline by adding middleware components using app.Use... methods. In this case, it adds support for HTTPS redirection, static file serving, routing, and authorization.

Finally, the application maps a default controller and action to a route using app.MapControllerRoute(). In this case, it maps the JobController to the default route, with the Index action as the default action. If no matching route is found, it falls back to the app.Run() method.
***********************************************************************
VIEWS--EMPLOYER-- create.cshtml
***********************************************************************
This code is a Razor view template written in the Razor syntax used by ASP.NET Core for building web applications. Razor views are HTML files with embedded C# code, which are executed on the server-side to generate dynamic HTML content that is sent to the client.

In this particular code, the "@" character at the beginning of the file indicates that this is a Razor view. The "@model" directive declares the model type for this view, which is "AddEmployerViewModel" in this case.

The HTML content of the view contains a form that allows the user to add a new employer. The "asp-controller" and "asp-action" attributes of the "form" tag indicate the name of the controller and action method that will handle the form submission. The "method" attribute specifies that the form data will be sent using the HTTP POST method.

The "label" and "input" tags are used to create form fields for the employer name and location. The "asp-for" attribute of the "label" and "input" tags is used to bind the input fields to the corresponding properties of the "AddEmployerViewModel" model. The "span" tags with the "asp-validation-for" attribute are used to display validation error messages for each input field if the user input is invalid.

Finally, the "input" tag with the "type=submit" attribute is used to create a submit button that the user can click to submit the form.
***********************************************************************
VIEWS--EMPLOYER-- Index.cshtml
***********************************************************************
This code is a Razor view in an ASP.NET Core web application. The view is used to display a list of employers.

The @model directive at the top of the file specifies the type of model that this view expects to receive, which is a list of Employer objects from the TechJobs6Persistent.Models namespace.

The view starts with an if statement that checks whether the Model list is empty. If it is, the view displays a message saying that no employers have been listed yet. If the list is not empty, the view displays a table with two columns: "Id" and "Employer".

The table is populated using a foreach loop that iterates over each Employer object in the Model list. For each employer, the view displays a row in the table with the employer's ID in the first column and a link to the employer's details page in the second column. The link is generated using the asp-controller, asp-action, and asp-route-id attributes, which specify the controller action that should handle the request and the ID of the employer that should be displayed.
***********************************************************************
VIEWS--JOBS-- Add.cshtml
***********************************************************************
This is a Razor view template for the "Add Job" page in a web application. The page allows a user to add a new job by filling out a form.

The @using directive and @model declaration at the beginning of the code indicate that the view is using the AddJobViewModel class from the TechJobs6Persistent.ViewModels namespace as its model.

The <h1> tag creates a heading for the page that says "Add Job".

The <form> tag creates an HTML form that submits to the JobController's Add action method when the user clicks the "Add Job" button.

Inside the form, there are two form groups, one for the job name and one for the employer. Each form group has a label and an input element. The asp-for attribute on the label and input elements is used to bind them to the corresponding properties of the AddJobViewModel class. The asp-validation-for attribute is used to display validation error messages.

The employer form group includes a <select> element that displays a dropdown list of employers from the Model.Employers property of the AddJobViewModel class. The asp-items attribute is used to bind the dropdown list to the Employers property. There is also a link that allows the user to add a new employer by redirecting to the Create action method of the EmployerController. The asp-route-id attribute specifies the id of the employer to add.

The <input> element with type="submit" creates a button that the user can click to submit the form.

Overall, this Razor view template generates an HTML page that allows the user to enter job details and add a new job to the database.
***********************************************************************
VIEWS--JOBS-- Delete.cshtml
***********************************************************************
This is a HTML view for deleting jobs in a web application. It displays a header "Delete Job" and a form with a list of all jobs that can be deleted. The jobs to be deleted are listed as checkboxes, with the job name displayed next to each checkbox. The checkboxes allow the user to select multiple jobs to delete. The job's Id value is passed as the checkbox value. The submit button is labeled "Delete Selected Jobs" and is displayed in red color to indicate that it is a destructive action. When the user clicks the "Delete Selected Jobs" button, the selected jobs' Id values are submitted as an array named "jobIds"
***********************************************************************
VIEWS--JOBS-- Detail.cshtml
***********************************************************************
This is a Razor view file that displays the details of a job.

The @model directive at the top of the file specifies that the model being used is JobDetailViewModel from the TechJobs6Persistent.ViewModels namespace.

The h1 tag displays the name of the job using @Model.Name.

A table is used to display the employer name and skills associated with the job. The employer name is displayed using @Model.EmployerName, while the skills are displayed using @Model.SkillText.

Finally, a link is provided to add more skills to the job. When clicked, it navigates to the AddJob action method in the Skill controller and passes the job ID as a parameter using asp-route-id="@Model.JobId".
***********************************************************************
VIEWS--JOBS-- Index.cshtml
***********************************************************************
This is a Razor view for the Tech Jobs Persistent application.

The first line imports the TechJobs6Persistent.Models namespace, and the second line sets the model for the view to a list of Job objects.

Inside the view, the title of the page is set to "Tech Jobs Persistent" using the ViewData dictionary. The main content of the view is inside a <div> tag with a text-center class.

An if statement is used to check if the list of jobs is empty. If so, a message "No jobs yet!" is displayed. If not, a table is created with columns for job name and employer name. A foreach loop is used to iterate through the list of jobs and create a row for each job, with the job name linked to its detail view and the employer name displayed in the next column.

Finally, the view includes two links at the bottom to add and delete jobs.
***********************************************************************
VIEWS--SKILL-- Add.cshtml
***********************************************************************
This is a Razor view that allows the user to add a new Skill.

The view expects a model of type TechJobs6Persistent.Models.Skill to be passed to it. The view has an HTML form that posts to the Add action method of the Skill controller.

The form contains a text input field for the SkillName property of the model. When the user submits the form, the text entered in the input field will be posted to the server.

If the user input is invalid, the view will display a validation error message using asp-validation-for.

Finally, the view has a submit button with the text "Add new skill".
***********************************************************************
VIEWS--SKILL-- AddJob.cshtml
***********************************************************************
This code is an HTML Razor view that allows users to add a skill to a job. The view uses the AddSkillViewModel model, which has a property for the selected job and a list of skills to choose from.

The view starts with a header displaying the name of the job that the skill will be added to. Then, it includes a form that will submit a POST request to the Skill controller's AddJob action.

Inside the form, there is a hidden input field that contains the ID of the selected job. Below that, there is a form group that contains a label for the skill dropdown list and the dropdown list itself. The options for the dropdown are populated using the Model.Skills property, which is a list of Skill objects.

Finally, there is a submit button that will add the selected skill to the selected job when clicked.
***********************************************************************
VIEWS--SKILL-- Detail.cshtml
***********************************************************************
This is a Razor view that displays information about a particular skill in the TechJobs6Persistent application. The view expects a model of type Skill.

The view first checks if there are any jobs associated with the skill by checking the count of jobs in the Jobs property of the skill model. If there are no jobs associated with the skill, it displays a message "No Jobs with the given skills". If there are jobs associated with the skill, it displays the heading "Jobs with the following skill: " followed by the name of the skill.

Next, it displays a list of jobs associated with the skill by iterating over the Jobs property of the skill model using a foreach loop. For each job associated with the skill, it displays the job name in a list item.
***********************************************************************
VIEWS--SKILL-- Index.cshtml
***********************************************************************
This is a Razor view file written in C# that displays a list of skills. Here's what this code does:

The first line specifies that the model for this view is a list of Skill objects from the TechJobs6Persistent.Models namespace.
The h1 element displays the heading "All Job Skills".
The if statement checks if the count of skills in the model is 0. If so, it displays a paragraph element with the text "No skill yet!".
If the count of skills is not 0, it displays a table with columns "Id" and "Skill Name" and loops through each skill in the model using a foreach loop. For each skill, it displays a row in the table with the skill's id and name. The skill name is also a link that redirects to the detail view of the skill.
Finally, it displays a link to the "Add" action of the "Skill" controller to allow users to add more skills.