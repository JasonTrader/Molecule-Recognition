import sqlite3
import random
from PIL import Image, ImageTk
import Tkinter as tk

conn = sqlite3.connect('mol.db')
c = conn.cursor()
for row in c.execute('select count(*) as num from mol;'):
    totnum = row[0]
i = 'start'
first = True
while i != 'q':
    if not first:
        img = Image.open(path)
        photo = ImageTk.PhotoImage(img)
        label = Label(image=photo)
        label.image = photo # keep a reference!
        label.pack()
    rownum = random.randint(0,totnum-1)
    c.execute('select * from mol LIMIT ' + str(rownum) + ',1;')
    print rownum
    path = 'images/' + str(c.fetchone()[0]) + '.png'
    i = raw_input()
    if not first:
        img.close()
    else:
        first = False

conn.close()
