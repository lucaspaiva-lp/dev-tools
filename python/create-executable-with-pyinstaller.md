### Create a virtual environment (inside the repo or calculator folder)

python -m venv .venv

---

### Activate it

source .venv/bin/activate

### Install PyInstaller inside the venv

pip install pyinstaller

### Build the executable

pyinstaller --onefile --noupx file_name.py

#### Executable will be in:

dist/{file}

### Deactivate when done

deactivate
