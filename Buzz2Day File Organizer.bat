@echo off
setlocal EnableDelayedExpansion

:: Define extensions and folder mapping
set "image_ext=jpg jpeg png gif bmp"
set "video_ext=mp4 avi mkv mov"
set "document_ext=pdf doc docx txt xls xlsx ppt pptx"
set "audio_ext=mp3 wav flac aac"
set "compressed_ext=zip rar 7z tar gz"

:: Loop through all files in the current directory
for %%F in (*) do (
    if not "%%~xF"=="" (
        set "folder_name=Other"
        set "ext=%%~xF"
        set "ext=!ext:~1!"
        
        for %%E in (%image_ext%) do if /I "!ext!" equ "%%E" set "folder_name=Image"
        for %%E in (%video_ext%) do if /I "!ext!" equ "%%E" set "folder_name=Video"
        for %%E in (%document_ext%) do if /I "!ext!" equ "%%E" set "folder_name=Document"
        for %%E in (%audio_ext%) do if /I "!ext!" equ "%%E" set "folder_name=Audio"
        for %%E in (%compressed_ext%) do if /I "!ext!" equ "%%E" set "folder_name=Compressed"
        
        set "final_folder=Buzz2Day Tech (!folder_name!)"
        if not exist "!final_folder!" mkdir "!final_folder!"
        move "%%F" "!final_folder!" >nul
    )
)

echo Files have been organized into respective folders.
pause
