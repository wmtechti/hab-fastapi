from prisma import Prisma

def get_db():
    db = Prisma()
    db.connect()
    try:
        yield db
    finally:
        db.disconnect()
