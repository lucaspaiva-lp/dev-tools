# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to Semantic Versioning.

---

## [Unreleased]

### Added

- Menu interface for main system (`introduction_page`)
- Song registration view and controller
- Playlist creation view and controller
- Music entity and in-memory repository (singleton pattern)

### Changed / Refactored

- Translated all Portuguese strings to English
- Corrected indentation and formatting issues
- Added minimal, professional comments to classes and methods
- Refactored imports and project structure for proper package handling
- Resolved circular imports in `SongRegisterController`
- Ensured `start()` loop integrates all flows cleanly

### Notes

- All logic preserved; only refactors, translations, and code hygiene applied
- No persistent storage yet; in-memory repository remains
- Run the system with `python3 -m src.run` for proper package resolution

---

## [0.x.x] - year-mm-dd

### Added

- Complete workflow for song registration and playlist creation
- Integration of controllers, views, and in-memory repository
- User-friendly terminal interface

### Changed / Refactored

- Clean code improvements: comments, naming, and formatting
- Imports standardized for Python package compatibility

### Notes

- Ready for production-level testing in memory
- No database persistence yet; future versions may add persistent storage
