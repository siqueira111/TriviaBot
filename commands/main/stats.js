const { SlashCommandBuilder, EmbedBuilder, MessageFlags } = require('discord.js');
const { getUserStats, getUserRank } = require('../../utils/userStats'); // Updated import

module.exports = {
	data: new SlashCommandBuilder()
		.setName('stats')
		.setDescription('Display user stats'),
	async execute(interaction) {
		const userId = interaction.user.id;
		const { won, lost } = await getUserStats(userId);
		const rank = await getUserRank(userId); // Fetch user rank

		await interaction.reply({
			embeds: [
				new EmbedBuilder()
					.setTitle('User Game Stats')
					.setColor('7ad1a1')
					.setDescription(`Here you can see your game stats:\n\n**Games played:** ${won + lost}\n**Games won:** ${won}\n**Games lost:** ${lost}\n**Accuracy:** ${won + lost === 0 ? 0 : ((won / (won + lost)) * 100).toFixed(2)}%\n**Rank:** ${rank}`)
			], flags: [MessageFlags.Ephemeral]
		});
	},
};