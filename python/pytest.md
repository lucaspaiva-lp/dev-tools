# Pytest – Quick Guide

## Purpose

`pytest` is a testing framework for Python used to write, run, and organize automated tests.

It is widely adopted in backend projects and integrates well with CI pipelines.

---

## Basic Commands

| Command                       | Explanation                                                |
| ----------------------------- | ---------------------------------------------------------- |
| `pytest`                    | Runs all tests discovered automatically                    |
| `pytest path/to/tests`      | Runs tests only in the specified path                      |
| `pytest -v`                 | Verbose output (shows each test name)                      |
| `pytest -s`                 | Shows `print()`output during tests                       |
| `pytest -s -v`              | Verbose output + shows prints (most common in development) |
| `pytest -s -v path/to/repo` | Runs tests from a specific directory with full output      |

---

## Test Selection

| Command                 | Explanation                             |
| ----------------------- | --------------------------------------- |
| `pytest test_file.py` | Runs tests from a single file           |
| `pytest -k "name"`    | Runs tests that match a name pattern    |
| `pytest -k "user"`    | Example: runs tests related to “user” |

---

## Failure Handling

| Command                | Explanation                          |
| ---------------------- | ------------------------------------ |
| `pytest -x`          | Stops execution at the first failure |
| `pytest --maxfail=1` | Stops after one failure (explicit)   |

---

## Debugging

| Command               | Explanation              |
| --------------------- | ------------------------ |
| `pytest --tb=short` | Shorter traceback        |
| `pytest --tb=long`  | Full traceback (default) |

---

## Coverage (when using plugins)

> Requires `pytest-cov`

| Command              | Explanation                        |
| -------------------- | ---------------------------------- |
| `pytest --cov`     | Shows test coverage summary        |
| `pytest --cov=src` | Measures coverage only for `src` |

---

## Notes

* Test files must start with `test_`
* Test functions must start with `test_`
* Pytest discovers tests automatically
* No boilerplate required
