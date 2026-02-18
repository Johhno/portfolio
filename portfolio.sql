-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 22, 2023 at 02:44 PM
-- Server version: 5.7.33
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`) VALUES
(1, 'Jewelry & Baby', 'jewelry-and-baby'),
(2, 'Jewelry, Beauty & Industrial', 'jewelry-beauty-and-industrial'),
(3, 'Home, Music & Industrial', 'home-music-and-industrial');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brochure_filename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20221215101457', '2023-03-28 13:51:17', 118),
('DoctrineMigrations\\Version20230205134012', '2023-03-28 13:51:17', 66),
('DoctrineMigrations\\Version20230221104528', '2023-03-28 13:51:17', 22),
('DoctrineMigrations\\Version20230221105634', '2023-03-28 13:51:18', 31),
('DoctrineMigrations\\Version20230221141542', '2023-03-28 13:51:18', 21),
('DoctrineMigrations\\Version20230221142639', '2023-03-28 13:51:18', 83),
('DoctrineMigrations\\Version20230224104956', '2023-03-28 13:51:18', 30),
('DoctrineMigrations\\Version20230224225541', '2023-03-28 13:51:18', 39),
('DoctrineMigrations\\Version20230328122310', '2023-03-28 13:51:18', 31),
('DoctrineMigrations\\Version20230328131441', '2023-03-28 13:51:18', 34),
('DoctrineMigrations\\Version20230403081734', '2023-04-03 08:18:06', 213),
('DoctrineMigrations\\Version20230404081706', '2023-04-04 08:50:36', 189),
('DoctrineMigrations\\Version20230404165436', '2023-04-04 16:54:59', 292),
('DoctrineMigrations\\Version20230418072317', '2023-04-18 07:23:43', 961),
('DoctrineMigrations\\Version20230418073406', '2023-04-18 07:35:16', 219);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `main_picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `slug`, `category_id`, `main_picture`, `short_description`) VALUES
(1, 'Practical Wooden Watch', 17099, 'practical-wooden-watch', 1, 'https://picsum.photos/id/179/400/400', 'Expedita eos nihil eaque asperiores soluta. Voluptatem aut similique mollitia impedit ullam quas ipsam. Et ad nulla nihil assumenda et.'),
(2, 'Durable Plastic Knife', 7639, 'durable-plastic-knife', 1, 'https://picsum.photos/id/614/400/400', 'Aut quam sit occaecati nostrum. Perspiciatis placeat libero ut repellendus eligendi ut eius. Nihil animi quia consectetur ut voluptatem est illum corporis.'),
(3, 'Sleek Leather Computer', 14079, 'sleek-leather-computer', 1, 'https://picsum.photos/id/966/400/400', 'Officiis et non itaque totam ad ut fugit ipsam. Mollitia nesciunt nihil commodi ullam ut totam. Necessitatibus ducimus repellendus aut natus eaque qui quae. Voluptatem rerum molestiae reprehenderit ipsum dolor quidem.'),
(4, 'Fantastic Wooden Bag', 7259, 'fantastic-wooden-bag', 1, 'https://picsum.photos/id/922/400/400', 'Modi sed magnam repudiandae vero accusamus repudiandae distinctio. Doloremque doloribus omnis soluta ipsum. Sit nesciunt et sit accusantium qui doloremque.'),
(5, 'Mediocre Copper Clock', 6109, 'mediocre-copper-clock', 1, 'https://picsum.photos/id/273/400/400', 'Minima facilis similique qui odio rerum voluptas sit. Itaque sunt iure sed qui voluptatem. Ut voluptatem rerum modi animi dolorem. Tempore fugiat et molestiae omnis.'),
(6, 'Sleek Leather Table', 12059, 'sleek-leather-table', 1, 'https://picsum.photos/id/14/400/400', 'Aliquam perspiciatis velit voluptatem aut id alias eligendi ea. Et aut et et quis nulla. Qui sunt id cum eligendi repellendus vitae. Fuga natus ratione dolorem quisquam culpa quo et.'),
(7, 'Practical Rubber Table', 7399, 'practical-rubber-table', 1, 'https://picsum.photos/id/1063/400/400', 'Officia quam veritatis necessitatibus totam quod. Totam non qui molestiae et sint expedita dolores. Enim impedit pariatur omnis assumenda illum. Autem voluptates sit alias mollitia. Natus eum et quo dignissimos consequatur aliquam.'),
(8, 'Practical Wool Table', 14339, 'practical-wool-table', 1, 'https://picsum.photos/id/533/400/400', 'Doloremque vitae magnam possimus amet similique molestias. Cumque officiis laboriosam tenetur adipisci ipsum debitis ratione. Harum eos sit et optio fugit. In nesciunt suscipit quis ad excepturi quia.'),
(9, 'Sleek Cotton Hat', 18599, 'sleek-cotton-hat', 1, 'https://picsum.photos/id/184/400/400', 'Id autem amet impedit in. Necessitatibus distinctio adipisci eius temporibus omnis architecto qui. Eos rerum aut ad corrupti. Non vitae perferendis fugiat.'),
(10, 'Fantastic Silk Keyboard', 19879, 'fantastic-silk-keyboard', 1, 'https://picsum.photos/id/522/400/400', 'Commodi sit facilis et dolores reiciendis quos qui. Sint cum ex quam deserunt enim totam sapiente. Consectetur modi dolorem et quod molestiae doloribus cupiditate expedita.'),
(11, 'Synergistic Plastic Plate', 9779, 'synergistic-plastic-plate', 1, 'https://picsum.photos/id/130/400/400', 'Labore commodi tempora est fuga autem alias dolorem. Eius et tenetur impedit aut libero et autem. Natus tempore est quo voluptatem. Maxime veritatis quod exercitationem soluta earum quia facere.'),
(12, 'Ergonomic Cotton Knife', 9049, 'ergonomic-cotton-knife', 1, 'https://picsum.photos/id/1055/400/400', 'Ratione distinctio molestiae illum natus nisi voluptates deserunt. Magni saepe ut earum mollitia. Dolorem asperiores sit ea consectetur amet aut earum ex. Asperiores dolores neque dolores distinctio.'),
(13, 'Intelligent Cotton Bag', 16719, 'intelligent-cotton-bag', 1, 'https://picsum.photos/id/22/400/400', 'Libero sunt tempore fugit dolores velit sed. Qui dolor veritatis quia voluptatem aut harum. Ad aliquam sunt aut beatae dolor velit similique voluptatem. At qui reiciendis voluptates laboriosam.'),
(14, 'Fantastic Concrete Watch', 14479, 'fantastic-concrete-watch', 1, 'https://picsum.photos/id/304/400/400', 'Est cupiditate quae voluptas. Sed molestiae ut voluptas ab. Laborum eos aspernatur praesentium numquam deleniti vel. Iusto cumque sit cumque.'),
(15, 'Awesome Iron Table', 9679, 'awesome-iron-table', 1, 'https://picsum.photos/id/339/400/400', 'Necessitatibus sit quae temporibus voluptas cumque quis corporis. Et dicta sit non iusto accusantium ipsa repudiandae. Ipsam debitis harum veritatis. Numquam similique illo unde distinctio exercitationem.'),
(16, 'Incredible Rubber Gloves', 5759, 'incredible-rubber-gloves', 1, 'https://picsum.photos/id/588/400/400', 'Ut magni officia est qui ut tempora quia. Et qui cupiditate quod doloremque. Voluptatibus voluptatibus dignissimos quisquam sed sit dolor ut qui.'),
(17, 'Gorgeous Copper Gloves', 17099, 'gorgeous-copper-gloves', 1, 'https://picsum.photos/id/20/400/400', 'Quia aperiam et earum praesentium ab sed cumque amet. Quis earum molestiae voluptas ipsam voluptatum. Velit maxime enim cumque ut sunt.'),
(18, 'Gorgeous Plastic Gloves', 13989, 'gorgeous-plastic-gloves', 2, 'https://picsum.photos/id/372/400/400', 'Vel exercitationem minima sunt saepe explicabo. Quo animi distinctio sapiente voluptatum.'),
(19, 'Aerodynamic Linen Keyboard', 6449, 'aerodynamic-linen-keyboard', 2, 'https://picsum.photos/id/485/400/400', 'Culpa autem eaque sit explicabo. Molestiae consequatur animi quod veritatis. Alias id sit sapiente doloremque accusamus velit autem.'),
(20, 'Awesome Plastic Table', 19269, 'awesome-plastic-table', 2, 'https://picsum.photos/id/835/400/400', 'Et quam dignissimos qui accusantium. Ut culpa natus voluptatem qui voluptate.'),
(21, 'Enormous Aluminum Plate', 16629, 'enormous-aluminum-plate', 2, 'https://picsum.photos/id/738/400/400', 'Ut fuga eum non laborum ex. Sed deserunt rerum in qui. Et velit nihil qui sed nihil velit. Labore dolore officiis itaque officiis tempora omnis reiciendis.'),
(22, 'Ergonomic Leather Coat', 5359, 'ergonomic-leather-coat', 2, 'https://picsum.photos/id/502/400/400', 'Quidem assumenda inventore nihil quaerat molestiae. A possimus magnam occaecati explicabo non dolorem magni. Provident et rem occaecati est sit voluptas.'),
(23, 'Synergistic Silk Shirt', 10509, 'synergistic-silk-shirt', 2, 'https://picsum.photos/id/844/400/400', 'Molestias eum enim sit incidunt saepe. Explicabo aut commodi explicabo ea eum neque recusandae eveniet. Assumenda omnis id consectetur tenetur autem tenetur occaecati. Aut architecto ea sunt dignissimos officiis.'),
(24, 'Small Wooden Keyboard', 5889, 'small-wooden-keyboard', 2, 'https://picsum.photos/id/894/400/400', 'Voluptatum omnis sit facere temporibus. Nihil esse quas quia non eos esse. Optio et minus officiis quo ut molestiae.'),
(25, 'Sleek Rubber Coat', 16759, 'sleek-rubber-coat', 2, 'https://picsum.photos/id/773/400/400', 'Sed atque expedita et laboriosam explicabo minima nesciunt. Ut sed et debitis omnis dolor. Excepturi sed quis voluptatem qui. Est nulla sequi numquam quo eaque fugit aut.'),
(26, 'Gorgeous Marble Wallet', 13459, 'gorgeous-marble-wallet', 2, 'https://picsum.photos/id/455/400/400', 'A in vero sit quasi. Sed et voluptates laboriosam soluta ut aspernatur. Et assumenda eos temporibus consectetur odio. Qui maxime illum sit cum consequuntur enim quo.'),
(27, 'Small Leather Bench', 10699, 'small-leather-bench', 2, 'https://picsum.photos/id/799/400/400', 'Dolorem officia magnam temporibus modi. Est fuga et doloremque veniam dignissimos laudantium. Similique voluptas aperiam sed voluptatibus totam voluptate perferendis. Sit ipsa sint suscipit non reprehenderit adipisci ab.'),
(28, 'Durable Aluminum Bench', 8319, 'durable-aluminum-bench', 2, 'https://picsum.photos/id/483/400/400', 'Omnis repellendus nesciunt temporibus dignissimos. Dolore fugiat nostrum possimus et nostrum. Sit voluptatem sed qui autem exercitationem.'),
(29, 'Small Aluminum Keyboard', 7859, 'small-aluminum-keyboard', 2, 'https://picsum.photos/id/449/400/400', 'Consequuntur facilis quam ipsam doloremque accusantium quas laboriosam. Consectetur error et qui vero blanditiis facilis. Nihil qui exercitationem sunt quo. Fuga magni et et totam.'),
(30, 'Heavy Duty Rubber Bag', 12349, 'heavy-duty-rubber-bag', 2, 'https://picsum.photos/id/434/400/400', 'Voluptas dolorem et porro ipsa. Ex vel provident modi ut voluptatibus. Quos qui omnis modi.'),
(31, 'Aerodynamic Silk Plate', 15239, 'aerodynamic-silk-plate', 2, 'https://picsum.photos/id/890/400/400', 'Impedit eos laudantium itaque nostrum. Asperiores consequuntur illo ipsa.'),
(32, 'Practical Copper Knife', 9749, 'practical-copper-knife', 2, 'https://picsum.photos/id/525/400/400', 'Molestias veritatis quis placeat architecto qui reprehenderit. Voluptate in qui natus accusantium consequatur iste dolorum. Rem alias veniam est.'),
(33, 'Ergonomic Wooden Car', 6949, 'ergonomic-wooden-car', 2, 'https://picsum.photos/id/42/400/400', 'Nisi consequatur qui ut repudiandae. Ipsam animi ut vel expedita. Aut dolores voluptate laudantium veniam consequatur.'),
(34, 'Gorgeous Rubber Pants', 8109, 'gorgeous-rubber-pants', 2, 'https://picsum.photos/id/159/400/400', 'Repellat repellat maxime quia eaque et neque beatae. Necessitatibus ducimus facere explicabo et aut ad quia. Et velit qui nihil harum.'),
(35, 'Sleek Silk Computer', 16739, 'sleek-silk-computer', 2, 'https://picsum.photos/id/120/400/400', 'Autem et fugit dolore sunt sit dolores corporis. Pariatur animi voluptas rem omnis consequatur ut tenetur excepturi. Quis voluptas ad dolores quia neque sed. Unde quia nostrum doloribus necessitatibus hic dolore pariatur.'),
(36, 'Awesome Cotton Wallet', 5879, 'awesome-cotton-wallet', 2, 'https://picsum.photos/id/475/400/400', 'Nostrum ut corrupti fuga dolor voluptate vel odio repellendus. Nihil error sed esse aut in provident. Fugit eaque sit voluptate vero. Omnis quia placeat unde totam sed voluptatem ut.'),
(37, 'Ergonomic Linen Shoes', 7419, 'ergonomic-linen-shoes', 3, 'https://picsum.photos/id/29/400/400', 'Aut nam sed sunt omnis. Voluptatem dolorem aut voluptas ea sint. Consequatur quis et sit debitis. Blanditiis in et asperiores odio perspiciatis.'),
(38, 'Rustic Linen Lamp', 5789, 'rustic-linen-lamp', 3, 'https://picsum.photos/id/864/400/400', 'Qui possimus autem est illum quae beatae molestiae. Non sed culpa minima rerum quaerat consequatur iure. Quia iure commodi et perspiciatis at sint. Sunt dolorem at magni aut quisquam exercitationem.'),
(39, 'Awesome Marble Computer', 13639, 'awesome-marble-computer', 3, 'https://picsum.photos/id/961/400/400', 'Perferendis est et eos ea in expedita repellat. Iusto iusto quis ea qui a voluptatem fugit. Doloribus modi quisquam laboriosam ea quisquam. Voluptas hic provident nulla excepturi doloremque quasi eaque.'),
(40, 'Sleek Silk Chair', 17419, 'sleek-silk-chair', 3, 'https://picsum.photos/id/634/400/400', 'Cum aut id doloremque nihil accusantium aspernatur rerum. Fuga cupiditate aspernatur doloremque unde. Totam distinctio occaecati ut enim cum culpa.'),
(41, 'Fantastic Marble Car', 14769, 'fantastic-marble-car', 3, 'https://picsum.photos/id/218/400/400', 'Est corrupti eius dolores optio deleniti quis. Ut soluta voluptas ab modi asperiores.'),
(42, 'Durable Steel Wallet', 12999, 'durable-steel-wallet', 3, 'https://picsum.photos/id/78/400/400', 'Iusto quaerat ullam ipsam aut reiciendis. Ad architecto voluptas ex eius sequi. Sed sunt facilis dolore et. Et quis placeat aliquam sapiente est laudantium veniam.'),
(43, 'Incredible Marble Bag', 14139, 'incredible-marble-bag', 3, 'https://picsum.photos/id/921/400/400', 'Ut perspiciatis quibusdam et et non consequuntur. Similique repellendus sunt ut placeat sunt magnam tempore. Quaerat provident ipsam reprehenderit dolore labore vel. Consequatur sed aspernatur sint voluptate.'),
(44, 'Synergistic Plastic Gloves', 5819, 'synergistic-plastic-gloves', 3, 'https://picsum.photos/id/328/400/400', 'Ut quae sed et et assumenda asperiores quia. Culpa est repellat cumque quibusdam. Molestiae odit a quia nam ad possimus.'),
(45, 'Gorgeous Plastic Lamp', 15619, 'gorgeous-plastic-lamp', 3, 'https://picsum.photos/id/74/400/400', 'Omnis et facilis animi asperiores. Voluptas dolorum hic sequi.'),
(46, 'Durable Leather Hat', 13809, 'durable-leather-hat', 3, 'https://picsum.photos/id/931/400/400', 'Blanditiis soluta quos facere exercitationem hic repellendus quis. Ipsum et veritatis totam aut. Nihil non cumque voluptates ut earum.'),
(47, 'Sleek Cotton Plate', 11269, 'sleek-cotton-plate', 3, 'https://picsum.photos/id/233/400/400', 'Omnis eum et aperiam rem vel. Asperiores in at suscipit rerum dicta. Qui modi nisi voluptatem.'),
(48, 'Fantastic Linen Table', 19649, 'fantastic-linen-table', 3, 'https://picsum.photos/id/313/400/400', 'Aut ad aut illo ut sint deleniti sed dolorem. Eum est animi assumenda minima ut. Non dolore sit repudiandae.'),
(49, 'Heavy Duty Marble Chair', 14539, 'heavy-duty-marble-chair', 3, 'https://picsum.photos/id/614/400/400', 'Et et quas ut tempora est dolore. Recusandae officia sapiente nihil voluptates. Libero labore voluptates delectus soluta.'),
(50, 'Practical Granite Gloves', 9899, 'practical-granite-gloves', 3, 'https://picsum.photos/id/281/400/400', 'Quisquam voluptas minima dolores et et et est. Quia fuga eius voluptatem quisquam eum voluptatem beatae animi. Earum et aut fugiat nulla.'),
(51, 'Heavy Duty Rubber Hat', 5159, 'heavy-duty-rubber-hat', 3, 'https://picsum.photos/id/893/400/400', 'Voluptas sunt molestias ipsam hic. Et excepturi autem et quo eius dolorem voluptatem et. Qui sunt modi quas ut et. Deserunt tempora facilis fuga quos nihil modi vitae voluptatum.'),
(52, 'Lightweight Wool Table', 17119, 'lightweight-wool-table', 3, 'https://picsum.photos/id/91/400/400', 'Repellat illum sed suscipit. Quo et nisi ducimus atque blanditiis quis. Placeat tenetur enim quia ducimus dolores consequatur corporis. Similique odio et in quam et.'),
(53, 'Synergistic Cotton Lamp', 13909, 'synergistic-cotton-lamp', 3, 'https://picsum.photos/id/268/400/400', 'Sed modi pariatur omnis vel adipisci. Ducimus voluptas iure occaecati. Sint natus numquam est dolor alias.'),
(54, 'Mediocre Wooden Table', 7019, 'mediocre-wooden-table', 3, 'https://picsum.photos/id/254/400/400', 'Et est dolorem ab consequatur ut. Totam amet fugit maiores blanditiis quisquam. Enim qui incidunt quia. Cum error nisi quos optio ipsa reprehenderit.');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchased_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`id`, `user_id`, `full_name`, `address`, `postal_code`, `city`, `total`, `status`, `purchased_at`) VALUES
(1, 5, 'Jacques-Alphonse Fernandez', '74, avenue de Le Goff\n29887 Maillet-sur-Lopez', '85 725', 'Pierredan', 8843, 'PAID', '2022-10-31 17:10:07'),
(2, 6, 'Thibault Deschamps', '51, place de Bouvet\n31 288 DuvalBourg', '84831', 'Fabre-sur-Royer', 2431, 'PAID', '2023-01-20 09:22:35'),
(3, 4, 'Marcel Alexandre', '9, boulevard de Tessier\n35 976 Merle-les-Bains', '60115', 'Jacquot', 9652, 'PAID', '2023-03-29 10:27:16'),
(4, 6, 'Roland-Marcel Lefort', '423, impasse Descamps\n17596 Chretien', '90 015', 'Carlier', 23336, 'PAID', '2023-01-14 15:20:48'),
(5, 4, 'Susan Maurice', '18, rue de Maurice\n88 875 Morvan', '06899', 'LegendreVille', 17444, 'PAID', '2023-02-05 08:47:18'),
(6, 2, 'Chantal Hoarau', '5, place Julie Texier\n31984 Mariondan', '77379', 'De Sousaboeuf', 4473, 'PAID', '2023-03-22 01:55:48'),
(7, 3, 'Corinne Laroche-Collin', '25, impasse Dupre\n73776 Menard', '58 717', 'Allain-sur-Brunel', 19114, 'PAID', '2023-03-12 16:11:12'),
(8, 4, 'Adrienne Hamon', 'rue Patrick Mercier\n48 602 Leleudan', '59725', 'Martineaudan', 10702, 'PENDING', '2022-11-06 10:20:18'),
(9, 4, 'Aurore-Audrey Becker', '64, rue de Leclercq\n80 653 Maury', '46 509', 'Camus', 25387, 'PAID', '2023-04-06 12:39:21'),
(10, 3, 'Christophe de Marie', 'avenue Jeanne Colin\n01467 Merle-sur-Mer', '31 796', 'Valleedan', 3925, 'PAID', '2023-02-07 06:27:37'),
(11, 6, 'Étienne Teixeira', '694, place de Cousin\n73568 Masson', '88643', 'Vasseur', 10135, 'PAID', '2023-04-19 05:28:48'),
(12, 3, 'Henriette Coste', 'place Lemaitre\n36 072 Langlois-les-Bains', '11772', 'Hubert', 17361, 'PAID', '2022-12-28 15:55:45'),
(13, 6, 'Maurice Blanchet', '7, rue Josette Leconte\n20 785 Richard', '93980', 'Malletnec', 10413, 'PAID', '2023-01-31 20:57:15'),
(14, 2, 'Gérard Lemonnier', '19, rue de Lagarde\n08113 Jacob-sur-Carlier', '88 062', 'Mariondan', 6929, 'PENDING', '2022-12-18 15:24:48'),
(15, 2, 'Michelle Masse', '289, boulevard Le Goff\n41667 David', '98915', 'Gosselin-la-Forêt', 5532, 'PAID', '2023-01-10 23:23:37'),
(16, 3, 'Margaret Dijoux-Verdier', 'rue Hamel\n29 639 Regnier-la-Forêt', '09 500', 'Noel-sur-Coulon', 25703, 'PAID', '2023-03-21 03:31:56'),
(17, 4, 'Sébastien Millet', '85, chemin de Henry\n28276 Petit', '09880', 'Faure-sur-Mer', 10259, 'PAID', '2023-03-20 21:15:25'),
(18, 3, 'Théodore Olivier', '640, avenue Grégoire Merle\n29145 Rossi', '95681', 'Buisson-sur-Lemaitre', 29397, 'PAID', '2023-04-05 14:57:07'),
(19, 3, 'Dominique Valette', 'boulevard de Gillet\n06696 Hardy', '28 980', 'Pichon', 25495, 'PAID', '2022-12-25 03:37:46'),
(20, 3, 'Georges Peltier', '72, rue Maury\n75 462 Pires-sur-Besson', '69524', 'Fernandesnec', 28060, 'PAID', '2022-12-20 16:26:52'),
(21, 6, 'Marcelle Ferreira', '428, rue de Sanchez\n34576 Simon', '49575', 'Legros', 7294, 'PENDING', '2023-04-22 03:09:31'),
(22, 6, 'Olivier Auger', '7, avenue de Royer\n34932 Roche', '28 738', 'Mailletboeuf', 23236, 'PAID', '2022-12-28 13:58:27'),
(23, 3, 'Guy Le Nguyen', '764, boulevard Gilbert Raynaud\n16666 Bousquet', '80 380', 'Hamonnec', 13960, 'PAID', '2023-01-04 07:49:04');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_item`
--

CREATE TABLE `purchase_item` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_item`
--

