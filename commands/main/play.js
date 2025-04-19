const { SlashCommandBuilder, EmbedBuilder, ActionRowBuilder, ButtonBuilder, ButtonStyle, MessageFlags } = require('discord.js');
const facts = require('../../facts.json');
const multipleChoice = require('../../multipleChoice.json');

const { addWonStats, addLostStats, } = require('../../utils/addStats');

module.exports = {
	data: new SlashCommandBuilder()
		.setName('play')
		.setDescription('play game'),
	async execute(interaction) {
        let gameFacts = [...facts.facts];
        let gameMultipleChoice = [...multipleChoice.multiple];
        let questionCounter = 0;

        if (facts.facts.length === 0) {
            await interaction.reply('No more facts available. Game over!');
            return;
        }

        async function askQuestion() {
            if (gameFacts.length === 0) {
                await interaction.followUp('Congratulations! You have answered all questions correctly.');
                return;
            }

            questionCounter++;

            const randomIndex = Math.floor(Math.random() * gameFacts.length);
            const fact = gameFacts[randomIndex].fact;
            const factTrueness = gameFacts[randomIndex].true;

            const mcRandomIndex = gameMultipleChoice.length > 0 ? Math.floor(Math.random() * gameMultipleChoice.length) : null;
            const mc = mcRandomIndex !== null ? gameMultipleChoice[mcRandomIndex].question : null;
            const mcrAnswer = mcRandomIndex !== null ? gameMultipleChoice[mcRandomIndex].answer : null;
            const mcO1 = mcRandomIndex !== null ? gameMultipleChoice[mcRandomIndex].options[0] : null;
            const mcO2 = mcRandomIndex !== null ? gameMultipleChoice[mcRandomIndex].options[1] : null;
            const mcO3 = mcRandomIndex !== null ? gameMultipleChoice[mcRandomIndex].options[2] : null;
            const mcO4 = mcRandomIndex !== null ? gameMultipleChoice[mcRandomIndex].options[3] : null;

            const qtype = gameMultipleChoice.length > 0 && Math.random() < 0.5 ? 'mc' : 'fact';

            if (qtype === 'fact') {
                await interaction.editReply({
                    embeds: [new EmbedBuilder()
                        .setTitle('Play Game')
                        .setDescription('Here you go, you have to decide if this fact is real or false:\n' + `\`${fact}\``)
                        .setColor('7ad1a1')
                        .setFooter({ text: `Question ${questionCounter}` })
                    ],
                    components: [new ActionRowBuilder()
                        .addComponents(
                            new ButtonBuilder()
                                .setCustomId('true')
                                .setStyle(ButtonStyle.Success)
                                .setLabel('True'),
                            new ButtonBuilder()
                                .setCustomId('false')
                                .setStyle(ButtonStyle.Danger)
                                .setLabel('False')
                        )
                    ],
                    flags: [
                        MessageFlags.Ephemeral
                    ]
                });
            } else {
                await interaction.editReply({
                    embeds: [new EmbedBuilder()
                        .setTitle('Play Game')
                        .setDescription('Here is a multiple-choice question:\n' + `\`${mc}\``)
                        .setColor('7ad1a1')
                        .setFooter({ text: `Question ${questionCounter}` })
                    ],
                    components: [new ActionRowBuilder()
                        .addComponents(
                            new ButtonBuilder()
                                .setCustomId('a0')
                                .setStyle(ButtonStyle.Success)
                                .setLabel(mcO1),
                            new ButtonBuilder()
                                .setCustomId('a1')
                                .setStyle(ButtonStyle.Danger)
                                .setLabel(mcO2),
                            new ButtonBuilder()
                                .setCustomId('a2')
                                .setStyle(ButtonStyle.Primary)
                                .setLabel(mcO3),
                            new ButtonBuilder()
                                .setCustomId('a3')
                                .setStyle(ButtonStyle.Secondary)
                                .setLabel(mcO4)
                        )
                    ],
                    flags: [
                        MessageFlags.Ephemeral
                    ]
                });
            }

            const filter = i => {
                i.deferUpdate();
                return i.user.id === interaction.user.id;
            };
            const collector = interaction.channel.createMessageComponentCollector({ filter, time: 15000 });

            collector.on('collect', async i => {
                if ((i.customId === 'true' && factTrueness === 1) || 
                    (i.customId === 'false' && factTrueness === 0) || 
                    (i.customId === 'a0' && mcrAnswer === 0) || 
                    (i.customId === 'a1' && mcrAnswer === 1) || 
                    (i.customId === 'a2' && mcrAnswer === 2) || 
                    (i.customId === 'a3' && mcrAnswer === 3)) {
                    await interaction.editReply({ content: 'Correct!', components: [] });
                    await addWonStats(interaction.user.id, 1);
                    gameFacts.splice(randomIndex, 1);
                    if (mcRandomIndex !== null) gameMultipleChoice.splice(mcRandomIndex, 1);
                    await askQuestion(); 
                } else {
                    await interaction.editReply({ content: 'Incorrect! Game over!', components: [] });
                    await addLostStats(interaction.user.id, 1);
                    gameFacts = [...facts.facts];
                    gameMultipleChoice = [...multipleChoice.multiple];
                }
                collector.stop();
            });

            collector.on('end', collected => {
                if (collected.size === 0) {
                    interaction.editReply({ content: 'Time is up!', components: [] });
                    gameFacts = [...facts.facts];
                    gameMultipleChoice = [...multipleChoice.multiple];
                }
            });
        }

        await interaction.reply({ content: 'Starting the game...', flags: [ MessageFlags.Ephemeral]});
        await askQuestion(); 
	},
};