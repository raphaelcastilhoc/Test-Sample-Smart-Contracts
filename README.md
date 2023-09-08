# Olympix Integrated Security

## Overview

Olympix Integrated Security action allows integration of GitHub projects with Olympix vulnerability analyzer. The action performs code analysis on projects written in Solidity. By using this action, developers can find potentially dangerous vulnerabilities when CI workflow runs.

## Features

- **Code Scanning:** Quickly scan your Github project for vulnerabilities
- **Detailed Results:** View detailed results in different formats, directly on GitHub workflow console or on GitHub Code Scanning tool
- **Customizable Rules:** Customize the scanning rules to fit your requirements

## Getting Started

1. Add a GitHub repository secret with name OLYMPIX_API_TOKEN and value with your API token
2. Add olympix/integrated-security GitHub action in your workflow
3. (Optional) If necessary, customize the scanning rules using the input 'args'

## Usage

Here's a workflow example that utilizes the Olympix Integrated Security action with default rules and uploads the result to the GitHub Code Scanning tool.

```shell
name: Example Workflow
on: push
jobs:
  security:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3
      
      - name: Run Olympix Integrated Security
        uses: olympix/integrated-security@main
        env:
          OLYMPIX_API_TOKEN: ${{ secrets.OLYMPIX_API_TOKEN }}

      - name: Upload result to GitHub Code Scanning
        uses: github/codeql-action/upload-sarif@v2
        with:
          sarif_file: olympix.sarif
```

## Support Contact

If you have any question, feedback, or need help, feel free to contact us at contact@olympix.ai
