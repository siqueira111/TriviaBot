const db = require('../index'); // Corrected path to index.js

async function ensureUserExists(userId) {
    const query = `
        INSERT INTO users (userid, won, lost)
        VALUES ($1, 0, 0)
        ON CONFLICT (userid) DO NOTHING;
    `;
    await db.query(query, [userId]);
}

async function addWonStats(userId, won) {
    try {
        await ensureUserExists(userId);
        const query = `
            UPDATE users
            SET won = won + $1
            WHERE userid = $2;
        `;
        await db.query(query, [won, userId]);
    } catch (error) {
        console.error('Error updating won stats:', error);
    }
}

async function addLostStats(userId, lost) {
    try {
        await ensureUserExists(userId);
        const query = `
            UPDATE users
            SET lost = lost + $1
            WHERE userid = $2;
        `;
        await db.query(query, [lost, userId]);
    } catch (error) {
        console.error('Error updating lost stats:', error);
    }
}

module.exports = { addWonStats, addLostStats };
