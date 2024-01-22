"""Token rename column refreshtoken

Revision ID: 635e1c7ab4cc
Revises: 8349f456c3df
Create Date: 2023-11-03 19:22:02.728009

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = "635e1c7ab4cc"
down_revision: Union[str, None] = "8349f456c3df"
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column("Token", sa.Column("refreshToken", sa.String(), nullable=True))
    op.drop_index("ix_Token_accesToken", table_name="Token")
    op.create_index(
        op.f("ix_Token_refreshToken"), "Token", ["refreshToken"], unique=True
    )
    op.drop_column("Token", "accesToken")
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column(
        "Token",
        sa.Column("accesToken", sa.VARCHAR(), autoincrement=False, nullable=True),
    )
    op.drop_index(op.f("ix_Token_refreshToken"), table_name="Token")
    op.create_index("ix_Token_accesToken", "Token", ["accesToken"], unique=False)
    op.drop_column("Token", "refreshToken")
    # ### end Alembic commands ###
