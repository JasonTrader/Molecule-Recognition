import sqlite3

with open('statements.txt') as f:
    content = f.readlines()
conn = sqlite3.connect('mol.db')
c = conn.cursor()
for line in content:
    print line
    c.execute(line)
conn.commit()
conn.close()
