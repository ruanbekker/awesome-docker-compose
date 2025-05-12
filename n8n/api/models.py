from sqlalchemy import Column, Integer, String
from database import Base

class Joke(Base):
    __tablename__ = 'jokes'
    id = Column(Integer, primary_key=True, index=True)
    content = Column(String, nullable=False)

