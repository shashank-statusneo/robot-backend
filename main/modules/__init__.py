from flask_jwt_extended import JWTManager
from flask_restx import Api

from main.modules.auth.view import auth_namespace
from main.modules.jwt.controller import JWTController
from main.modules.user.view import user_namespace

jwt = JWTManager()
api = Api()

jwt.token_in_blocklist_loader(JWTController.token_revoked_check)


api.add_namespace(auth_namespace)
api.add_namespace(user_namespace)
