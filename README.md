# Linux Failed Login Analyzer

A Bash-based Linux security tool that analyzes SSH authentication logs, identifies failed login attempts, extracts suspicious source IP addresses, and generates a security report.

## Project Overview

The Linux Failed Login Analyzer is a beginner-friendly cybersecurity project designed to demonstrate practical Linux system administration, Bash scripting, and security log analysis.

It helps identify repeated failed SSH login attempts and summarizes authentication activity for further investigation.

## Features

- Detects failed SSH login attempts.
- Counts successful login attempts.
- Extracts source IP addresses associated with failed logins.
- Identifies usernames targeted by failed attempts.
- Ranks IP addresses by failed login frequency.
- Generates an automated security report.
- Handles missing and empty log files.
- Supports relative and absolute log-file paths.

## Technologies Used

- **Operating System:** Kali Linux
- **Language:** Bash
- **Tools:** grep, awk, sort, uniq, chmod, Git
- **Log Source:** Linux SSH authentication logs

## Project Structure

```text
linux-failed-login-analyzer/
├── analyzer.sh
├── .gitignore
├── README.md
├── logs/
│   ├── auth.log
│   ├── empty.log
│   └── success-only.log
└── reports/
    └── .gitkeep
```

## Installation

Clone the repository:

```bash
git clone https://github.com/YOUR-USERNAME/linux-failed-login-analyzer.git
```

Navigate into the project:

```bash
cd linux-failed-login-analyzer
```

Make the script executable:

```bash
chmod +x analyzer.sh
```

## Usage

Run the analyzer using the default sample log:

```bash
./analyzer.sh
```

Analyze a specific log file:

```bash
./analyzer.sh logs/auth.log
```

You can also provide an absolute path:

```bash
./analyzer.sh "$PWD/logs/auth.log"
```

View the generated report:

```bash
cat reports/security_report.txt
```

## Sample Results

Using the included fictional authentication log:

| Metric | Result |
|---|---:|
| Failed login attempts | 9 |
| Successful logins | 3 |
| Most frequent failed-login source | 192.0.2.10 |
| Attempts from that source | 5 |

### Failed Attempts by IP

| Source IP | Failed attempts |
|---|---:|
| 192.0.2.10 | 5 |
| 192.0.2.30 | 2 |
| 192.0.2.40 | 1 |
| 192.0.2.60 | 1 |

## Security Considerations

Repeated failed login attempts can indicate suspicious authentication activity, but they do not independently prove a brute-force attack.

Further investigation should consider timestamps, targeted accounts, successful logins, and other available security evidence.

The included IP addresses are fictional documentation addresses used for testing.

Never publish real authentication logs containing sensitive information.

## Current Limitations

- Designed for the sample SSH log format.
- Does not automatically block suspicious IP addresses.
- Does not perform real-time monitoring.
- Does not independently confirm brute-force attacks.

## Future Improvements

- Add configurable alert thresholds.
- Detect repeated attempts within time windows.
- Support additional authentication log formats.
- Generate CSV reports.
- Add automated security alerts.
- Improve input validation and error handling.

## Learning Outcomes

Through this project, I practised:

- Linux command-line operations.
- Bash scripting and automation.
- SSH authentication log analysis.
- Text processing using grep and awk.
- IP address extraction and frequency analysis.
- Linux file permissions.
- Git version control.

---

**Author:** stephan-js

**Project Type:** Cybersecurity | Linux | Bash Scripting | Blue Team | SOC Fundamentals
# linux-failed-login-analyzer
# linux-failed-login-analyzer
