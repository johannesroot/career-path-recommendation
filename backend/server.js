const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const { exec } = require('child_process'); // To run the Prolog script

const app = express();
app.use(cors());
app.use(bodyParser.json());

const PROLOG_FILE = './logic/logic.pl'; // Path to your Prolog file

// Helper function to standardize input
const standardizeInput = (value) => value.toLowerCase().replace(/\s+/g, '_');

// API Endpoint to get recommendation
app.post('/api/recommend', (req, res) => {
  // Standardize input values
  const skill = standardizeInput(req.body.skill);
  const futureCareer = standardizeInput(req.body.futureCareer);
  const academicBackground = standardizeInput(req.body.academicBackground);
  const interest = standardizeInput(req.body.interest);

  // Construct the Prolog query
  const query = `recommend_department('${skill}', '${futureCareer}', '${academicBackground}', '${interest}', Department).`;

  // Log the query for debugging
  console.log('Prolog Query:', query);

  // Run Prolog command using SWI-Prolog
  exec(`swipl -s ${PROLOG_FILE} -g "${query}" -t halt`, (error, stdout, stderr) => {
    if (error) {
      console.error(`Error: ${error.message}`);
      return res.status(500).json({ success: false, message: 'Error running Prolog script' });
    }

    if (stderr) {
      console.error(`Stderr: ${stderr}`);
      return res.status(500).json({ success: false, message: 'Prolog script error' });
    }

    // Parse Prolog output
    const result = stdout.trim();
    if (result) {
      res.json({ success: true, recommendation: result });
    } else {
      res.json({ success: false, message: 'No matching department found' });
    }
  });
});

// Start the server
const PORT = 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
