const db = require('../index'); // Corrected path to index.js

async function getUserStats(userId) {
    try {
        const query = `
            SELECT won, lost
            FROM users
            WHERE userid = $1;
        `;
        const result = await db.query(query, [userId]);
        if (result.rows.length > 0) {
            const user = result.rows[0];
            return { won: user.won, lost: user.lost };
        } else {
            return { won: 0, lost: 0 };
        }
    } catch (error) {
        console.error('Error querying user stats:', error);
        return { won: 0, lost: 0 };
    }
}

async function fetchAllUserStats() {
    try {
        const query = `
            SELECT userid, won, lost
            FROM users;
        `;
        const result = await db.query(query);
        return result.rows.map(user => ({
            id: user.userid,
            won: user.won,
            lost: user.lost,
        }));
    } catch (error) {
        console.error('Error fetching all user stats:', error);
        return [];
    }
}

async function getUserRank(userId) {
    const allUserStats = await fetchAllUserStats();
    allUserStats.sort((a, b) => b.won - a.won);

    const rank = allUserStats.findIndex(user => user.id === userId) + 1;
    return rank || 'Unranked';
}

module.exports = { getUserStats, getUserRank, fetchAllUserStats };
