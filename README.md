# OrganizeAlbumCovers

**Type:** Application-Specific Script

**Short Description:** Moves album covers to their corresponding folders.

**Use Case:** This script is helpful when album cover images are left behind after renaming or moving music files.

**Example:** 
```
KPOP
│   ├───AKMU
│   │   ├───AKMU 'SAILING' TOUR LIVE
│   │   ├───HAPPENING
│   │   ├───LOVE EPISODE
│   │   ├───AKMU - AKMU 'SAILING' TOUR LIVE
│   │   ├───AKMU - HAPPENING
│   │   ├───AKMU - LOVE EPISODE
```
**How it Works:**

1. **Identifies Folders:** Finds folders that start with "$ARTIST -". (e.g. AKMU - HAPPENING)
2. **Locates Covers:** Searches for album covers (e.g., cover.jpg) within these folders.
3. **Moves Covers:** Relocates the covers to the matching folder without the "$ARTIST -" prefix. (e.g. HAPPENING)

This is my first time creating a script to modify files within a large collection.
