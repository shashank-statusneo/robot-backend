import os
from datetime import timedelta

import yaml

from yaml.loader import Loader

basedir = os.path.abspath(os.path.dirname(__file__))

env = os.getenv("FLASK_ENV") or "dev"


def construct_timedelta(loader, node):
    """
    A custom constructor that is used to parse the YAML tag !timedelta in the configuration
    file and convert it into a Python timedelta object.
    :param loader:
    :param node:
    :return:
    """
    value = loader.construct_scalar(node)
    return timedelta(**{value.split()[1]: int(value.split()[0])})


yaml.add_constructor(
    "!timedelta", construct_timedelta
)  # handle timedelta in yaml file.

with open(os.path.join(basedir, env + ".yaml")) as config_file:
    config = yaml.load(config_file, Loader=Loader)


def serialize(cls):
    return {
        attr: getattr(cls, attr)
        for attr in dir(cls)
        if not callable(getattr(cls, attr)) and not attr.startswith("__")
    }


class Config:
    SQLALCHEMY_DATABASE_URI = os.environ.get("DATABASE_URL")
    JWT_SECRET_KEY = os.environ.get("SECRET_KEY")
    JWT_ACCESS_TOKEN_EXPIRES = config.get("JWT_ACCESS_TOKEN_EXPIRES")
    JWT_REFRESH_TOKEN_EXPIRES = config.get("JWT_REFRESH_TOKEN_EXPIRES")
    SECRET_KEY = os.environ.get("SECRET_KEY")
    PROPAGATE_EXCEPTIONS = config.get("PROPAGATE_EXCEPTIONS")


class DevConfig(Config):
    DEBUG = True


class ProdConfig(Config):
    DEBUG = False


class TestConfig(Config):
    DEBUG = True


config_by_name = dict(
    dev=serialize(DevConfig),
    test=serialize(TestConfig),
    prod=serialize(ProdConfig),
)
