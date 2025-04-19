const { SlashCommandBuilder, MessageFlags } = require('discord.js');

module.exports = {
	data: new SlashCommandBuilder()
		.setName('ping')
		.setDescription('pong'),
	async execute(interaction) {
		await interaction.reply({ content: `haii ${interaction.user.username}!! my ping is ${interaction.client.ws.ping}ms`, flags: [MessageFlags.Ephemeral] });
	},
};