# Contributing to frappe-bench-docker

Thank you for your interest in contributing to frappe-bench-docker! 🎉

## How to Contribute

### 🐛 Reporting Bugs

If you find a bug, please open an issue with:
- A clear description of the problem
- Steps to reproduce the issue
- Your environment (OS, Docker version, etc.)
- Relevant logs or error messages

### 💡 Suggesting Features

Feature requests are welcome! Please:
- Check if the feature already exists or is planned
- Describe the use case and benefit
- Provide examples of how it would work

### 🔧 Code Contributions

1. **Fork** this repository
2. **Create** a feature branch: `git checkout -b feature/my-feature`
3. **Make** your changes
4. **Test** your changes thoroughly
5. **Commit** with a clear message: `git commit -m "Add feature: description"`
6. **Push** to your fork: `git push origin feature/my-feature`
7. **Submit** a pull request

### 🧪 Testing Changes

Before submitting a PR, please:

1. Test the setup process from scratch:
   ```bash
   # Clean up any existing setup
   docker compose down
   rm -rf frappe-bench mariadb-data .env cupsd.conf printers.conf
   
   # Test fresh setup
   ./setup.sh
   ```

2. Verify bench commands work:
   ```bash
   ./bench.sh "list-apps"
   ```

3. Check that the site is accessible at http://localhost:8080

### 📝 Documentation

When making changes:
- Update the README.md if needed
- Add comments to complex code
- Update examples if they change

### 🎯 Focus Areas

We especially welcome contributions in these areas:
- Improved error handling and logging
- Better Windows PowerShell support
- Additional helper scripts
- Documentation improvements
- Performance optimizations

## Development Guidelines

### Code Style
- Use clear, descriptive variable names
- Add comments for complex logic
- Follow existing patterns in the codebase

### Commit Messages
- Use present tense: "Add feature" not "Added feature"
- Keep first line under 50 characters
- Reference issues: "Fixes #123"

### Pull Request Guidelines
- Keep PRs focused on a single feature/fix
- Include tests if applicable
- Update documentation as needed
- Respond to review feedback promptly

## Questions?

If you have questions about contributing, feel free to:
- Open an issue for discussion
- Check existing issues and discussions
- Review the [Frappe Framework documentation](https://docs.frappe.io/)

Thank you for helping make frappe-bench-docker better! 🚀