# Known Errors:
1. When album name as special characters in it.
    - Originally, the folders replaced it with "_"
    - mp3tag replaces the special characters with nothing.
    - Result: Mismatch in folder, image is moved but script places it in an uninitialized folder (acts as a file)
2. When the artist has "()" in the name
    - Does not process the folder
3. When the artist name has "-" in it 
    - Parses on the the name preceeding the "-" character
4. When folders have more subfolders in it. (Albums containing CD 1 and CD 2)
