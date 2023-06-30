# Robot Framework Example using Python in Flask framework

## Server Setup

- Install Python 3.10
- Create and activate Virtual Environment

  ```commandline
    python -m venv env
  ```

- Activate Virtual Environment

  ```commandline
  env\Scripts\activate --windows
  source env\lib\activate -- linux\macos
  ```

- Install requirements

  ```commandline
  pip install -r requirements.txt
  ```

- Create a file at root directory path with name **_.env_** with these keys.

```doctest
export FLASK_DEBUG = True
export FLASK_ENV = dev
export FLASK_APP = app.py
export DATABASE_URL=mysql+mysqlconnector://[username]:[password]@[host]:[port]/robot
export SECRET_KEY=[your_secret_key]
```

## Database Setup

- Install MySQL Server
- Start MySQL Server
- Create a main database with name **_robot_**

- Migrate Database

```commandline
flask db init
flask db migrate -m "migration message"
flask db upgrade
```

If facing error like **Error: Target database is not up-to-date.**
in **flask db migrate** command then run these commands.

```commandline
flask db stamp head
flask db migrate -m "migration message"
flask db upgrade
```

- Upgrade or Downgrade and particular migration version

```commandline
flask db upgrade 'migration_version'
```

```commandline
flask db downgrade 'migration_version'
```

- Run Server

```commandline
flask run
```
