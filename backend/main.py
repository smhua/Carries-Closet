# app.py

# Required imports
import os
from flask import Flask, request, jsonify
from firebase_admin import credentials, firestore, initialize_app, auth
from datetime import date

# Initialize Flask app
app = Flask(__name__)

# Initialize Firestore DB
cred = credentials.Certificate(os.environ['PATH_TO_KEY'])
default_app = initialize_app(cred)
db = firestore.client()
users_ref = db.collection('users')
requests_ref = db.collection('requests')


@app.route('/users/add', methods=['POST'])
@app.route('/users/create', methods=['POST'])
def add_user():
    """
        add_user() : Add document to Firestore collection with request body.
        Ensure you pass a custom ID as part of form body in post request,
        e.g. form={'id': '1', 'title': 'Write a blog post'}
    """
    try:
        id = request.form['id']
        # should include id, username, password, email, and permissions
        users_ref.document(id).set(request.form)
        return jsonify({"success": True}), 200
    except Exception as e:
        return f"An Error Occurred: {e}"


@app.route('/users', methods=['GET'])
def get_user():
    """
        get_user() : Fetches documents from Firestore collection as JSON.
    """
    try:
        # Check if ID was passed to URL query
        user_id = request.args.get('id')
        username = request.args.get('username')
        if user_id is None:
            for doc in users_ref.stream():
                if doc.get('username') == username:
                    user_id = doc.id
        if user_id:
            user = users_ref.document(user_id).get()
            return jsonify(user.to_dict()), 200
        else:
            # all_users = [doc.to_dict() for doc in users_ref.stream()]
            return jsonify("No user found matching given parameters."), 200
    except Exception as e:
        return f"An Error Occurred: {e}"


@app.route('/users/update', methods=['PUT', 'PATCH'])
@app.route('/users/edit', methods=['PUT', 'PATCH'])
def update_user():
    """
        update_user() : Update document in Firestore collection with request body.
        Ensure you pass a custom ID as part of form body in post request,
        e.g. form={'id': '1', 'title': 'Write a blog post today'}
    """
    try:
        document_id = request.args.get('id')
        if document_id is None:
            username = request.args.get('username')
            for doc in users_ref.stream():
                if doc.get('username') == username:
                    document_id = doc.id
        users_ref.document(document_id).update(request.form)
        return jsonify({"success": True}), 200
    except Exception as e:
        return f"An Error Occurred: {e}"


@app.route('/users/remove', methods=['DELETE'])
@app.route('/users/delete', methods=['DELETE'])
def delete_user():
    """
        delete_user() : Delete a document from Firestore collection.
    """
    try:
        # Check for ID in URL query
        document_id = request.args.get('id')
        if document_id is None:
            username = request.args.get('username')
            for doc in users_ref.stream():
                if doc.get('username') == username:
                    document_id = doc.id
        users_ref.document(document_id).delete()
        return jsonify({"success": True}), 200
    except Exception as e:
        return f"An Error Occurred: {e}"


@app.route('/requests/hygiene/create', methods=['POST'])
@app.route('/requests/hygiene/add', methods=['POST'])
def create_hygiene_request():
    try:
        # Check for ID in form data
        document_id = request.form.get('id')
        # Expect: id, address, age, city, state, gender, item, notes, size, zip
        if document_id is None:
            return jsonify("No document ID provided in the form request."), 200
        form_data = request.form.to_dict()
        form_data['date'] = date.today().strftime("%m/%d/%Y")  # MM/DD/YYYY
        form_data['type'] = 'hygiene'
        form_data['status'] = 'submitted'
        requests_ref.document(document_id).set(form_data)
        return jsonify({"success": True}), 200
    except Exception as e:
        return f"An Error Occurred: {e}"


@app.route('/requests/clothing/create', methods=['POST'])
@app.route('/requests/clothing/add', methods=['POST'])
def create_clothing_request():
    try:
        # Check for ID in form data
        document_id = request.form.get('id')
        # Expect: id, address, age, city, state, gender, item, notes, size, zip
        # Might be able to grab age, city, state, etc from user profile information, so
        # later change to sending user in request instead of demographic information needing to be resubmitted 24/7
        if document_id is None:
            return jsonify("No document ID provided in the form request."), 200
        form_data = request.form.to_dict()
        form_data['date'] = date.today().strftime("%m/%d/%Y")  # MM/DD/YYYY
        form_data['type'] = 'clothing'
        form_data['status'] = 'submitted'
        requests_ref.document(document_id).set(form_data)
        return jsonify({"success": True}), 200
    except Exception as e:
        return f"An Error Occurred: {e}"


@app.route('/requests/clothing', methods=['GET'])
@app.route('/requests/clothing/list', methods=['GET'])
def list_clothing_requests():
    try:
        # Check for ID in request args
        document_id = request.args.get('id')
        if document_id is None:
            all_requests = [doc.to_dict() for doc in requests_ref.stream()]
            removed_documents = []
            for i in range(len(all_requests)):
                request_document = all_requests[i]
                if request_document['type'].lower() != 'clothing':
                    removed_documents.append(request_document)
            for document in removed_documents:
                all_requests.remove(document)
            return jsonify(all_requests), 200
        else:
            return jsonify(requests_ref.document(document_id).get().to_dict()), 200
    except Exception as e:
        return f"An Error Occurred: {e}"


@app.route('/requests/hygiene', methods=['GET'])
@app.route('/requests/hygiene/list', methods=['GET'])
def list_hygiene_requests():
    try:
        # Check for ID in request args
        document_id = request.args.get('id')
        if document_id is None:
            all_requests = [doc.to_dict() for doc in requests_ref.stream()]
            removed_documents = []
            for i in range(len(all_requests)):
                request_document = all_requests[i]
                if request_document['type'].lower() != 'hygiene':
                    removed_documents.append(request_document)
            for document in removed_documents:
                all_requests.remove(document)
            return jsonify(all_requests), 200
        else:
            return jsonify(requests_ref.document(document_id).get().to_dict()), 200
    except Exception as e:
        return f"An Error Occurred: {e}"


@app.route('/requests', methods=['GET'])
@app.route('/requests/list', methods=['GET'])
def list_all_requests():
    try:
        # Check for ID in request args
        document_id = request.args.get('id')
        if document_id is None:
            all_requests = [doc.to_dict() for doc in requests_ref.stream()]
            return jsonify(all_requests), 200
        else:
            return jsonify(requests_ref.document(document_id).get().to_dict()), 200
    except Exception as e:
        return f"An Error Occurred: {e}"


@app.route('/requests/remove', methods=['DELETE'])
@app.route('/requests/delete', methods=['DELETE'])
def remove_request():
    try:
        # Check for ID in URL query
        document_id = request.args.get('id')
        requests_ref.document(document_id).delete()
        return jsonify({"success": True}), 200
    except Exception as e:
        return f"An Error Occurred: {e}"


@app.route('/requests/edit', methods=['PUT', 'PATCH'])
@app.route('/requests/update', methods=['PUT', 'PATCH'])
def update_request():
    try:
        document_id = request.args.get('id')
        requests_ref.document(document_id).update(request.form)
        return jsonify({"success": True}), 200
    except Exception as e:
        return f"An Error Occurred: {e}"


port = int(os.environ.get('PORT', 8080))
if __name__ == '__main__':
    app.run(threaded=True, host='0.0.0.0', port=port)
