import React, { useState } from 'react';
import axios from 'axios';
import styles from './Form.module.css';

const CareerRecommendation = () => {
  const [formData, setFormData] = useState({
    skill: '',
    futureCareer: '',
    academicBackground: '',
    interest: '',
  });

  const [response, setResponse] = useState(null);
  const [error, setError] = useState('');

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const res = await axios.post('http://localhost:5000/api/recommend', formData);
      setResponse(res.data);
      setError('');
    } catch (err) {
      setError(err.response?.data?.message || 'An error occurred');
      setResponse(null);
    }
  };

  return (
    <div className={styles.container}>
      <form onSubmit={handleSubmit} className={styles.form}>
        <h1 className={styles.title}>Career Path Recommendation</h1>
        <label className={styles.label}>
          Skill:
          <input
            type="text"
            name="skill"
            value={formData.skill}
            onChange={handleChange}
            className={styles.input}
            required
          />
        </label>
        <label className={styles.label}>
          Future Career:
          <input
            type="text"
            name="futureCareer"
            value={formData.futureCareer}
            onChange={handleChange}
            className={styles.input}
            required
          />
        </label>
        <label className={styles.label}>
          Academic Background:
          <input
            type="text"
            name="academicBackground"
            value={formData.academicBackground}
            onChange={handleChange}
            className={styles.input}
            required
          />
        </label>
        <label className={styles.label}>
          Interest:
          <input
            type="text"
            name="interest"
            value={formData.interest}
            onChange={handleChange}
            className={styles.input}
            required
          />
        </label>
        <button type="submit" className={styles.button}>
          Get Recommendation
        </button>
      </form>
      {response && (
        <div className={styles.response}>
          {response.success ? (
            <h2 className={styles.success}>Recommended Department: {response.recommendation}</h2>
          ) : (
            <h2 className={styles.error}>{response.message}</h2>
          )}
        </div>
      )}
      {error && <p className={styles.errorMessage}>{error}</p>}
    </div>
  );
};

export default CareerRecommendation;