INSERT INTO `purchase_item` (`id`, `product_id`, `purchase_id`, `product_name`, `product_price`, `quantity`, `total`) VALUES
(1, 22, 1, 'Ergonomic Leather Coat', 5359, 2, 10718),
(2, 35, 1, 'Sleek Silk Computer', 16739, 2, 33478),
(3, 4, 1, 'Fantastic Wooden Bag', 7259, 1, 7259),
(4, 9, 1, 'Sleek Cotton Hat', 18599, 1, 18599),
(5, 29, 2, 'Small Aluminum Keyboard', 7859, 3, 23577),
(6, 17, 2, 'Gorgeous Copper Gloves', 17099, 3, 51297),
(7, 21, 2, 'Enormous Aluminum Plate', 16629, 3, 49887),
(8, 13, 3, 'Intelligent Cotton Bag', 16719, 2, 33438),
(9, 1, 3, 'Practical Wooden Watch', 17099, 2, 34198),
(10, 22, 3, 'Ergonomic Leather Coat', 5359, 3, 16077),
(11, 3, 3, 'Sleek Leather Computer', 14079, 1, 14079),
(12, 29, 3, 'Small Aluminum Keyboard', 7859, 3, 23577),
(13, 31, 4, 'Aerodynamic Silk Plate', 15239, 3, 45717),
(14, 53, 4, 'Synergistic Cotton Lamp', 13909, 3, 41727),
(15, 6, 4, 'Sleek Leather Table', 12059, 2, 24118),
(16, 4, 5, 'Fantastic Wooden Bag', 7259, 3, 21777),
(17, 3, 5, 'Sleek Leather Computer', 14079, 1, 14079),
(18, 21, 5, 'Enormous Aluminum Plate', 16629, 3, 49887),
(19, 16, 5, 'Incredible Rubber Gloves', 5759, 2, 11518),
(20, 50, 5, 'Practical Granite Gloves', 9899, 2, 19798),
(21, 40, 6, 'Sleek Silk Chair', 17419, 3, 52257),
(22, 8, 6, 'Practical Wool Table', 14339, 1, 14339),
(23, 3, 6, 'Sleek Leather Computer', 14079, 3, 42237),
(24, 42, 7, 'Durable Steel Wallet', 12999, 3, 38997),
(25, 46, 7, 'Durable Leather Hat', 13809, 3, 41427),
(26, 25, 7, 'Sleek Rubber Coat', 16759, 3, 50277),
(27, 9, 8, 'Sleek Cotton Hat', 18599, 3, 55797),
(28, 15, 8, 'Awesome Iron Table', 9679, 2, 19358),
(29, 17, 8, 'Gorgeous Copper Gloves', 17099, 1, 17099),
(30, 26, 9, 'Gorgeous Marble Wallet', 13459, 1, 13459),
(31, 13, 9, 'Intelligent Cotton Bag', 16719, 3, 50157),
(32, 1, 9, 'Practical Wooden Watch', 17099, 3, 51297),
(33, 11, 9, 'Synergistic Plastic Plate', 9779, 3, 29337),
(34, 36, 10, 'Awesome Cotton Wallet', 5879, 3, 17637),
(35, 21, 10, 'Enormous Aluminum Plate', 16629, 3, 49887),
(36, 41, 10, 'Fantastic Marble Car', 14769, 2, 29538),
(37, 28, 10, 'Durable Aluminum Bench', 8319, 3, 24957),
(38, 8, 11, 'Practical Wool Table', 14339, 1, 14339),
(39, 21, 11, 'Enormous Aluminum Plate', 16629, 3, 49887),
(40, 34, 11, 'Gorgeous Rubber Pants', 8109, 1, 8109),
(41, 31, 11, 'Aerodynamic Silk Plate', 15239, 2, 30478),
(42, 41, 11, 'Fantastic Marble Car', 14769, 3, 44307),
(43, 54, 12, 'Mediocre Wooden Table', 7019, 2, 14038),
(44, 53, 12, 'Synergistic Cotton Lamp', 13909, 3, 41727),
(45, 50, 12, 'Practical Granite Gloves', 9899, 2, 19798),
(46, 24, 13, 'Small Wooden Keyboard', 5889, 2, 11778),
(47, 38, 13, 'Rustic Linen Lamp', 5789, 3, 17367),
(48, 49, 13, 'Heavy Duty Marble Chair', 14539, 3, 43617),
(49, 37, 13, 'Ergonomic Linen Shoes', 7419, 3, 22257),
(50, 10, 13, 'Fantastic Silk Keyboard', 19879, 3, 59637),
(51, 15, 14, 'Awesome Iron Table', 9679, 3, 29037),
(52, 19, 14, 'Aerodynamic Linen Keyboard', 6449, 2, 12898),
(53, 4, 14, 'Fantastic Wooden Bag', 7259, 1, 7259),
(54, 42, 14, 'Durable Steel Wallet', 12999, 3, 38997),
(55, 3, 14, 'Sleek Leather Computer', 14079, 3, 42237),
(56, 45, 15, 'Gorgeous Plastic Lamp', 15619, 3, 46857),
(57, 25, 15, 'Sleek Rubber Coat', 16759, 3, 50277),
(58, 22, 15, 'Ergonomic Leather Coat', 5359, 2, 10718),
(59, 4, 15, 'Fantastic Wooden Bag', 7259, 2, 14518),
(60, 43, 16, 'Incredible Marble Bag', 14139, 2, 28278),
(61, 11, 16, 'Synergistic Plastic Plate', 9779, 2, 19558),
(62, 51, 16, 'Heavy Duty Rubber Hat', 5159, 3, 15477),
(63, 47, 17, 'Sleek Cotton Plate', 11269, 3, 33807),
(64, 30, 17, 'Heavy Duty Rubber Bag', 12349, 1, 12349),
(65, 38, 17, 'Rustic Linen Lamp', 5789, 1, 5789),
(66, 43, 17, 'Incredible Marble Bag', 14139, 2, 28278),
(67, 40, 17, 'Sleek Silk Chair', 17419, 1, 17419),
(68, 36, 18, 'Awesome Cotton Wallet', 5879, 3, 17637),
(69, 44, 18, 'Synergistic Plastic Gloves', 5819, 3, 17457),
(70, 45, 18, 'Gorgeous Plastic Lamp', 15619, 3, 46857),
(71, 5, 18, 'Mediocre Copper Clock', 6109, 1, 6109),
(72, 36, 19, 'Awesome Cotton Wallet', 5879, 2, 11758),
(73, 26, 19, 'Gorgeous Marble Wallet', 13459, 2, 26918),
(74, 17, 19, 'Gorgeous Copper Gloves', 17099, 3, 51297),
(75, 18, 20, 'Gorgeous Plastic Gloves', 13989, 2, 27978),
(76, 12, 20, 'Ergonomic Cotton Knife', 9049, 2, 18098),
(77, 31, 20, 'Aerodynamic Silk Plate', 15239, 3, 45717),
(78, 33, 21, 'Ergonomic Wooden Car', 6949, 1, 6949),
(79, 26, 21, 'Gorgeous Marble Wallet', 13459, 2, 26918),
(80, 15, 21, 'Awesome Iron Table', 9679, 1, 9679),
(81, 25, 22, 'Sleek Rubber Coat', 16759, 1, 16759),
(82, 23, 22, 'Synergistic Silk Shirt', 10509, 1, 10509),
(83, 14, 22, 'Fantastic Concrete Watch', 14479, 2, 28958),
(84, 20, 22, 'Awesome Plastic Table', 19269, 3, 57807),
(85, 11, 23, 'Synergistic Plastic Plate', 9779, 1, 9779),
(86, 43, 23, 'Incredible Marble Bag', 14139, 2, 28278),
(87, 22, 23, 'Ergonomic Leather Coat', 5359, 2, 10718),
(88, 39, 23, 'Awesome Marble Computer', 13639, 3, 40917);

