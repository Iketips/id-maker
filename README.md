# School ID Maker

A browser-based school ID site for managing a student roster and preparing printable ID cards. It has no server or package installation requirements.

## Local ID database

The app stores student records, photos, organization details, signatures, card templates, and front/back object designs in a local IndexedDB database named `schoolIdMaker`. Each student's record is stored separately from app settings and card designs. Existing data in the older `schoolIdMaker.v1` browser-storage format is migrated to the database the first time the app opens.

The database is local to the browser profile and device; it works offline but is not shared between computers or browsers. Online sync is not configured. Export a CSV backup of the roster before clearing browser data or removing the app.

## Windows desktop app

Run `SchoolIdMaker.exe` to open the designer in a standalone Microsoft Edge app window. Microsoft Edge is required. The executable contains the current website and extracts it into `%LOCALAPPDATA%\SchoolIdMaker` when launched; your roster and designs remain saved in the Edge profile on this computer.

This build is unsigned. Windows Application Control or other managed-device policies may block it; only an authorized code-signing certificate can make a signed distribution for those environments.

To rebuild the executable from source on Windows with PowerShell and the PS2EXE module installed, run:

```powershell
Import-Module ps2exe
Invoke-ps2exe -inputFile .\SchoolIdMakerApp.ps1 -outputFile .\SchoolIdMaker.exe -embedFiles @{"%LOCALAPPDATA%\SchoolIdMaker\index.html"="$((Resolve-Path .\index.html).Path)"} -noConsole -title "School ID Maker" -description "Windows desktop school ID designer" -product "School ID Maker" -version "1.0.0.0"
```

The browser version can still be opened directly from `index.html` or hosted as a static site.

## Open the site

Open `index.html` in a modern web browser. For predictable browser storage behavior and for hosting, you can also serve the folder with any static web server.

## Features

- Add, edit, search, and delete student records.
- Generate sequential student IDs and prevent duplicate IDs.
- Add a student photo; the browser resizes it before saving.
- Configure the school name and school year shown on each card.
- Customize the front with seven templates—Classic, Modern, Minimal, Campus, Bold, Diagonal, and Heritage—and choose a separate back layout: Classic, Centered, Bordered, or Contact Panel.
- Set colors, font, text size, weight, and style independently for the front and back; front and back text alignment is also controlled separately.
- Design either side with a freeform editor: add and format text, squares, circles, lines, uploaded images, student fields, and authority fields; drag to position, resize, reorder, and delete objects.
- Use the **Design front** and **Design back** controls to edit each side separately. Each side has its own objects and its own custom-layout toggle, so you can use a custom design on one side and a template on the other; printing matches both previews.
- Upload a picture of an existing ID's front and back separately, then select **Generate ID** to use each image as that side's card-sized design. Each uploaded picture stays local to the browser and can be overlaid with editable objects or removed.
- Add organization contact details and an authority name/title for the plain card back.
- Upload an authority signature image or leave a line for signing after printing; saved signatures can be removed.
- Preview both sides of an ID card and print front and back as separate card-sized pages.
- Export the roster as a CSV file.
- Store student records, photos, signatures, and card designs in the browser's local IndexedDB database on this device.

Data is not uploaded or synchronized. Clearing this browser's saved site data removes the local database, so use CSV export for roster backups.
