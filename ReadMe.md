# Student Computer Assistant Assignment
Thank you for applying to the student computer assistant position. In lieu of a first-round interview, we would like to ask you to complete a short task to assess your ability to assist us on the project. This task involves setting up a sample project locally, making minor changes to the codebase, and writing a test. You will be working on a basic version (i.e., only two pages) of our job search platform. The tech stack is Django (a Python web framework), PostgreSQL, Bootstrap, and Docker. 

The assignment should take you no more than an hour to complete. Please see below for a detailed task description.

## Assignment
We would like to ask you to do three things.

1. Get the project running locally and run the test suite
    - Follow the instructions [below](#runningproject) to set the project up locally
    - Run the test suite; you should see one test pass, and one test fail
2. Adjust the homepage of the project (located at `templates/home.html`) to pass the `test_homepage_content` test (located in `pages/tests.py`)
    - The project's homepage has an issue, which is causing our automated test to fail 
    - Fix the *homepage* template (located at `templates/home.html`) to make the test pass
3. Write the `test_about_page_content` for the About page in `pages/tests.py`
    - The About page is correct, but does not have any tests written for it yet
    - Test that "About the Platform" is indeed printed as a heading on the page, and that the page further contains the line "On this page, you will find more information about the platform."

Please submit the following things (by email) to Bart de Koning (dekoning@cornell.edu):
- A screenshot of the homepage
- The contents of the `templates/home.html` file
- The contents of the `pages/tests.py` file


## Running the project<a name="runningproject"></a>
To run the project locally, you will need to have Git (see [https://git-scm.com/book/en/v2/Getting-Started-Installing-Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)) and Docker desktop installed (see [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)). If you are running windows, you will also need to have WSL2 installed (see [https://learn.microsoft.com/en-us/windows/wsl/install](https://learn.microsoft.com/en-us/windows/wsl/install)). To run the project for the first time, run the commands below through your command line interface.

1. Copy project from GitHub and navigate into the directory
    - ```git clone https://github.com/bkdekoning/jsp-assignment```
    - ```cd jsp-assignment```

2. Build Docker images and fire up containers
   - ```docker compose up -d --build```

3. Migrate the database
   - ```docker compose exec web python manage.py migrate```

4. Restart Docker
   - ```docker compose restart```

5. The Job Search Platform homepage should be available at the following location in your browser:
   - ```127.0.0.1:8000``` or ```localhost:8000```

6. Run the test suite
   - ```docker compose exec web pytest```
   - Note: you should run this test suite again after you have completed the assignment, to ensure your work is correct