"""new migration

Revision ID: e04558e3bfdb
Revises: 20def5b0680b
Create Date: 2023-05-25 14:28:36.951106

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'e04558e3bfdb'
down_revision = '20def5b0680b'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('master_data',
    sa.Column('file_id', sa.Integer(), nullable=False),
    sa.Column('file_name', sa.String(length=100), nullable=False),
    sa.Column('file_type', sa.String(length=50), nullable=False),
    sa.Column('file_ext', sa.String(length=50), nullable=True),
    sa.Column('file_object', sa.BLOB(), nullable=True),
    sa.Column('user_id', sa.Integer(), nullable=True),
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created_at', sa.DateTime(), server_default=sa.text('now()'), nullable=True),
    sa.Column('updated_at', sa.DateTime(), nullable=True),
    sa.ForeignKeyConstraint(['user_id'], ['auth_user.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('demand_forecast',
    sa.Column('master_id', sa.Integer(), nullable=True),
    sa.Column('weekend', sa.DateTime(), nullable=False),
    sa.Column('month_no', sa.Integer(), nullable=False),
    sa.Column('month_week', sa.Integer(), nullable=False),
    sa.Column('article', sa.String(length=50), nullable=False),
    sa.Column('site', sa.String(length=50), nullable=False),
    sa.Column('user_id', sa.Integer(), nullable=True),
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created_at', sa.DateTime(), server_default=sa.text('now()'), nullable=True),
    sa.Column('updated_at', sa.DateTime(), nullable=True),
    sa.ForeignKeyConstraint(['master_id'], ['master_data.id'], ),
    sa.ForeignKeyConstraint(['user_id'], ['auth_user.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('vendor',
    sa.Column('master_id', sa.Integer(), nullable=True),
    sa.Column('vendor_id', sa.String(length=50), nullable=False),
    sa.Column('lead_time_avg', sa.Float(), nullable=False),
    sa.Column('lead_time_std_dev', sa.Float(), nullable=False),
    sa.Column('price', sa.Float(), nullable=False),
    sa.Column('order_cost', sa.Float(), nullable=False),
    sa.Column('stockout_cost', sa.Float(), nullable=False),
    sa.Column('user_id', sa.Integer(), nullable=True),
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created_at', sa.DateTime(), server_default=sa.text('now()'), nullable=True),
    sa.Column('updated_at', sa.DateTime(), nullable=True),
    sa.ForeignKeyConstraint(['master_id'], ['master_data.id'], ),
    sa.ForeignKeyConstraint(['user_id'], ['auth_user.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('vendor')
    op.drop_table('demand_forecast')
    op.drop_table('master_data')
    # ### end Alembic commands ###
