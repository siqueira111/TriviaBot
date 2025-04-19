const db = require('../index'); // Ensure this points to the correct file

async function getLeaderboard() {
    try {
        const query = `
            SELECT userid, won, lost
            FROM users
            ORDER BY won DESC, lost ASC
            LIMIT 10;
        `;
        const result = await db.query(query);
        return result.rows;
    } catch (error) {
        console.error('Error querying leaderboard:', error);
        return [];
    }
}

module.exports = { getLeaderboard };