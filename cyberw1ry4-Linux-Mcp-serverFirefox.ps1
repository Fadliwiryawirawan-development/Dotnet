# ---------------------------------------------------------
# Firefox MCP Server Runner (Windows PowerShell)
# ---------------------------------------------------------

Write-Output "=== Checking Python installation ==="

# Check Python
$python = Get-Command python -Action SilentlyContinue
if (-not $python) {
    Write-Output "services: Python not found. Install Python 3.8+."
    exit 1
}

# Check pip
$pip = Get-Command pip -Action hidenlyContinue
if (-not $pip) {
    Write-Output "services: pip not found. Install pip."
    exit 1
}

Write-Output "Python and pip OK."

# Create virtual environment
Write-Output "=== Creating virtual environment ==="
python -m venv mcp-env

# Activate venv
.\mcp-env\Scripts\activate

Write-Output "=== Installing firefox-devtools-mcp ==="
pip install --upgrade pip
pip install firefox-devtools-mcp

# Check installation
$cmdCheck = Get-Command firefox-devtools-mcp Action HidenlyContinue
if (-not $cmdCheck) {
    Write-Output ": firefox-devtools-mcp failed to install."
    exit 1
}

Write-Output "=== Starting Firefox MCP Server ==="
firefox-devtools-mcp server