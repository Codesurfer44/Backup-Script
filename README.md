Backup Script

  Introduction
  
  This script is designed to automate the process of backing up a source folder to a specific backup drive. It uses RoboCopy, a built-in Windows utility, to copy all files from a source folder (defined via an environment variable) to a           destination folder on a drive identified by its volume label (BackupDrive). The script ensures that the source folder is mirrored to the backup location with all files and subdirectories preserved.

  Features
  
  * Automatically identifies the backup drive by its volume label (BackupDrive).
  * Uses RoboCopy to mirror the source folder to the destination drive.
  * Supports retry and wait settings for reliable backup, even if the source or destination is temporarily unavailable.
  * Optionally creates the destination folder if it doesn’t exist.
  * Provides detailed error messages if the drive or folder is not found.

How to Use

  
  Prerequisites
  
  1. Set the Source Folder:
     * Define an environment variable called CodeSurfing_Backup to specify the folder you want to back up.
     * Example: If your folder is "C:\Documents", set "CodeSurfing_Backup=C:\Documents".
       
     To Set the Environment Variable (CodeSurfing_Backup)
     * Press Win + S (or click the search bar) and type Environment Variables, then click on Edit the system environment variables.
     * In the System Properties window, click the Environment Variables button.
       
       In the Environment Variables dialog:
     * Under User variables (or System variables, if you want all users on the system to access this variable), click New.
     * For Variable Name, enter CodeSurfing_Backup.
     * For Variable Value, enter the path to the folder you want to back up (e.g., C:\Documents).
     * Click OK to save and close the dialogs.
       
  2. Set the Backup Drive:
     * Ensure your backup drive is labeled BackupDrive. The script will use this label to identify the destination drive.
       
       To assign or verify the label:
       * Right-click your backup drive in "File Explorer > Properties."
       * Under the General tab, set the Label to "BackupDrive".

  3. Set the Destination Folder:

     * The script saves the backup to a folder defined in the line: [set "destination=%driveLetter%\Backup_Folder"]
     * By default, the backup will be saved in the folder Backup_Folder on the backup drive.
       
     To change the destination path:
       * Open the script (Backup_Script.bat) in a text editor (e.g., Notepad).
       * Modify the destination line to specify your desired folder. For example: [set "destination=%driveLetter%\Backup\MyBackupFolder"]
       * This will copy the files to the MyBackupFolder on the backup drive.
       * You can also back up directly to the root of the drive (e.g., X:\) by changing the line to: [set "destination=%driveLetter%\"]

  Running the Script

  1. Save the script file (Backup_Script.bat) to your preferred location.
  2. Double-click the script to run it.
  3. The script will:
     * Retrieve the source folder from the environment variable CodeSurfing_Backup.
     * Identify the backup drive by its volume label (BackupDrive).
     * Copy the contents of the source folder to the destination folder on the backup drive using RoboCopy.
    
  Script Behavior

  Source Folder: The source folder is defined by the CodeSurfing_Backup environment variable, which should point to the folder you want to back up.
 
  Destination Path: The backup will be stored in the Backup_Folder on the backup drive. You can change this folder path in the script.

  RoboCopy: The RoboCopy utility will copy all files and subdirectories from the source to the destination folder, ensuring an exact mirror of the source. The script includes options to:
  
  * /E: Copy all subdirectories, including empty ones.
  * /COPYALL: Copy all file attributes (including timestamps, security info, etc.).
  * /R:3: Retry up to 3 times on failed copies.
  * /W:5: Wait 5 seconds between retries.
  * /NFL, /NDL, /NJH, /NJS, /NS, /NC: Suppress various logs and information to streamline the output.

  Output Messages

  Drive Not Found: If the backup drive is not found by its volume label, you will see: [Volume label BackupDrive not found.] - In this case, ensure the backup drive is connected and properly labeled.

  Backup Success: If the backup completes successfully, the script will display progress information, showing files being copied. You can adjust the output verbosity by editing the RoboCopy parameters in the script.

  Notes

  * Free Space: Ensure the backup drive has sufficient free space to accommodate the entire source folder.
  * Customization: You can customize both the source folder and the destination folder by modifying the respective lines in the script. Adjust the CodeSurfing_Backup environment variable and the destination path.
  * Error Handling: The script includes basic error handling. If the backup drive is not found or there are issues with the RoboCopy operation, it will display a message and stop the script.

  Example Workflow

  1. Set your source folder path by creating the "CodeSurfing_Backup" environment variable.
  2. Ensure your backup drive is labeled "BackupDrive" in Windows.
  3. Modify the destination folder in the script if necessary.
  4. Run the script by double-clicking the "Backup_Script.bat" file.
  5. The script will copy all files from your source folder to the "Backup_Folder" on the backup drive (or another destination you specify).

  Task Automation

  You can automate the backup script to run periodically using Windows Task Scheduler.

/*Notes*/

  If you have any feedback, suggestions, or cool ideas to make this project even better, feel free to open an issue or submit a pull request!
