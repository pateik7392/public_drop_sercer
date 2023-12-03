@echo off

:: Redirect the directory structure to a temporary text file
dir /s /b /o:gn > dir_structure.txt

:: Use the tree command to display the hierarchical structure
tree /f > tree_structure.txt

:: Filter and display the tree structure, excluding lines with "dir_structure.txt" and "tree_structure.txt"
findstr /v /c:"dir_structure.txt" /c:"tree_structure.txt" tree_structure.txt

:: Clean up temporary files
del dir_structure.txt
del tree_structure.txt

pause
