import React, { useState } from 'react';
import Form from './components/Form';
import Recommendation from './components/Recommendation';

const App = () => {
  const [recommendation, setRecommendation] = useState('');

  return (
    <div>
      <h1>Career Path Recommendation System</h1>
      <Form setRecommendation={setRecommendation} />
      {recommendation && <Recommendation recommendation={recommendation} />}
    </div>
  );
};

export default App;
