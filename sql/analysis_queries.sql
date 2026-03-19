-- Insurance Claims Risk Analysis Queries

-- 1. Loss Ratio by Policy Type
SELECT 
    policy_type,
    SUM(claim_amount) / SUM(premium_amount) AS loss_ratio
FROM claims c
JOIN policies p ON c.policy_id = p.policy_id
GROUP BY policy_type;


-- 2. Average Claim Cost by Policy Type
SELECT 
    policy_type,
    AVG(claim_amount) AS avg_claim_cost
FROM claims c
JOIN policies p ON c.policy_id = p.policy_id
GROUP BY policy_type;


-- 3. Claims by Age Group
SELECT 
    CASE 
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Over 50'
    END AS age_group,
    AVG(claim_amount) AS avg_claim,
    COUNT(*) AS total_claims
FROM claims c
JOIN policies p ON c.policy_id = p.policy_id
GROUP BY age_group
ORDER BY avg_claim DESC;
