from flask import Flask, request, render_template
import mysql.connector

app = Flask(__name__)

# Connect to your MySQL RDS database
# Replace 'your_host', 'your_username', 'your_password', and 'your_database' with your actual credentials
conn = mysql.connector.connect(
    host='terraform-20240315075336550500000001.c7ai8gg087tc.us-east-1.rds.amazonaws.com',
    port= 3306,
    user='admin',
    password='password',
    database = 'mydb'
)

cursor = conn.cursor()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def submit():
    name = request.form['name']

    # Insert the user input into the database
    insert_query = "INSERT INTO mydb.names (name) VALUES (%s)"
    cursor.execute(insert_query, (name,))
    conn.commit()

    return render_template('submit.html', name=name)

if __name__ == '__main__':
    app.run(debug=True)
