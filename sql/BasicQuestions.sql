-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: maria_db:3306
-- Generation Time: Apr 27, 2025 at 02:25 PM
-- Server version: 11.7.2-MariaDB-ubu2404
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ep`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trivia_attributes`
--

CREATE TABLE `trivia_attributes` (
  `Attribute` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Type` enum('Event','Player') NOT NULL,
  `Status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `trivia_attributes`
--

INSERT INTO `trivia_attributes` (`Attribute`, `Description`, `Type`, `Status`) VALUES
('eventTotalAnswers', 'Total of answers for the event', 'Event', 1),
('eventTotalPlayers', 'Total players that played the event', 'Event', 1),
('playerEventsPlayed', 'Total events that a played participated', 'Player', 1),
('playerEventsWon', 'Quantity of events that the player won', 'Player', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trivia_event`
--

CREATE TABLE `trivia_event` (
  `Id` int(11) NOT NULL,
  `winnerId` int(11) DEFAULT NULL,
  `Duration` time DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trivia_event_attribute`
--

CREATE TABLE `trivia_event_attribute` (
  `Id` int(11) NOT NULL,
  `event` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `Value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trivia_player`
--

CREATE TABLE `trivia_player` (
  `Id` int(11) NOT NULL,
  `DiscordId` bigint(20) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `trivia_player`
--

INSERT INTO `trivia_player` (`Id`, `DiscordId`, `Name`) VALUES
(3, 1213678136617730149, 'Flamma.sh'),
(4, 756070628699668480, 'muffin.'),
(5, 338517945451806731, 'sarp');

-- --------------------------------------------------------

--
-- Table structure for table `trivia_player_attribute`
--

CREATE TABLE `trivia_player_attribute` (
  `Id` int(11) NOT NULL,
  `player` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `Value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trivia_questions`
--

CREATE TABLE `trivia_questions` (
  `Id` int(11) NOT NULL,
  `eventId` int(11) DEFAULT NULL,
  `Content` varchar(255) NOT NULL,
  `Type` enum('CTF','Boolean','MultipleChoice') NOT NULL,
  `IsTrue` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `trivia_questions`
--

INSERT INTO `trivia_questions` (`Id`, `eventId`, `Content`, `Type`, `IsTrue`) VALUES
(613, NULL, 'Easter is the oldest and most important Christian holiday.', 'Boolean', 1),
(614, NULL, 'The date of Easter changes every year, and is determined by the first full moon after the spring equinox.', 'Boolean', 1),
(615, NULL, 'Easter eggs are often associated with the holiday because they symbolize new life and rebirth.', 'Boolean', 1),
(616, NULL, 'The custom of decorating eggs dates back to ancient times, and was often associated with pagan fertility rituals.', 'Boolean', 1),
(617, NULL, 'Easter is the second highest candy-selling holiday, after Halloween.', 'Boolean', 1),
(618, NULL, 'Peeps, the popular marshmallow candy, were first introduced in the 1950s.', 'Boolean', 1),
(619, NULL, 'The name “Easter” is derived from the Old English word “ēastre,” which was the name of a pagan festival that celebrated the arrival of spring.', 'Boolean', 1),
(620, NULL, 'The Easter bunny originated in Germany, where it was known as the “Osterhase.”', 'Boolean', 1),
(621, NULL, 'The White House has an annual Easter Egg Roll, which has been held since 1878.', 'Boolean', 1),
(622, NULL, 'The largest Easter egg ever made weighed over 15,000 pounds and was over 25 feet tall.', 'Boolean', 1),
(623, NULL, 'The world’s largest chocolate Easter egg was made in Italy in 2011 and weighed over 7,000 pounds.', 'Boolean', 1),
(624, NULL, 'The Easter Lily is a popular flower associated with the holiday, and is said to represent purity and new life.', 'Boolean', 1),
(625, NULL, 'In Finland, children dress up as witches and go door-to-door in search of treats on Easter Sunday.', 'Boolean', 1),
(626, NULL, 'In Sweden, it is traditional to light bonfires on Easter Sunday to ward off evil spirits.', 'Boolean', 1),
(627, NULL, 'In Greece, it is traditional to dye Easter eggs red, symbolizing the blood of Christ.', 'Boolean', 1),
(628, NULL, 'The egg hunt is a popular Easter activity, and can be traced back to 18th-century Germany.', 'Boolean', 1),
(629, NULL, 'In Bermuda, it is traditional to fly kites on Good Friday.', 'Boolean', 1),
(630, NULL, 'The custom of wearing new clothes on Easter Sunday dates back to early Christian times.', 'Boolean', 1),
(631, NULL, 'The Easter parade is a popular tradition in many cities, including New York City and London.', 'Boolean', 1),
(632, NULL, 'In Poland, it is traditional to create elaborate Easter baskets filled with food, including bread, eggs, and sausage.', 'Boolean', 1),
(633, NULL, 'The Easter basket is a popular gift given on the holiday, often filled with candy, eggs, and other treats.', 'Boolean', 1),
(634, NULL, 'In some cultures, it is traditional to fast during the week leading up to Easter Sunday.', 'Boolean', 1),
(635, NULL, 'In Germany, it is traditional to plant Easter trees, which are decorated with eggs and other decorations.', 'Boolean', 1),
(636, NULL, 'The Maundy Thursday service, held on the Thursday before Easter, commemorates the Last Supper of Jesus Christ.', 'Boolean', 1),
(637, NULL, 'In Australia, it is traditional to eat hot cross buns on Good Friday.', 'Boolean', 1),
(638, NULL, 'The Easter Vigil is a Catholic tradition that takes place on the Saturday before Easter, and involves the lighting of a Paschal candle.', 'Boolean', 1),
(639, NULL, 'In Italy, it is traditional to hold large processions on Good Friday, with participants carrying statues of Jesus and the Virgin Mary.', 'Boolean', 1),
(640, NULL, 'The traditional Easter dinner often includes ham, lamb, or other meat, along with side dishes such as potatoes and vegetables.', 'Boolean', 1),
(641, NULL, 'In Spain, it is traditional to hold a procession known as the “Procession of the Dead Christ” on Good Friday.', 'Boolean', 1),
(642, NULL, 'Easter is the first holiday of the spring season, and is often associated with new beginnings and fresh starts.', 'Boolean', 1),
(643, NULL, 'In Mexico, it is traditional to hold a procession known as the “Passion Play,” which reenacts the crucifixion and resurrection of Jesus Christ.', 'Boolean', 1),
(644, NULL, 'The tradition of the Easter bunny is said to have originated in Germany in the 17th century.', 'Boolean', 1),
(645, NULL, 'In Scotland, it is traditional to hold a game known as “egg rolling” on Easter Monday, in which children roll hard-boiled eggs down a hill.', 'Boolean', 1),
(646, NULL, 'The custom of wearing Easter bonnets dates back to the 19th century, when it was fashionable for women to wear elaborate hats to church.', 'Boolean', 1),
(647, NULL, 'The word “Easter” is not found in the Bible, and is believed to have been derived from a pagan festival celebrating the goddess Eostre.', 'Boolean', 1),
(648, NULL, 'In parts of Eastern Europe, it is traditional to paint Easter eggs with intricate designs and patterns.', 'Boolean', 1),
(649, NULL, 'The Easter Vigil is the most important Catholic service of the year, and includes the blessing of the new fire and the lighting of the Paschal candle.', 'Boolean', 1),
(650, NULL, 'In the Philippines, it is traditional to hold a reenactment of the crucifixion of Jesus Christ on Good Friday.', 'Boolean', 1),
(651, NULL, 'The custom of giving Easter baskets is said to have originated with the Pennsylvania Dutch in the 18th century.', 'Boolean', 1),
(652, NULL, 'The custom of giving Easter baskets is said to have originated in medieval Europe.', 'Boolean', 1),
(653, NULL, 'In Romania, it is traditional to hold a game known as “cucul,” in which children compete to see who can roll a hard-boiled egg the farthest.', 'Boolean', 1),
(654, NULL, 'The Easter egg hunt is said to have originated in Germany in the 16th century.', 'Boolean', 1),
(655, NULL, 'The Easter bunny is often depicted as carrying a basket of eggs, which he delivers to children on Easter Sunday.', 'Boolean', 1),
(656, NULL, 'In the United States, Easter is a popular holiday for gift-giving, with flowers, candy, and other treats often given as gifts.', 'Boolean', 1),
(657, NULL, 'In Russia, it is traditional to hold a game known as “egg tapping,” in which players tap hard-boiled eggs against each other until one egg cracks.', 'Boolean', 1),
(658, NULL, 'The Easter bunny is often depicted as wearing clothes and carrying a basket of eggs, but in some cultures he is portrayed as a more naturalistic animal.', 'Boolean', 1),
(659, NULL, 'The custom of eating hot cross buns on Good Friday dates back to medieval times.', 'Boolean', 1),
(660, NULL, 'In Finland, it is traditional to burn bonfires on Easter Sunday, which are said to symbolize the end of winter and the beginning of spring.', 'Boolean', 1),
(661, NULL, 'In Mexico, it is traditional to hold a parade known as the “Easter Walk,” which features floats depicting scenes from the life of Jesus Christ.', 'Boolean', 1),
(662, NULL, 'In Norway, it is traditional to hold a game known as “paaskeskirenn,” in which children compete in a ski race.', 'Boolean', 1),
(663, NULL, 'In Brazil, it is traditional to hold a dance known as the “Samba de Roda” on Easter Sunday.', 'Boolean', 1),
(664, NULL, 'In Russia, it is traditional to make a type of sweet bread known as “kulich” for Easter.', 'Boolean', 1),
(665, NULL, 'In Germany, it is traditional to hold a game known as “egg dance,” in which participants dance around while balancing eggs on spoons.', 'Boolean', 1),
(666, NULL, 'In Sweden, it is traditional to hold a game known as “aeggkastning,” in which players try to throw hard-boiled eggs as far as possible.', 'Boolean', 1),
(667, NULL, 'In Spain, it is traditional to hold a game known as “huevo de Pascua,” in which players try to break eggs over each other’s heads without cracking their own.', 'Boolean', 1),
(668, NULL, 'In Bulgaria, it is traditional to hold a game known as “horo,” in which participants dance in a circle while holding painted eggs.', 'Boolean', 1),
(669, NULL, 'In the United States, the Easter Bunny often leaves a trail of footprints leading to the Easter basket.', 'Boolean', 1),
(670, NULL, 'In some cultures, it is traditional to hold a “smudging” ceremony on Easter, in which participants burn sage to purify their homes.', 'Boolean', 1),
(671, NULL, 'In the United States, the White House Easter Egg Roll is an annual event that dates back to 1878', 'Boolean', 1),
(672, NULL, 'In some cultures, it is traditional to hold a sunrise service on Easter Sunday to symbolize the rising of Christ from the dead.', 'Boolean', 1),
(673, NULL, 'In Greece, it is traditional to hold a feast known as “Magiritsa” on Easter Sunday, which consists of a soup made from lamb offal and lettuce.', 'Boolean', 1),
(674, NULL, 'In Denmark, it is traditional to hold a game known as “gaekkebrev,” in which participants write a poem on a piece of paper and fold it into an elaborate design to be given to someone as a gift.', 'Boolean', 1),
(675, NULL, 'In Ethiopia, it is traditional to hold a three-day festival known as “Fasika,” which includes feasting, dancing, and the exchange of gifts.', 'Boolean', 1),
(676, NULL, 'In some cultures, it is traditional to light a bonfire on Easter Sunday to symbolize the triumph of light over darkness.', 'Boolean', 1),
(677, NULL, 'In Bermuda, it is traditional to fly kites on Good Friday to symbolize the ascension of Christ into heaven.', 'Boolean', 1),
(678, NULL, 'In France, it is traditional to hold an Easter omelet competition, in which participants compete to make the largest omelet.', 'Boolean', 1),
(679, NULL, 'In Mexico, it is traditional to hold a “Piñata de Resurrección” on Easter Sunday, in which a piñata is filled with candy and small toys to be broken open by children.', 'Boolean', 1),
(680, NULL, 'In Poland, it is traditional to hold a “wet Monday” celebration on Easter Monday, in which people pour water on each other as a symbol of cleansing and renewal.', 'Boolean', 1),
(681, NULL, 'In Australia, it is traditional to hold a “bunny hunt” on Easter Sunday, in which children search for chocolate Easter bunnies hidden throughout their homes and gardens.', 'Boolean', 1),
(682, NULL, 'In England, it is traditional to hold an egg-rolling competition on Easter Monday, in which participants roll hard-boiled eggs down a hill.', 'Boolean', 1),
(683, NULL, 'In Finland, it is traditional to hold a game known as “Munavisi,” in which participants throw eggs at a target.', 'Boolean', 1),
(684, NULL, 'In France, it is traditional to hold a “chasse aux oeufs,” or Easter egg hunt, in which children search for hidden eggs.', 'Boolean', 1),
(685, NULL, 'In Germany, it is traditional to hold a “osterfeuer,” or Easter bonfire, on the Saturday before Easter Sunday.', 'Boolean', 1),
(686, NULL, 'In Ireland, it is traditional to hold a “cailleach” ceremony on Easter Sunday, in which a straw figure representing winter is burned to symbolize the end of the cold season.', 'Boolean', 1),
(687, NULL, 'In Italy, it is traditional to hold a “scoppio del carro,” or “explosion of the cart,” on Easter Sunday, in which a cart filled with fireworks is set alight.', 'Boolean', 1),
(688, NULL, 'In the United States, it is traditional to hold an Easter parade, in which participants dress in elaborate costumes and walk through the streets.', 'Boolean', 1),
(689, NULL, 'In the Netherlands, it is traditional to hold a “paasvuur,” or Easter fire, on the Saturday before Easter Sunday.', 'Boolean', 1),
(690, NULL, 'In Portugal, it is traditional to hold a “folar,” or Easter bread, which is made with hard-boiled eggs and flavored with cinnamon.', 'Boolean', 1),
(691, NULL, 'In Romania, it is traditional to hold a “pastrama,” or Easter feast, which includes lamb and other traditional foods.', 'Boolean', 1),
(692, NULL, 'In Russia, it is traditional to hold a “maslenitsa,” or pancake festival, during the week leading up to Easter.', 'Boolean', 1),
(693, NULL, 'In Scotland, it is traditional to hold a “hot cross bun race,” in which participants race to carry hot cross buns on a tray without dropping them.', 'Boolean', 1),
(694, NULL, 'In Spain, it is traditional to hold a “semana santa,” or Holy Week, which includes processions, parades, and other religious events.', 'Boolean', 1),
(695, NULL, 'In Sweden, it is traditional to hold an Easter buffet, or “paskbord,” which includes a variety of traditional dishes.', 'Boolean', 1),
(696, NULL, 'In Serbia, it is traditional to hold a “pisanica,” or Easter egg decoration competition, in which participants decorate eggs with intricate designs.', 'Boolean', 1),
(697, NULL, 'In Switzerland, it is traditional to hold an Easter market, in which vendors sell crafts, food, and other items.', 'Boolean', 1),
(698, NULL, 'In the United States, it is traditional to dye eggs with bright colors and decorate them with stickers or other embellishments.', 'Boolean', 1),
(699, NULL, 'In Canada, it is traditional to hold an Easter egg hunt, in which children search for hidden eggs.', 'Boolean', 1),
(700, NULL, 'In many countries, it is traditional to give Easter eggs or other gifts to friends and family.', 'Boolean', 1),
(701, NULL, 'In some cultures, it is traditional to eat hot cross buns, which are spiced buns with a cross on top.', 'Boolean', 1),
(702, NULL, 'In many cultures, it is traditional to eat lamb or other meats on Easter Sunday.', 'Boolean', 1),
(703, NULL, 'In some cultures, it is traditional to give up something for Lent, such as meat, sweets, or alcohol.', 'Boolean', 1),
(704, NULL, 'In some cultures, it is traditional to attend church services on Good Friday or Easter Sunday.', 'Boolean', 1),
(705, NULL, 'In many cultures, it is traditional to wear new clothes on Easter Sunday.', 'Boolean', 1),
(706, NULL, 'In some cultures, it is traditional to plant seeds or start new projects on Easter Sunday, as a symbol of rebirth and renewal.', 'Boolean', 1),
(707, NULL, 'In many cultures, it is traditional to sing Easter hymns or songs.', 'Boolean', 1),
(708, NULL, 'In some cultures, it is traditional to make Easter baskets filled with treats and gifts.', 'Boolean', 1),
(709, NULL, 'In some cultures, it is traditional to perform traditional folk dances or other cultural activities on Easter Sunday.', 'Boolean', 1),
(710, NULL, 'In many cultures, it is traditional to celebrate Easter with family and friends, sharing meals and enjoying each other’s company.', 'Boolean', 1),
(711, NULL, 'In some cultures, it is traditional to light candles or lanterns on Easter Sunday as a symbol of hope and new beginnings.', 'Boolean', 1),
(712, NULL, 'In many cultures, it is traditional to give to charity or perform acts of kindness during the Easter season.', 'Boolean', 1),
(713, NULL, 'In some cultures, it is traditional to paint or draw Easter scenes, such as depictions of the crucifixion or the resurrection.', 'Boolean', 1),
(714, NULL, 'In many cultures, it is traditional to decorate homes and churches with flowers and other springtime decorations.', 'Boolean', 1),
(715, NULL, 'In many cultures, it is traditional to read or listen to stories about Easter, such as the Passion of Christ or stories about the Easter bunny.', 'Boolean', 1),
(716, NULL, 'In some cultures, it is traditional to hold community events or festivals during the Easter season, bringing together people from different backgrounds and traditions.', 'Boolean', 1),
(717, NULL, 'In some cultures, it is traditional to create Easter-themed crafts or decorations, such as wreaths or garlands.', 'Boolean', 1),
(718, NULL, 'In many cultures, it is traditional to share stories or legends about the Easter bunny or other Easter symbols.', 'Boolean', 1),
(719, NULL, 'In some cultures, it is traditional to hold a feast or banquet on Easter Sunday, featuring a variety of dishes and desserts.', 'Boolean', 1),
(720, NULL, 'In many cultures, it is traditional to exchange gifts or tokens of appreciation during the Easter season.', 'Boolean', 1),
(721, NULL, 'In some cultures, it is traditional to perform acts of service or volunteer work during the Easter season.', 'Boolean', 1),
(722, NULL, 'Easter is for bunnies', 'Boolean', 0),
(723, NULL, 'The first ever computer got released on easter', 'Boolean', 0),
(724, NULL, 'Easter is the most important holiday in the world', 'Boolean', 0),
(725, NULL, 'In many cultures, it is traditional to celebrate Easter with fireworks or other forms of entertainment.', 'Boolean', 1),
(726, NULL, 'Easter is celebrated on the same day every year', 'Boolean', 0),
(727, NULL, 'Easter is a holiday that celebrates the birth of Jesus Christ', 'Boolean', 0),
(728, NULL, 'Easter is a holiday that celebrates the arrival of spring', 'Boolean', 0),
(729, NULL, 'Easter is a holiday that celebrates the end of winter', 'Boolean', 0),
(730, NULL, 'Easter is a holiday that celebrates the beginning of summer', 'Boolean', 0),
(731, NULL, 'Easter is a holiday that celebrates the harvest season', 'Boolean', 0),
(732, NULL, 'Eric Parker is the best', 'Boolean', 1),
(733, NULL, 'In the netherlands they eat bunny cheese.', 'Boolean', 0),
(734, NULL, 'Easter is a holiday that celebrates the beginning of the school year', 'Boolean', 0),
(735, NULL, 'Easter is a holiday that celebrates the end of the school year', 'Boolean', 0),
(736, NULL, 'Easter is a holiday that celebrates the end of the work week', 'Boolean', 0),
(737, NULL, 'Easter is a holiday that celebrates the beginning of the work week', 'Boolean', 0),
(738, NULL, 'Easter is a holiday that celebrates the end of the month', 'Boolean', 0),
(739, NULL, 'Easter is a holiday that celebrates the beginning of the month', 'Boolean', 0),
(740, NULL, 'Easter is a holiday that celebrates the end of the year', 'Boolean', 0),
(741, NULL, 'Easter is a holiday that celebrates the beginning of the year', 'Boolean', 0),
(742, NULL, 'Easter is a holiday that celebrates the end of the decade', 'Boolean', 0),
(743, NULL, 'Easter is a holiday that celebrates the beginning of the decade', 'Boolean', 0),
(744, NULL, 'Eric Parker made his **DISCORD** account in 2020', 'Boolean', 0),
(745, NULL, 'This server was made in 2023', 'Boolean', 0),
(746, NULL, 'The cat ate the eagle(server lore)', 'Boolean', 0),
(747, NULL, 'Easter is celebrated on the same day as Christmas.', 'Boolean', 0),
(748, NULL, 'The Easter Bunny is a species of rabbit found only in Antarctica.', 'Boolean', 0),
(749, NULL, 'Easter eggs were originally made of gold.', 'Boolean', 0),
(750, NULL, 'The Easter Bunny was invented by Albert Einstein.', 'Boolean', 0),
(751, NULL, 'Easter is a holiday that celebrates the invention of chocolate.', 'Boolean', 0),
(752, NULL, 'Easter was first celebrated on the moon.', 'Boolean', 0),
(753, NULL, 'The Easter Bunny delivers presents to children, just like Santa Claus.', 'Boolean', 0),
(754, NULL, 'Easter eggs were originally filled with diamonds.', 'Boolean', 0),
(755, NULL, 'Easter is a holiday that celebrates the invention of the wheel.', 'Boolean', 0),
(756, NULL, 'The Easter Bunny is a mythical creature that can fly.', 'Boolean', 0),
(757, NULL, 'Easter was originally celebrated by building snowmen.', 'Boolean', 0),
(758, NULL, 'Easter eggs were first made by dinosaurs.', 'Boolean', 0),
(759, NULL, 'The Easter Bunny is a character from Greek mythology.', 'Boolean', 0),
(760, NULL, 'Easter is a holiday that celebrates the invention of electricity.', 'Boolean', 0),
(761, NULL, 'Easter was first celebrated in outer space.', 'Boolean', 0),
(762, NULL, 'The Easter Bunny is a robot created in the 1800s.', 'Boolean', 0),
(763, NULL, 'The Easter Bunny is a superhero who fights crime.', 'Boolean', 0),
(764, NULL, 'Easter eggs were first painted by Leonardo da Vinci.', 'Boolean', 0),
(765, NULL, 'Easter is a holiday that celebrates the invention of the telephone.', 'Boolean', 0),
(766, NULL, 'The Easter Bunny is a character from Shakespeare\'s plays.', 'Boolean', 0),
(767, NULL, 'Easter eggs were originally made of ice.', 'Boolean', 0),
(768, NULL, 'Easter eggs were originally made of glass.', 'Boolean', 0),
(769, NULL, 'Easter is a holiday that celebrates the invention of the internet.', 'Boolean', 0),
(770, NULL, 'Easter is a holiday that celebrates the invention of airplanes.', 'Boolean', 0),
(771, NULL, 'The Easter Bunny is a time traveler.', 'Boolean', 0),
(772, NULL, 'Easter eggs were first discovered in the Amazon rainforest.', 'Boolean', 0),
(773, NULL, 'Easter is a holiday that celebrates the invention of the light bulb.', 'Boolean', 0),
(774, NULL, 'The Easter Bunny is a character from a science fiction novel.', 'Boolean', 0),
(775, NULL, 'Easter eggs were originally made of rubber.', 'Boolean', 0),
(776, NULL, 'Easter is a holiday that celebrates the invention of television.', 'Boolean', 0),
(777, NULL, 'The Easter Bunny is a magician who can make eggs disappear.', 'Boolean', 0),
(778, NULL, 'Easter eggs were first created by aliens.', 'Boolean', 0),
(779, NULL, 'Easter is a holiday that celebrates the invention of cars.', 'Boolean', 0),
(780, NULL, 'The Easter Bunny is a character from a horror movie.', 'Boolean', 0),
(781, NULL, 'Easter eggs were originally made of paper.', 'Boolean', 0),
(782, NULL, 'Easter is a holiday that celebrates the invention of computers.', 'Boolean', 0),
(783, NULL, 'The Easter Bunny is a famous chef who invented chocolate eggs.', 'Boolean', 0),
(784, NULL, 'Easter eggs were first used as currency.', 'Boolean', 0),
(785, NULL, 'Easter is a holiday that celebrates the invention of the printing press.', 'Boolean', 0),
(786, NULL, 'The Easter Bunny is a character from a video game.', 'Boolean', 0),
(787, NULL, 'Easter eggs were originally made of clay.', 'Boolean', 0),
(788, NULL, 'Easter is a holiday that celebrates the invention of photography.', 'Boolean', 0),
(789, NULL, 'The Easter Bunny is a famous artist who paints eggs.', 'Boolean', 0),
(790, NULL, 'Easter is a holiday that celebrates the invention of the steam engine.', 'Boolean', 0),
(791, NULL, 'Easter eggs were first used as musical instruments.', 'Boolean', 0),
(792, NULL, 'The Easter Bunny is a character from a fairy tale.', 'Boolean', 0),
(793, NULL, 'Easter eggs were originally made of chocolate by accident.', 'Boolean', 0),
(794, NULL, 'Easter is a holiday that celebrates the invention of the calendar.', 'Boolean', 0),
(795, NULL, 'The Easter Bunny is a famous explorer who discovered Easter Island.', 'Boolean', 0),
(796, NULL, 'Easter eggs were first used in ancient Olympic games.', 'Boolean', 0),
(797, NULL, 'Easter is a holiday that celebrates the invention of the compass.', 'Boolean', 0),
(798, NULL, 'The Easter Bunny is a character from a comic book series.', 'Boolean', 0),
(799, NULL, 'Easter is a holiday that celebrates the invention of the typewriter.', 'Boolean', 0),
(800, NULL, 'Easter eggs were originally made of soap.', 'Boolean', 0),
(801, NULL, 'The Easter Bunny is a famous musician who plays the egg flute.', 'Boolean', 0),
(802, NULL, 'Easter eggs were first used as decorations for castles.', 'Boolean', 0),
(803, NULL, 'Easter is a holiday that celebrates the invention of the radio.', 'Boolean', 0),
(804, NULL, 'Easter eggs were originally made of feathers.', 'Boolean', 0),
(805, NULL, 'Easter is a holiday that celebrates the invention of the microscope.', 'Boolean', 0),
(806, NULL, 'The Easter Bunny is a famous scientist who studies eggs.', 'Boolean', 0),
(807, NULL, 'Easter eggs were first used as prizes in medieval tournaments.', 'Boolean', 0),
(808, NULL, 'Easter is a holiday that celebrates the invention of the telescope.', 'Boolean', 0),
(809, NULL, 'The Easter Bunny is a famous inventor who created the first chocolate egg.', 'Boolean', 0),
(810, NULL, 'The Easter Bunny is a famous athlete who competes in egg races.', 'Boolean', 0),
(811, NULL, 'Easter eggs were originally made of sugar and salt.', 'Boolean', 0),
(812, NULL, 'Who is Azrael?', 'MultipleChoice', 1),
(813, NULL, 'When is easter celebrated this year?', 'MultipleChoice', 1),
(814, NULL, 'What is the capital of France?', 'MultipleChoice', 1),
(815, NULL, 'Easter is a holiday that celebrates the invention of the sewing machine.', 'Boolean', 0),
(816, NULL, 'What is the largest planet in our solar system?', 'MultipleChoice', 1),
(817, NULL, 'What is the speed of light?', 'MultipleChoice', 1),
(818, NULL, 'What is the largest mammal in the world?', 'MultipleChoice', 1),
(819, NULL, 'What is the capital of Japan?', 'MultipleChoice', 1),
(820, NULL, 'What is the smallest country in the world?', 'MultipleChoice', 1),
(821, NULL, 'What is the main ingredient in guacamole?', 'MultipleChoice', 1),
(822, NULL, 'What is the largest desert in the world?', 'MultipleChoice', 1),
(823, NULL, 'What is the hardest natural substance on Earth?', 'MultipleChoice', 1),
(824, NULL, 'What is the boiling point of water?', 'MultipleChoice', 1),
(825, NULL, 'What is the largest ocean on Earth?', 'MultipleChoice', 1),
(826, NULL, 'What is the main language spoken in Brazil?', 'MultipleChoice', 1),
(827, NULL, 'What is the capital of Italy?', 'MultipleChoice', 1),
(828, NULL, 'What is the largest continent on Earth?', 'MultipleChoice', 1),
(829, NULL, 'What is the main ingredient in sushi?', 'MultipleChoice', 1),
(830, NULL, 'What is the capital of Canada?', 'MultipleChoice', 1),
(831, NULL, 'What is the largest animal on land?', 'MultipleChoice', 1),
(832, NULL, 'What is the main ingredient in hummus?', 'MultipleChoice', 1),
(833, NULL, 'What is the capital of Australia?', 'MultipleChoice', 1),
(834, NULL, 'What is the largest volcano in the world?', 'MultipleChoice', 1),
(835, NULL, 'What is the main ingredient in pesto?', 'MultipleChoice', 1),
(836, NULL, 'What is the capital of Egypt?', 'MultipleChoice', 1),
(837, NULL, 'What is the largest city in the world by population?', 'MultipleChoice', 1),
(838, NULL, 'What is the main ingredient in a Caesar salad?', 'MultipleChoice', 1),
(839, NULL, 'What is the capital of Spain?', 'MultipleChoice', 1),
(840, NULL, 'What is the largest island in the world?', 'MultipleChoice', 1),
(841, NULL, 'What is the main ingredient in a margarita?', 'MultipleChoice', 1),
(842, NULL, 'What is the capital of Germany?', 'MultipleChoice', 1),
(843, NULL, 'What is the largest lake in the world?', 'MultipleChoice', 1),
(844, NULL, 'What is the main ingredient in a moussaka?', 'MultipleChoice', 1),
(845, NULL, 'What is the traditional Easter flower?', 'MultipleChoice', 1),
(846, NULL, 'What is the significance of Easter in Christianity?', 'MultipleChoice', 1),
(847, NULL, 'What is the name of the Sunday before Easter?', 'MultipleChoice', 1),
(848, NULL, 'What is the name of the meal Jesus shared with his disciples before his crucifixion?', 'MultipleChoice', 1),
(849, NULL, 'What is the traditional Easter candy shaped like a bird?', 'MultipleChoice', 1),
(850, NULL, 'What is the name of the Jewish holiday that often coincides with Easter?', 'MultipleChoice', 1),
(851, NULL, 'What is the name of the week leading up to Easter?', 'MultipleChoice', 1),
(852, NULL, 'What is the traditional Easter bread in Italy called?', 'MultipleChoice', 1),
(853, NULL, 'What is the name of the day Jesus was crucified?', 'MultipleChoice', 1),
(854, NULL, 'What is the traditional activity involving eggs during Easter?', 'MultipleChoice', 1),
(855, NULL, 'What is the name of the Easter Bunny in German folklore?', 'MultipleChoice', 1),
(856, NULL, 'What is the traditional Easter greeting in Christianity?', 'MultipleChoice', 1),
(857, NULL, 'What is the name of the Easter vigil held on the night before Easter?', 'MultipleChoice', 1),
(858, NULL, 'What is the traditional Easter meat in many cultures?', 'MultipleChoice', 1),
(859, NULL, 'What is the name of the cake traditionally eaten in the UK during Easter?', 'MultipleChoice', 1),
(860, NULL, 'What is the name of the day that marks the end of Lent?', 'MultipleChoice', 1),
(861, NULL, 'What is the name of the hill where Jesus was crucified?', 'MultipleChoice', 1),
(862, NULL, 'What is the name of the disciple who betrayed Jesus?', 'MultipleChoice', 1),
(863, NULL, 'What is the name of the cloth that covered Jesus\' body in the tomb?', 'MultipleChoice', 1),
(864, NULL, 'Who made this bot?', 'MultipleChoice', 1),
(865, NULL, 'What is the name of the Roman governor who sentenced Jesus to death?', 'MultipleChoice', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trivia_questions_option`
--

CREATE TABLE `trivia_questions_option` (
  `Id` int(11) NOT NULL,
  `questionId` int(11) DEFAULT NULL,
  `Content` varchar(50) NOT NULL,
  `IsCorrect` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `trivia_questions_option`
--

INSERT INTO `trivia_questions_option` (`Id`, `questionId`, `Content`, `IsCorrect`) VALUES
(509, 812, 'Global Administrator', 1),
(510, 812, 'Member', 0),
(511, 812, 'Owner', 0),
(512, 812, 'The Supreme Leader', 0),
(513, 812, 'Dictator of The Server', 0),
(514, 813, 'March 31st', 0),
(515, 813, 'April 20th', 1),
(516, 813, 'April 17th', 0),
(517, 813, 'April 30th', 0),
(518, 814, 'Berlin', 0),
(519, 814, 'Madrid', 0),
(520, 814, 'Rome', 0),
(521, 814, 'Cat Island', 0),
(522, 816, 'Earth', 0),
(523, 814, 'Paris', 1),
(524, 816, 'Mars', 0),
(525, 816, 'Jupiter', 1),
(526, 816, 'Saturn', 0),
(527, 818, 'Elephant', 0),
(528, 818, 'Blue Whale', 1),
(529, 818, 'Giraffe', 0),
(530, 818, 'Great White Shark', 0),
(531, 817, '300,000 km/s', 1),
(532, 817, '150,000 km/s', 0),
(533, 817, '1,000,000 km/s', 0),
(534, 817, '500,000 km/s', 0),
(535, 820, 'Vatican City', 1),
(536, 820, 'Monaco', 0),
(537, 820, 'Liechtenstein', 0),
(538, 820, 'San Marino', 0),
(539, 821, 'Tomato', 0),
(540, 821, 'Onion', 0),
(541, 821, 'Avocado', 1),
(542, 821, 'Pepper', 0),
(543, 823, 'Diamond', 1),
(544, 823, 'Gold', 0),
(545, 823, 'Iron', 0),
(546, 823, 'Platinum', 0),
(547, 825, 'Atlantic Ocean', 0),
(548, 825, 'Indian Ocean', 0),
(549, 825, 'Arctic Ocean', 0),
(550, 825, 'Pacific Ocean', 1),
(551, 822, 'Sahara', 1),
(552, 822, 'Arabian', 0),
(553, 822, 'Gobi', 0),
(554, 822, 'Kalahari', 0),
(555, 819, 'Tokyo', 1),
(556, 819, 'Seoul', 0),
(557, 819, 'Beijing', 0),
(558, 819, 'Bangkok', 0),
(559, 824, '100°C', 1),
(560, 824, '90°C', 0),
(561, 824, '80°C', 0),
(562, 824, '70°C', 0),
(563, 826, 'Spanish', 0),
(564, 826, 'Portuguese', 1),
(565, 826, 'English', 0),
(566, 827, 'Florence', 0),
(567, 827, 'Milan', 0),
(568, 828, 'Africa', 0),
(569, 828, 'Asia', 1),
(570, 826, 'French', 0),
(571, 827, 'Venice', 0),
(572, 827, 'Rome', 1),
(573, 828, 'North America', 0),
(574, 828, 'South America', 0),
(575, 833, 'Sydney', 0),
(576, 833, 'Melbourne', 0),
(577, 833, 'Canberra', 1),
(578, 830, 'Toronto', 0),
(579, 830, 'Vancouver', 0),
(580, 833, 'Brisbane', 0),
(581, 830, 'Ottawa', 1),
(582, 830, 'Montreal', 0),
(583, 831, 'Elephant', 1),
(584, 831, 'Giraffe', 0),
(585, 831, 'Hippopotamus', 0),
(586, 831, 'Rhinoceros', 0),
(587, 832, 'Chickpeas', 1),
(588, 832, 'Lentils', 0),
(589, 832, 'Beans', 0),
(590, 832, 'Peas', 0),
(591, 834, 'Kilimanjaro', 0),
(592, 834, 'Mauna Loa', 1),
(593, 834, 'Mount St. Helens', 0),
(594, 835, 'Basil', 1),
(595, 834, 'Mount Fuji', 0),
(596, 835, 'Parsley', 0),
(597, 835, 'Cilantro', 0),
(598, 835, 'Mint', 0),
(599, 829, 'Fish', 0),
(600, 829, 'Seaweed', 0),
(601, 829, 'Rice', 1),
(602, 836, 'Alexandria', 0),
(603, 836, 'Giza', 0),
(604, 836, 'Cairo', 1),
(605, 829, 'Vegetables', 0),
(606, 836, 'Luxor', 0),
(607, 837, 'Tokyo', 1),
(608, 837, 'Delhi', 0),
(609, 837, 'Sao Paulo', 0),
(610, 837, 'Shanghai', 0),
(611, 838, 'Lettuce', 0),
(612, 838, 'Croutons', 0),
(613, 838, 'Caesar dressing', 1),
(614, 838, 'Parmesan cheese', 0),
(615, 839, 'Madrid', 1),
(616, 839, 'Barcelona', 0),
(617, 839, 'Seville', 0),
(618, 841, 'Tequila', 1),
(619, 839, 'Valencia', 0),
(620, 841, 'Vodka', 0),
(621, 844, 'Eggplant', 1),
(622, 844, 'Potato', 0),
(623, 841, 'Whiskey', 0),
(624, 841, 'Rum', 0),
(625, 844, 'Zucchini', 0),
(626, 842, 'Berlin', 1),
(627, 842, 'Munich', 0),
(628, 842, 'Frankfurt', 0),
(629, 844, 'Tomato', 0),
(630, 842, 'Hamburg', 0),
(631, 843, 'Caspian Sea', 1),
(632, 843, 'Lake Superior', 0),
(633, 843, 'Lake Victoria', 0),
(634, 846, 'The birth of Jesus', 0),
(635, 843, 'Lake Baikal', 0),
(636, 846, 'The resurrection of Jesus', 1),
(637, 846, 'The last supper', 0),
(638, 846, 'The crucifixion of Jesus', 0),
(639, 845, 'Rose', 0),
(640, 845, 'Lily', 1),
(641, 845, 'Tulip', 0),
(642, 845, 'Daffodil', 0),
(643, 840, 'Greenland', 1),
(644, 840, 'New Guinea', 0),
(645, 840, 'Borneo', 0),
(646, 840, 'Madagascar', 0),
(647, 848, 'The Last Supper', 1),
(648, 848, 'The Passover Meal', 0),
(649, 848, 'The Holy Feast', 0),
(650, 848, 'The Easter Banquet', 0),
(651, 847, 'Palm Sunday', 1),
(652, 847, 'Good Friday', 0),
(653, 847, 'Holy Saturday', 0),
(654, 847, 'Maundy Thursday', 0),
(655, 849, 'Peeps', 1),
(656, 849, 'Chocolate Bunny', 0),
(657, 849, 'Marshmallow Eggs', 0),
(658, 849, 'Jelly Beans', 0),
(659, 854, 'Egg Rolling', 0),
(660, 854, 'Egg Tossing', 0),
(661, 854, 'Egg Painting', 0),
(662, 854, 'Egg Hunting', 1),
(663, 858, 'Turkey', 0),
(664, 858, 'Lamb', 1),
(665, 858, 'Beef', 0),
(666, 858, 'Ham', 0),
(667, 856, 'He is Risen!', 1),
(668, 856, 'Happy Easter!', 0),
(669, 851, 'Holy Week', 1),
(670, 856, 'Blessed Easter!', 0),
(671, 856, 'Christ is Born!', 0),
(672, 851, 'Easter Week', 0),
(673, 851, 'Passion Week', 0),
(674, 850, 'Hanukkah', 0),
(675, 850, 'Passover', 1),
(676, 850, 'Yom Kippur', 0),
(677, 850, 'Rosh Hashanah', 0),
(678, 851, 'Resurrection Week', 0),
(679, 853, 'Holy Saturday', 0),
(680, 853, 'Good Friday', 1),
(681, 853, 'Palm Sunday', 0),
(682, 853, 'Easter Sunday', 0),
(683, 855, 'Osterhase', 1),
(684, 855, 'Hasenpfeffer', 0),
(685, 855, 'Hasenbraten', 0),
(686, 855, 'Osterkaninchen', 0),
(687, 857, 'Easter Vigil', 1),
(688, 857, 'Holy Vigil', 0),
(689, 857, 'Resurrection Vigil', 0),
(690, 852, 'Panettone', 0),
(691, 857, 'Passion Vigil', 0),
(692, 852, 'Colomba', 1),
(693, 852, 'Focaccia', 0),
(694, 852, 'Ciabatta', 0),
(695, 859, 'Simnel Cake', 1),
(696, 859, 'Victoria Sponge', 0),
(697, 859, 'Fruit Cake', 0),
(698, 859, 'Easter Cake', 0),
(699, 860, 'Easter Sunday', 1),
(700, 860, 'Good Friday', 0),
(701, 860, 'Holy Saturday', 0),
(702, 860, 'Palm Sunday', 0),
(703, 861, 'Golgotha', 1),
(704, 861, 'Mount Sinai', 0),
(705, 861, 'Mount Zion', 0),
(706, 861, 'Mount Carmel', 0),
(707, 862, 'Peter', 0),
(708, 862, 'Judas', 1),
(709, 862, 'John', 0),
(710, 862, 'Thomas', 0),
(711, 863, 'Shroud of Turin', 1),
(712, 863, 'Holy Veil', 0),
(713, 863, 'Sacred Cloth', 0),
(714, 863, 'Resurrection Shroud', 0),
(715, 865, 'Herod', 0),
(716, 865, 'Pontius Pilate', 1),
(717, 865, 'Nero', 0),
(718, 865, 'Caesar Augustus', 0),
(719, 864, 'Azrael', 0),
(720, 864, 'Flamma', 1),
(721, 864, 'Eric Parker', 0),
(722, 864, 'Jak', 0),
(723, 864, 'Loafc', 0);

-- --------------------------------------------------------

--
-- Table structure for table `trivia_settings`
--

CREATE TABLE `trivia_settings` (
  `Setting` varchar(255) NOT NULL,
  `Value` char(255) NOT NULL,
  `Status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trivia_attributes`
--
ALTER TABLE `trivia_attributes`
  ADD PRIMARY KEY (`Attribute`);

--
-- Indexes for table `trivia_event`
--
ALTER TABLE `trivia_event`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `WinnerId` (`winnerId`);

--
-- Indexes for table `trivia_event_attribute`
--
ALTER TABLE `trivia_event_attribute`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `event` (`event`),
  ADD KEY `attribute` (`attribute`);

--
-- Indexes for table `trivia_player`
--
ALTER TABLE `trivia_player`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `DiscordId` (`DiscordId`);

--
-- Indexes for table `trivia_player_attribute`
--
ALTER TABLE `trivia_player_attribute`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `player` (`player`),
  ADD KEY `attribute` (`attribute`);

--
-- Indexes for table `trivia_questions`
--
ALTER TABLE `trivia_questions`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `event` (`eventId`);

--
-- Indexes for table `trivia_questions_option`
--
ALTER TABLE `trivia_questions_option`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `question` (`questionId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trivia_event`
--
ALTER TABLE `trivia_event`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trivia_event_attribute`
--
ALTER TABLE `trivia_event_attribute`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trivia_player`
--
ALTER TABLE `trivia_player`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `trivia_player_attribute`
--
ALTER TABLE `trivia_player_attribute`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trivia_questions`
--
ALTER TABLE `trivia_questions`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=866;

--
-- AUTO_INCREMENT for table `trivia_questions_option`
--
ALTER TABLE `trivia_questions_option`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=724;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `trivia_event`
--
ALTER TABLE `trivia_event`
  ADD CONSTRAINT `trivia_event_ibfk_1` FOREIGN KEY (`winnerId`) REFERENCES `trivia_player` (`Id`);

--
-- Constraints for table `trivia_event_attribute`
--
ALTER TABLE `trivia_event_attribute`
  ADD CONSTRAINT `trivia_event_attribute_ibfk_1` FOREIGN KEY (`event`) REFERENCES `trivia_event` (`Id`),
  ADD CONSTRAINT `trivia_event_attribute_ibfk_2` FOREIGN KEY (`attribute`) REFERENCES `trivia_attributes` (`Attribute`);

--
-- Constraints for table `trivia_player_attribute`
--
ALTER TABLE `trivia_player_attribute`
  ADD CONSTRAINT `trivia_player_attribute_ibfk_1` FOREIGN KEY (`player`) REFERENCES `trivia_player` (`Id`),
  ADD CONSTRAINT `trivia_player_attribute_ibfk_2` FOREIGN KEY (`attribute`) REFERENCES `trivia_attributes` (`Attribute`);

--
-- Constraints for table `trivia_questions`
--
ALTER TABLE `trivia_questions`
  ADD CONSTRAINT `trivia_questions_ibfk_1` FOREIGN KEY (`eventId`) REFERENCES `trivia_event` (`Id`);

--
-- Constraints for table `trivia_questions_option`
--
ALTER TABLE `trivia_questions_option`
  ADD CONSTRAINT `trivia_questions_option_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `trivia_questions` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
