# TestAutomation_eCommerce_website
Robotic Framework Test Automation
## Table of Contents
- [Introduction](#introduction)
- [Test Suites Structure](#test-suites-structure)
- [Installation](#installation)
- [Running Tests](#running-tests)
- [Test Cases](#test-cases)
- [Custom Libraries](#custom-libraries)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)
## Introduction
This repository contains automation test suites for the eCommerce website, written using Robot Framework. The tests cover various functionalities such as user login, product display, shopping cart, checkout, and order confirmation.
## Test Suites Structure
eCommerce-automation/
│
├── tests/
│ ├── login/
│ │ └── login_tests.robot
│ ├── shopping/
│ │ └── shopping_tests.robot
│ ├── checkout/
│ │ └── checkout_tests.robot
│ └── confirmation/
│ └── confirmation_tests.robot
│
├── resources/
│ ├── landingPage.robot
│ ├── Generic.robot
│ ├── shopPage.robot
│ ├── checkoutPage.robot
│ └── confirmationPage.robot
│
├── customLibraries/
│ └── Shop.py
│
├── results/
│ └── (output files)
│
├── README.md
└── requirements.txt
## Installation
To set up the project on your local machine, follow these steps:

### Prerequisites
- Python 3.x
- pip
- Google Chrome browser
- ChromeDriver (compatible with your Chrome browser version)

### Steps
1. **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/eCommerce-automation.git
    ```
2. **Navigate to the project directory:**
    ```bash
    cd eCommerce-automation
    ```
3. **Install the dependencies:**
    ```bash
    pip install -r requirements.txt
    ```
### Requirements File (`requirements.txt`)
robotframework
robotframework-seleniumlibrary
robotframework-collections
selenium
## Running Tests
To execute the test suites, use the following command:
```bash
robot -d results/ tests/
This will run all the tests in the tests/ directory and save the results in the results/ directory.

**Test Cases**
Example Test Suite (login_tests.robot)
*** Settings ***
Documentation        Login to eCommerce website
Library        SeleniumLibrary
Library        Collections
Library        ../customLibraries/Shop.py
Test Setup        Open the browser with payment url
Suite Setup
Resource        ../resources/landingPage.robot
Resource        ../resources/Generic.robot
Resource        ../resources/shopPage.robot
Resource        ../resources/checkoutPage.robot
Resource        ../resources/confirmationPage.robot

*** Variables ***
${browser}        chrome
${url}            http://ecommerce-website.com
${valid_username} your_username
${invalid_password} wrong_password

*** Test Cases ***

Validate UnSuccessful Login
    [Tags]        SMOKE
    landingPage.Fill the login form        ${valid_username}        ${invalid_password}
    landingPage.Wait Until Element is located in the login page
    landingPage.Verify error message is correct
Custom Libraries
The project includes custom libraries to extend the functionality of Robot Framework. For example, Shop.py contains custom keywords specific to the eCommerce site.

Example (Shop.py)
from SeleniumLibrary import SeleniumLibrary

class Shop(SeleniumLibrary):
    
    def verify_card_titles(self, expected_titles):
        elements = self.find_elements("css:.card-title")
        actual_titles = [el.text for el in elements]
        assert all(title in actual_titles for title in expected_titles), "Some titles are missing"
**Contributing**
We welcome contributions! Please follow these steps:

Fork the repository.
Create a new branch (git checkout -b feature-branch).
Make your changes and commit them (git commit -m 'Add some feature').
Push to the branch (git push origin feature-branch).
Open a pull request.
License
This project is licensed under the MIT License - see the LICENSE file for details.

**Contact**
For any questions or feedback, please contact us at [kasurit1990@gmail.com].

Creating a README file for a GitHub repository that contains automation test suites written in Robot Framework can help others understand, set up, and contribute to your project. Here’s a sample README file:

markdown
Copy code
# eCommerce Automation Test Suites

![Robot Framework](https://robotframework.org/img/robot-framework-logo.png)

## Table of Contents
- [Introduction](#introduction)
- [Test Suites Structure](#test-suites-structure)
- [Installation](#installation)
- [Running Tests](#running-tests)
- [Test Cases](#test-cases)
- [Custom Libraries](#custom-libraries)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Introduction
This repository contains automation test suites for the eCommerce website, written using Robot Framework. The tests cover various functionalities such as user login, product display, shopping cart, checkout, and order confirmation.

## Test Suites Structure
eCommerce-automation/
│
├── tests/
│ ├── login/
│ │ └── login_tests.robot
│ ├── shopping/
│ │ └── shopping_tests.robot
│ ├── checkout/
│ │ └── checkout_tests.robot
│ └── confirmation/
│ └── confirmation_tests.robot
│
├── resources/
│ ├── landingPage.robot
│ ├── Generic.robot
│ ├── shopPage.robot
│ ├── checkoutPage.robot
│ └── confirmationPage.robot
│
├── customLibraries/
│ └── Shop.py
│
├── results/
│ └── (output files)
│
├── README.md
└── requirements.txt

r
Copy code

## Installation
To set up the project on your local machine, follow these steps:

### Prerequisites
- Python 3.x
- pip
- Google Chrome browser
- ChromeDriver (compatible with your Chrome browser version)

### Steps
1. **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/eCommerce-automation.git
    ```
2. **Navigate to the project directory:**
    ```bash
    cd eCommerce-automation
    ```
3. **Install the dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

### Requirements File (`requirements.txt`)
robotframework
robotframework-seleniumlibrary
robotframework-collections
selenium

bash
Copy code

## Running Tests
To execute the test suites, use the following command:
```bash
robot -d results/ tests/
This will run all the tests in the tests/ directory and save the results in the results/ directory.

Test Cases
Example Test Suite (login_tests.robot)
robot
Copy code
*** Settings ***
Documentation        Login to eCommerce website
Library        SeleniumLibrary
Library        Collections
Library        ../customLibraries/Shop.py
Test Setup        Open the browser with payment url
Suite Setup
Resource        ../resources/landingPage.robot
Resource        ../resources/Generic.robot
Resource        ../resources/shopPage.robot
Resource        ../resources/checkoutPage.robot
Resource        ../resources/confirmationPage.robot

*** Variables ***
${browser}        chrome
${url}            http://ecommerce-website.com
${valid_username} your_username
${invalid_password} wrong_password

*** Test Cases ***

Validate UnSuccessful Login
    [Tags]        SMOKE
    landingPage.Fill the login form        ${valid_username}        ${invalid_password}
    landingPage.Wait Until Element is located in the login page
    landingPage.Verify error message is correct
Custom Libraries
The project includes custom libraries to extend the functionality of Robot Framework. For example, Shop.py contains custom keywords specific to the eCommerce site.

Example (Shop.py)
python
Copy code
from SeleniumLibrary import SeleniumLibrary

class Shop(SeleniumLibrary):
    
    def verify_card_titles(self, expected_titles):
        elements = self.find_elements("css:.card-title")
        actual_titles = [el.text for el in elements]
        assert all(title in actual_titles for title in expected_titles), "Some titles are missing"
Contributing
We welcome contributions! Please follow these steps:

Fork the repository.
Create a new branch (git checkout -b feature-branch).
Make your changes and commit them (git commit -m 'Add some feature').
Push to the branch (git push origin feature-branch).
Open a pull request.
License
This project is licensed under the MIT License - see the LICENSE file for details.

Contact
For any questions or feedback, please contact us at [youremail@example.com].

Thank you for contributing to the eCommerce automation test project!