-- --------------------------------------------------------

--
-- Table structure for table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `fullname`, `created_at`) VALUES
(1, 'admin@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$Fe8yiM8RJ1vgRJRzkzc2BeRdjvlblUAexvmjrnhCxTog9/HnbcN1i', 'admin', '2023-04-25 19:49:06'),
(2, 'user0@gmail.com', '[]', '$2y$13$1c45hKdweiE6LEgWhx/gmOZmeG8qburYwUFG4Sbxc63iJvROViJp.', 'Céline-Louise Pierre', '2023-04-25 19:49:07'),
(3, 'user1@gmail.com', '[]', '$2y$13$AiGHFIB2YvYFCmUPIrCZveNMHFL5k/ZtnZebbiiGRxFPzAJuYCici', 'Laurence Martineau', '2023-04-25 19:49:07'),
(4, 'user2@gmail.com', '[]', '$2y$13$sZMIUeRnA7q7HdktOVoNc.BbV2CVJWWHIkzkKl/wP/Z6p/M/GfBM.', 'Vincent-William Weber', '2023-04-25 19:49:08'),
(5, 'user3@gmail.com', '[]', '$2y$13$qQVSbcplVnvuDNpyE4I3hu/N2Z.i3PQ20zSNob/SFuqPaxOYy4cUy', 'Charles Dubois', '2023-04-25 19:49:08'),
(6, 'user4@gmail.com', '[]', '$2y$13$CjUxX0jMvQWfiGTjEi.9Vebrr2ZUPvkAr0zBjlujaL6jtYjoO4n5i', 'Antoine Jourdan', '2023-04-25 19:49:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6117D13BA76ED395` (`user_id`);

--
-- Indexes for table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6FA8ED7D4584665A` (`product_id`),
  ADD KEY `IDX_6FA8ED7D558FBEB9` (`purchase_id`);

--
-- Indexes for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `purchase_item`
--
ALTER TABLE `purchase_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category_id_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `FK_6117D13BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD CONSTRAINT `FK_6FA8ED7D4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_6FA8ED7D558FBEB9` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`id`);

--
-- Constraints for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
