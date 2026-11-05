#!/usr/bin/env bash

LOG_FILE="${1:-logs/auth.log}"
REPORT_DIR="reports"
REPORT_FILE="$REPORT_DIR/security_report.txt"

# Check whether the log file exists
if [[ ! -f "$LOG_FILE" ]]; then
    echo "Error: Log file not found: $LOG_FILE"
    exit 1
fi

# Create reports directory if needed
mkdir -p "$REPORT_DIR"

# Count login attempts
failed_count=$(grep -c "Failed password" "$LOG_FILE" || true)
accepted_count=$(grep -c "Accepted password" "$LOG_FILE" || true)

# Generate the report
{
    echo "LINUX FAILED LOGIN ANALYSIS REPORT"
    echo "=================================="
    echo "Log file: $LOG_FILE"
    echo "Generated: $(date)"
    echo

    echo "SUMMARY"
    echo "-------"
    echo "Failed login attempts: $failed_count"
    echo "Successful logins: $accepted_count"
    echo

    echo "FAILED ATTEMPTS BY SOURCE IP"
    echo "----------------------------"

    awk '/Failed password/ {
        for (i=1; i<=NF; i++) {
            if ($i=="from") print $(i+1)
        }
    }' "$LOG_FILE" | sort | uniq -c | sort -nr

    echo
    echo "FAILED ATTEMPTS BY USERNAME"
    echo "---------------------------"

    awk '/Failed password/ {
        for (i=1; i<=NF; i++) {
            if ($i=="for") {
                if ($(i+1)=="invalid") print $(i+3)
                else print $(i+1)
            }
        }
    }' "$LOG_FILE" | sort | uniq -c | sort -nr

} > "$REPORT_FILE"

echo "Analysis complete!"
echo "Report saved to: $REPORT_FILE"
