import express from 'express';
import bodyParser from 'body-parser';
import bcrypt from 'bcrypt';
import admin from 'firebase-admin';
import fs from 'fs';

// Initialize Firebase Admin SDK
const serviceAccount = JSON.parse(
    await fs.promises.readFile(new URL('chatapp-87cc5-firebase-adminsdk-szqgz-bbb5f3bdc2.json', import.meta.url))
);

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: 'https://chatapp-87cc5-default-rtdb.europe-west1.firebasedatabase.app/'
});

const app = express();
const PORT = process.env.PORT || 3000;

app.use(bodyParser.json());

// Endpoint to receive email and password for registration
app.post('/register', async (req, res) => {
    const { email, password } = req.body;

    try {
        // Hash the password
        const hashedPassword = await bcrypt.hash(password, 10);

        // Save to Firebase
        const userRef = admin.database().ref('users').push();
        await userRef.set({
            email: email,
            password: hashedPassword
        });

        res.status(201).send({ message: 'User registered successfully' });
    } catch (error) {
        console.error('Error registering user:', error);
        res.status(500).send({ error: 'Failed to register user' });
    }
});

// Endpoint to log in a user
app.post('/login', async (req, res) => {
    const { email, password } = req.body;

    try { 
        const userSnapshot = await admin.database().ref('users').orderByChild('email').equalTo(email).once('value');
        if (!userSnapshot.exists()) {
            return res.status(404).send({ message: 'User not found' });
        }
        const userData = userSnapshot.val();
        const userId = Object.keys(userData)[0]; // Get the user ID
        const user = userData[userId];
        const passwordMatch = await bcrypt.compare(password, user.password);
        if (!passwordMatch) {
            return res.status(401).send({ message: 'Invalid credentials' });
        }

        // Login successful
        res.status(200).send({ message: 'Login successful' });
    } catch (error) {
        console.error('Error logging in user:', error);
        res.status(500).send({ error: 'Failed to log in user' });
    }
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
