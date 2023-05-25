"""new migration

Revision ID: 90fbead851ad
Revises: e04558e3bfdb
Create Date: 2023-05-25 14:31:24.616653

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = '90fbead851ad'
down_revision = 'e04558e3bfdb'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('master_data', schema=None) as batch_op:
        batch_op.drop_column('file_id')

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('master_data', schema=None) as batch_op:
        batch_op.add_column(sa.Column('file_id', mysql.INTEGER(), autoincrement=False, nullable=False))

    # ### end Alembic commands ###
