const { SlashCommandBuilder, EmbedBuilder, ActionRowBuilder, ButtonBuilder, ButtonStyle, MessageFlags } = require('discord.js');
const { getLeaderboard } = require('../../utils/leaderboard');

module.exports = {
    data: new SlashCommandBuilder()
        .setName('leaderboard')
        .setDescription('Leaderboard of the top players'),
    async execute(interaction) {
        const users = await getLeaderboard();
        if (users.length === 0) {
            await interaction.reply({ content: 'No leaderboard data available.', flags: [MessageFlags.Ephemeral]});
            return;
        }

        let currentPage = 0;
        const pageSize = 10;

        const generateEmbed = (page) => {
            const start = page * pageSize;
            const end = start + pageSize;
            const pageUsers = users.slice(start, end);

            return new EmbedBuilder()
                .setTitle('Leaderboard')
                .setColor('7ad1a1')
                .setDescription(pageUsers.map((user, index) => 
                    `**${start + index + 1}.** <@${user.userid}> - **Won:** ${user.won} - **Lost:** ${user.lost}`
                ).join('\n'))
                .setFooter({ text: `Page ${page + 1} of ${Math.ceil(users.length / pageSize)}` });
        };

        const row = new ActionRowBuilder()
            .addComponents(
                new ButtonBuilder()
                    .setCustomId('previous')
                    .setLabel('Previous')
                    .setEmoji('⬅️')
                    .setStyle(ButtonStyle.Primary)
                    .setDisabled(true),
                new ButtonBuilder()
                    .setCustomId('next')
                    .setLabel('Next')
                    .setEmoji('➡️')
                    .setStyle(ButtonStyle.Primary)
                    .setDisabled(users.length <= pageSize)
            );

        const message = await interaction.reply({ 
            embeds: [generateEmbed(currentPage)], 
            components: [row],
            flags: [MessageFlags.Ephemeral]
        });

        // Fetch the response after sending the reply
        const fetchedMessage = await interaction.fetchReply();

        const collector = fetchedMessage.createMessageComponentCollector({ time: 60000 });

        collector.on('collect', async (buttonInteraction) => {
            if (buttonInteraction.user.id !== interaction.user.id) {
                await buttonInteraction.reply({ content: 'You cannot interact with this button.', ephemeral: true });
                return;
            }

            if (buttonInteraction.customId === 'previous') {
                currentPage--;
            } else if (buttonInteraction.customId === 'next') {
                currentPage++;
            }

            const newRow = new ActionRowBuilder()
                .addComponents(
                    new ButtonBuilder()
                        .setCustomId('previous')
                        .setLabel('Previous')
                        .setEmoji('⬅️')
                        .setStyle(ButtonStyle.Primary)
                        .setDisabled(currentPage === 0),
                    new ButtonBuilder()
                        .setCustomId('next')
                        .setLabel('Next')
                        .setEmoji('➡️')
                        .setStyle(ButtonStyle.Primary)
                        .setDisabled((currentPage + 1) * pageSize >= users.length)
                );

            await buttonInteraction.update({ 
                embeds: [generateEmbed(currentPage)], 
                components: [newRow] 
            });
        });

        collector.on('end', async () => {
            const disabledRow = new ActionRowBuilder()
                .addComponents(
                    new ButtonBuilder()
                        .setCustomId('previous')
                        .setLabel('Previous')
                        .setEmoji("⬅️")
                        .setStyle(ButtonStyle.Primary)
                        .setDisabled(true),
                    new ButtonBuilder()
                        .setCustomId('next')
                        .setLabel('Next')
                        .setEmoji("➡️")
                        .setStyle(ButtonStyle.Primary)
                        .setDisabled(true)
                );

            await message.edit({ components: [disabledRow] });
        });
    },
};