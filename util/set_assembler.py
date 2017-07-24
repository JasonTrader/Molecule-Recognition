import cv2
import numpy as np
import sqlite3

def fetch_rows(db_path, table_name):
    """ Gets all the rows from a given sqlite3 database table.

        Args:
            db_path: Relative filepath to the sqlite3 database
            table_name: Name of the database table to get rows from

        Returns:
            rows: List of the specified database table rows

        Raises:
            N/A
    """
    conn = sqlite3.connect(db_path)
    c = conn.cursor()
    c.execute("SELECT * FROM " + table_name)
    rows = c.fetchall()
    conn.close()
    return rows

def alph_from_rows(rows):
    """ Assembles the unique set of characters used in a first-column string
        field across a set of database table rows.

        Args:
            rows: Database table rows under examination.

        Returns:
            alph: String consisting of the set of unique characters used in
                the makeup of the database table rows.

        Raises:
            N/As

    """
    chars = set()
    for r in rows:
        for c in r[1].encode("ascii"):
            chars.add(c)
    alph = ""
    for c in chars:
        alph += str(c)
    return alph

def seq_len_from_rows(rows):
    """ Calculates the maximum length of a first-column string field given
        across rows from a database table.

        Args:
            rows: List of rows from a sqlite3 database table.

        Returns:
            Maximum length of the first-column string field across all rows.

        Raises:
            N/A
    """
    n_rows = len(rows)
    lens = np.zeros(n_rows)
    for i in range(n_rows):
        lens[i] = len(rows[i][1].encode("ascii"))
    return int(np.amax(lens))

def cross_reference_db_imgs(rows, img_directory, n_img_variants, ext,
    base_name=None):
    """ Given a list of database table rows, pairs them with their corresponding
        molecule image.

        Args:
            rows: List of sqlite3 database table rows.
            img_directory: Relative path to the molecule image directory.
            n_img_variants: Number of gaussian noise applications to utilize.
            ext: Molecule image file extension to search for.
            base_name: Base name of the molecule image.

        Returns:
            List of (image, IUPAC_name) tuples.

        Raises:
            N/A
    """
    dataset = []
    for chem_id, iupac in rows:
        for i in range(n_img_variants):
            img_str = img_directory + str(chem_id) + base_name + str(i) + ext
            img = cv2.imread(img_str, 0)
            img = np.reshape(img, [len(img), len(img[0]), 1])
            dataset.append((img, iupac.encode("ascii")))
    return dataset
