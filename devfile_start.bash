#!/bin/bash

# Define colors
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NO_COLOR='\033[0m'

# Install inotify-tools
echo -e "\n${GREEN}Install inotify-tools${NO_COLOR}\n"
sudo dnf -y install inotify-tools

# Display the command being executed
echo -e "\n${GREEN}Executing command: /aws/mde/mde start --location devfile.yaml${NO_COLOR}\n"
# Execute the command
/aws/mde/mde start --location devfile.yaml

# Display a prompt for the status check
echo -e "\n${CYAN}Displaying status...${NO_COLOR}\n"
# Display the status
echo -e "${GREEN}Executing command: /aws/mde/mde status${NO_COLOR}\n"
/aws/mde/mde status

# Display a prompt for listing log files
echo -e "\n${CYAN}Listing log files...${NO_COLOR}\n"
echo -e "${GREEN}Executing command: ls /aws/mde/logs/${NO_COLOR}\n"
ls /aws/mde/logs/

# # Display a prompt for showing the contents of log files
# echo -e "\n${CYAN}Displaying the contents of log files...${NO_COLOR}\n"
# for log_file in /aws/mde/logs/*; do
#     echo -e "${GREEN}Executing command: tail $log_file${NO_COLOR}\n"
#     # tail "$log_file"
# done

# Display a prompt for showing the contents of log files
echo -e "\n${CYAN}Displaying the contents of log files...${NO_COLOR}\n"
for log_file in /aws/mde/logs/*; do
    case "$(basename "$log_file")" in
        devfile.log)
            TIMEOUT=5
            ;;
        devfileCommand.log)
            TIMEOUT=30
            ;;
        *)
            TIMEOUT=10
            ;;
    esac
    echo -e "${GREEN}Executing command: tail -f $log_file with timeout $TIMEOUT seconds${NO_COLOR}\n"
    tail -f "$log_file" &
    TAIL_PID=$!

    while inotifywait -q -e modify -t "$TIMEOUT" "$log_file" >/dev/null 2>&1; do
        :
    done

    kill $TAIL_PID
done
