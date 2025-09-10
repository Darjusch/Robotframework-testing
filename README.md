# Robot Framework Test Automation Project

A Robot Framework-based test automation project for web application testing using Browser library and Playwright.

## 🚀 Quick Start

### Prerequisites

- Python 3.8 or higher
- pip (Python package installer)

### Installation & Setup

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd robot-test
   ```

2. **Create and activate virtual environment**

   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies**

   ```bash
   pip install --upgrade pip
   pip install robotframework robotframework-browser robotframework-requests pyyaml
   ```

4. **Initialize Browser library**

   ```bash
   rfbrowser init
   ```

5. **Run tests**
   ```bash
   robot -d results tests/
   ```

## 📁 Project Structure

```
robot-test/
├── config/                    # Environment configuration files
│   └── dev.yaml              # Development environment variables
├── resources/                 # Shared code and resources
│   ├── locators/             # Page object locators
│   │   └── order_overview_page.yaml
│   ├── pages/                # Page object models
│   │   └── order_overview_page.resource
│   └── utils/                # Utility keywords and helpers
│       └── browser_management.resource
├── tests/                    # Test suites and test cases
├── results/                  # Test execution results and reports
├── venv/                     # Python virtual environment
├── Jenkinsfile              # CI/CD pipeline configuration
└── README.md                # This file
```

This README provides:

1. **Quick Start Guide**: Step-by-step setup instructions
2. **Project Structure**: Clear explanation of the directory layout
3. **Architecture Overview**: How the Page Object Model is implemented
4. **Configuration**: How to set up environment variables and browser settings
5. **CI/CD Information**: Details about the Jenkins pipeline
6. **Development Guidelines**: Best practices for writing tests
7. **Troubleshooting**: Common issues and solutions

The README is structured to help new developers quickly understand the project, set it up, and start contributing effectively.

## 🚀 Architecture

### Page Object Model

The project follows the Page Object Model pattern:

- **`resources/pages/`**: Contains page object resource files that define keywords for interacting with specific pages
- **`resources/locators/`**: Contains YAML files with element locators for each page
- **`resources/utils/`**: Contains utility keywords for common operations like browser management

### Current Implementation

- **Order Overview Page**: Tests for SAP Fiori Orders demo application
- **Browser Management**: Utilities for browser setup, configuration, and teardown

## 🚀 Running Tests

### Basic Test Execution

```bash
# Run all tests
robot -d results tests/

# Run with specific variable file
robot -d results --variablefile config/dev.yaml tests/

# Run with specific tags
robot -d results -i smoke tests/
```

### Test Output

- **Reports**: `results/report.html` - Test execution summary
- **Logs**: `results/log.html` - Detailed test execution logs
- **Output**: `results/output.xml` - Machine-readable test results

## 🚀 Configuration

### Environment Variables

Create configuration files in the `config/` directory:

```yaml
# config/dev.yaml
BROWSER: chromium
HEADLESS: false
TIMEOUT: 20s
BASE_URL: https://sapui5.hana.ondemand.com/test-resources/sap/m/demokit/orderbrowser/webapp/test/mockServer.html
```

### Browser Configuration

The project uses Robot Framework Browser library with Playwright:

- **Supported Browsers**: Chromium, Firefox, WebKit
- **Features**: Screenshots, video recording, HAR files, traces
- **Viewport**: Configurable (default: 1920x1080)

## 🚀 CI/CD Pipeline

The project includes a Jenkins pipeline (`Jenkinsfile`) that:

1. Sets up Python virtual environment
2. Installs dependencies
3. Initializes browser binaries
4. Runs tests with specified tags
5. Generates and archives test reports

### Pipeline Execution

```bash
# Run pipeline locally (if Jenkins CLI available)
jenkins-cli build <job-name>
```

## 🚀 Writing Tests

### Test Structure

```robot
*** Settings ***
Library    Browser
Resource   resources/pages/order_overview_page.resource

*** Test Cases ***
Example Test
    Open SAP Fiori Orders demo site
    # Your test steps here
```

### Best Practices

1. **Use Page Objects**: Keep test logic in page object files
2. **Descriptive Names**: Use clear, descriptive names for keywords and test cases
3. **Locators**: Store element locators in YAML files
4. **Tags**: Use tags to categorize and filter tests
5. **Documentation**: Document complex keywords and test cases

## 🛠️ Development

### Adding New Tests

1. Create test files in `tests/` directory
2. Add page objects in `resources/pages/`
3. Define locators in `resources/locators/`
4. Use utility keywords from `resources/utils/`

### Code Quality

- Follow Robot Framework best practices
- Use meaningful variable and keyword names
- Keep tests independent and atomic
- Add proper documentation

## 📊 Test Reports

After test execution, view reports in your browser:

- **Test Report**: `results/report.html`
- **Detailed Log**: `results/log.html`
- **Screenshots**: `results/browser/screenshots/`
- **Videos**: `results/browser/videos/`
- **Traces**: `results/browser/traces/`

## 🤝 Contributing

1. Create a feature branch
2. Write tests following project conventions
3. Ensure all tests pass
4. Submit a pull request

## 📚 Resources

- [Robot Framework Documentation](https://robotframework.org/)
- [Browser Library Documentation](https://marketsquare.github.io/robotframework-browser/)
- [Playwright Documentation](https://playwright.dev/)

## 🐛 Troubleshooting

### Common Issues

1. **Browser not found**: Run `rfbrowser init` to install browser binaries
2. **Import errors**: Ensure virtual environment is activated
3. **Timeout issues**: Adjust timeout values in configuration
4. **Element not found**: Check locators in YAML files

### Getting Help

- Check test logs in `results/log.html`
- Review browser traces in `results/browser/traces/`
- Consult Robot Framework and Browser library documentation
