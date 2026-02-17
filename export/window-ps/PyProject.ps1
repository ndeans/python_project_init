# Prompt for project name
$projectName = Read-Host "Enter project name"
if ([string]::IsNullOrEmpty($projectName)) {
    Write-Host "No project name provided. Exiting."
    exit
}
# Create directory
New-Item -ItemType Directory -Path $projectName | Out-Null
Set-Location $projectName
# Create virtual environment
python -m venv venv
.\venv\Scripts\Activate.ps1
# Create basic files
"# $projectName" | Out-File README.md -Encoding UTF8
New-Item -ItemType File -Name requirements.txt | Out-Null
New-Item -ItemType Directory -Name src | Out-Null
New-Item -ItemType File -Name src\__init__.py | Out-Null
# Initialize git
git init | Out-Null
Write-Host "Python project '$projectName' created successfully."
Write-Host "Virtual environment activated. Start coding inside src\!"