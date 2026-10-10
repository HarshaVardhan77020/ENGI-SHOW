from flask import Flask, request, jsonify, render_template
import sqlite3

app = Flask(__name__)
DATABASE = "database.db"


def get_db():
    connection = sqlite3.connect(DATABASE)
    connection.row_factory = sqlite3.Row
    return connection


def create_tables():
    db = get_db()

    db.execute("""
        CREATE TABLE IF NOT EXISTS students (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT UNIQUE NOT NULL,
            phone TEXT NOT NULL,
            branch TEXT NOT NULL
        )
    """)

    db.execute("""
        CREATE TABLE IF NOT EXISTS quiz_scores (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            student_id INTEGER,
            subject TEXT NOT NULL,
            score INTEGER NOT NULL,
            FOREIGN KEY(student_id) REFERENCES students(id)
        )
    """)

    db.commit()
    db.close()


@app.route("/")
def home():
    return render_template("index.html")


@app.route("/register", methods=["POST"])
def register():
    data = request.json or {}

    name = data.get("name")
    email = data.get("email")
    phone = data.get("phone")
    branch = data.get("branch")

    if not name or not email or not phone or not branch:
        return jsonify({
            "success": False,
            "message": "All fields are required"
        }), 400

    try:
        db = get_db()

        db.execute("""
            INSERT INTO students (name, email, phone, branch)
            VALUES (?, ?, ?, ?)
        """, (name, email, phone, branch))

        db.commit()
        student_id = db.execute(
            "SELECT last_insert_rowid()"
        ).fetchone()[0]

        db.close()

        return jsonify({
            "success": True,
            "message": "Registration successful",
            "student_id": student_id
        })

    except sqlite3.IntegrityError:
        return jsonify({
            "success": False,
            "message": "Email already registered"
        }), 400


@app.route("/students", methods=["GET"])
def students():
    db = get_db()
    students = db.execute("SELECT * FROM students").fetchall()
    db.close()

    return jsonify([dict(student) for student in students])


@app.route("/quiz", methods=["POST"])
def save_quiz():
    data = request.json or {}

    student_id = data.get("student_id")
    subject = data.get("subject")
    score = data.get("score")

    if not student_id or not subject or score is None:
        return jsonify({
            "success": False,
            "message": "Missing quiz information"
        }), 400

    db = get_db()

    db.execute("""
        INSERT INTO quiz_scores (student_id, subject, score)
        VALUES (?, ?, ?)
    """, (student_id, subject, score))

    db.commit()
    db.close()

    return jsonify({
        "success": True,
        "message": "Quiz score saved"
    })


@app.route("/quiz/<int:student_id>", methods=["GET"])
def get_scores(student_id):
    db = get_db()

    scores = db.execute("""
        SELECT subject, score
        FROM quiz_scores
        WHERE student_id = ?
    """, (student_id,)).fetchall()

    db.close()

    return jsonify([dict(score) for score in scores])


@app.route("/branches", methods=["GET"])
def branches():
    return jsonify([
        "Computer Science Engineering",
        "Information Technology",
        "Electronics and Communication Engineering",
        "Electrical and Electronics Engineering",
        "Mechanical Engineering",
        "Civil Engineering",
        "Artificial Intelligence and Data Science"
    ])


if __name__ == "__main__":
    create_tables()
    app.run(debug=True, host="0.0.0.0", port=5000)
