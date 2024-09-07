@echo off

REM Check if Python virtual environment exists
if exist env (
    echo Python virtual environment exists.
) else (
    python -m venv env
)

REM Activate the virtual environment
call env\Scripts\activate.bat

REM Install dependencies from requirements.txt
pip install -r requirements.txt

REM Check if logs directory exists
if exist logs (
    echo Log folder exists.
) else (
    mkdir logs
    type nul > logs\error.log
    type nul > logs\access.log
)

REM Change permissions (Windows doesn't need chmod; adjust if necessary)
REM In Windows, permissions are different from Linux. You don't need to use 'chmod'.
