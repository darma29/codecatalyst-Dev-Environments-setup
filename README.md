# Setup script for CodeCatalyst Dev Environment 

This repository includes a simple setup script for configuring the codecatalyst development environment to make it convenient. The setup script automates the installation of commonly used tools and configurations.


## Usage

To set up the environment, run the following commands:

```sh
git clone https://github.com/darma29/codecatalyst-Dev-Environments-setup.git && cd codecatalyst-devenv-setup && chmod +x init_setup.bash && source init_setup.bash && cd codecatalyst-devenv-setup && chmod +x devfile_start.bash && ./devfile_start.bash

```

## Tools

The setup script installs the following tools:

- **[Starship](https://starship.rs/):** A minimal, blazing-fast, and infinitely customizable prompt for any shell.
- **[The Silver Searcher (ag)](https://github.com/ggreer/the_silver_searcher):** A fast code searching tool.
- **[Lazygit](https://github.com/jesseduffield/lazygit):** A simple terminal UI for Git commands.

## Troubleshooting

### Viewing devfile-related logs
Check the following log for devfile-related information:
```
/aws/mde/logs/devfile.log
```

### Checking devfile container status
Use the following command to check the status of the devfile container:
```sh
/aws/mde/mde status
```

### Starting the devfile after making changes
If you have made changes to the devfile, use the following command to start it:
```sh
/aws/mde/mde start --location devfile.yaml
```
