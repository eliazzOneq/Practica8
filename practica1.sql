-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-06-2026 a las 06:07:50
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `practica1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `slug`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Electrónica', 'electronica', NULL, '2026-06-04 16:14:57', '2026-06-04 16:14:57'),
(2, 'Ropa', 'ropa', NULL, '2026-06-04 16:14:57', '2026-06-04 16:14:57'),
(3, 'Hogar', 'hogar', NULL, '2026-06-04 16:14:57', '2026-06-04 16:14:57'),
(4, 'Deportes', 'deportes', NULL, '2026-06-04 16:14:58', '2026-06-04 16:14:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_05_27_234217_create_productos_table', 1),
(5, '2026_05_28_215745_create_personal_access_tokens_table', 1),
(6, '2026_05_29_010400_create_pedidos_table', 1),
(7, '2026_05_29_012239_add_imagen_to_productos_table', 1),
(8, '2026_06_04_060926_create_categorias_table', 1),
(9, '2026_06_04_064835_add_categoria_id_to_productos_table', 1),
(10, '2026_06_05_014023_add_rol_to_users_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`items`)),
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'auth-token', 'c0408b57b4ac066a9da07af286493968d9a112e55c9714e165a8c3238bd3fe47', '[\"*\"]', NULL, NULL, '2026-06-05 08:40:22', '2026-06-05 08:40:22'),
(2, 'App\\Models\\User', 7, 'auth-token', '8bb7758d1918fdbf65ceaea208380c59b38c5f65068872f524aa4c4b564de93a', '[\"*\"]', NULL, NULL, '2026-06-05 08:41:02', '2026-06-05 08:41:02'),
(3, 'App\\Models\\User', 2, 'auth-token', '9fea3f05565de9d52eaac945de73faba99b59485f599cd1fbdee1163c5e8176a', '[\"*\"]', NULL, NULL, '2026-06-05 08:46:32', '2026-06-05 08:46:32'),
(4, 'App\\Models\\User', 2, 'auth-token', '8890428620b066f229729490d4b87b1a2b1b9501398f598eca504a3d65e0213a', '[\"*\"]', NULL, NULL, '2026-06-05 08:47:49', '2026-06-05 08:47:49'),
(5, 'App\\Models\\User', 2, 'auth-token', '9f8f1ed60db9b90475992cc478d47da97b0496d8a8b1b8c93d13de80880d3ac0', '[\"*\"]', '2026-06-05 08:52:13', NULL, '2026-06-05 08:52:09', '2026-06-05 08:52:13'),
(6, 'App\\Models\\User', 7, 'auth-token', '4d0bd1f85d86dbe040c0f7b0493d1daeb6738b5afb6e65255135481d82a34790', '[\"*\"]', '2026-06-05 08:53:20', NULL, '2026-06-05 08:53:17', '2026-06-05 08:53:20'),
(7, 'App\\Models\\User', 8, 'auth-token', 'cfadb6a40b0e4e68fac001efd7d92e64d663d27bba34ae478a23b2e1f3578449', '[\"*\"]', '2026-06-05 08:53:53', NULL, '2026-06-05 08:53:51', '2026-06-05 08:53:53'),
(8, 'App\\Models\\User', 2, 'auth-token', '165bbcd0f8a73c030ea84f7412fcd0f94c2880b821f943ea1b2e3ca4bf7aeefb', '[\"*\"]', '2026-06-05 09:22:11', NULL, '2026-06-05 08:56:45', '2026-06-05 09:22:11'),
(9, 'App\\Models\\User', 2, 'auth-token', '8de0d7e3c9cfbd69001cf97bb99028a1fb84acde5e566f4f987d4ef526439bfb', '[\"*\"]', '2026-06-05 09:23:40', NULL, '2026-06-05 09:23:38', '2026-06-05 09:23:40'),
(10, 'App\\Models\\User', 2, 'auth-token', 'ec2f4828c8c41c78820b1628ca903d84fe9d5a105bad7b49742b153aa30adcda', '[\"*\"]', '2026-06-05 09:27:35', NULL, '2026-06-05 09:27:33', '2026-06-05 09:27:35'),
(11, 'App\\Models\\User', 2, 'auth-token', 'a72ea12fb6279b7f6afb09107ce6276c164fc3abb9b2a2ef8ef97ae9c80a0ec9', '[\"*\"]', '2026-06-05 09:30:16', NULL, '2026-06-05 09:30:12', '2026-06-05 09:30:16'),
(12, 'App\\Models\\User', 2, 'auth-token', 'e917bd4cf6ced2dde850d86fdec2b49878249f4bed6e022ec658e47db0246102', '[\"*\"]', '2026-06-05 09:46:44', NULL, '2026-06-05 09:46:41', '2026-06-05 09:46:44'),
(13, 'App\\Models\\User', 2, 'auth-token', '3a003a7607d652784c08aafd5a5a2d841242f4ae7636610c63afbb5a16afaa16', '[\"*\"]', NULL, NULL, '2026-06-05 09:48:57', '2026-06-05 09:48:57'),
(14, 'App\\Models\\User', 7, 'auth-token', 'cf31f0f6c847687cac770c086e43e223f3bf9780f4e30e240fdb98bfdf13e99c', '[\"*\"]', '2026-06-05 10:01:04', NULL, '2026-06-05 09:55:10', '2026-06-05 10:01:04'),
(15, 'App\\Models\\User', 6, 'auth-token', 'f656d0ee15119de9d2aa80afdc4f3587316836134904995f34fcfca5ed6c2699', '[\"*\"]', '2026-06-05 10:03:34', NULL, '2026-06-05 10:03:32', '2026-06-05 10:03:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `categoria_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `stock`, `created_at`, `updated_at`, `imagen`, `categoria_id`) VALUES
(1, 'Mouse', 'Inalambrico HP', 325.00, 15, '2026-06-04 16:14:57', '2026-06-04 16:41:28', 'productos/uaeMV3M113BijQDuuRRugqezrrcsEFkJ5AQ6AK44.webp', 1),
(2, 'Extensor de Rango', 'TP-LINK TL-WA855RE', 405.00, 33, '2026-06-04 16:14:57', '2026-06-05 04:50:28', 'productos/Sun4lIsL0BbdrEs53zRtek436xtDKYfBpbq8Bl9A.webp', 1),
(3, 'Camara', 'Sony a6400', 16400.00, 10, '2026-06-04 16:14:57', '2026-06-05 04:46:17', 'productos/shAEd1ynLYW8oXZQWuYeRrT3HAdvY5MBp2JVxhDm.webp', 1),
(4, 'Audífonos Bluetooth', 'Select Sound BTH027', 469.00, 24, '2026-06-04 16:14:57', '2026-06-05 04:47:25', 'productos/0zjtNFZ60auyb5IXIwfiFpbflPMZQGg13CY8Zzu3.webp', 1),
(5, 'Reloj Electrónico', 'Cuadrado', 230.00, 21, '2026-06-04 16:14:57', '2026-06-05 05:03:59', 'productos/PWh4HRFxskdi66vwS7iWJIH3RXNMIovV1MEHwewv.webp', 1),
(6, 'Playera', 'Essential Sporty Levis', 454.00, 61, '2026-06-04 16:14:57', '2026-06-05 04:57:41', 'productos/PM6hkiokWGSu2Zb3aocTqNZC3OJYuBJJIw5DweWx.webp', 2),
(7, 'Chamarra', 'Para mujer, marca Puma', 472.00, 49, '2026-06-04 16:14:57', '2026-06-05 04:54:28', 'productos/Rg9zlhTF0Y5yy6hQosn6gAkm6EfvnnvqkFpJ7Ukd.webp', 2),
(8, 'Blusa', 'Holgada de cuello redondo', 257.00, 45, '2026-06-04 16:14:57', '2026-06-05 04:58:58', 'productos/AzYMvmyQShXNxfhJ8sv5ohU4rCwVL2uxFeKAvIMG.webp', 2),
(9, 'Polo', 'De algodon, Marca: Ferrari', 8500.00, 4, '2026-06-04 16:14:57', '2026-06-05 04:39:02', 'productos/zf4QEdqq6IU58qLEuNF2zs6rEEJLjoHJPbwWPPgW.webp', 2),
(10, 'Conjunto', 'Ropa deportiva para hombre', 210.00, 20, '2026-06-04 16:14:57', '2026-06-05 05:00:24', 'productos/HlaPR65PUQU7QYewtIxHpxkMsMCJQkCVagWehbSj.webp', 2),
(11, 'Olla', 'Kitchenaid', 1430.00, 16, '2026-06-04 16:14:57', '2026-06-05 05:05:58', 'productos/M6AT3yMJFGwhIjkXfgSqiI6XaJoyKjQtS2FMavrS.webp', 3),
(12, 'Ventilador', 'Vornado, 28 cm', 1333.00, 15, '2026-06-04 16:14:58', '2026-06-05 04:41:21', 'productos/5gUvjlrffsO87nYd0mXGoisRZo3SKLPastL6Ka5X.webp', 3),
(13, 'Cajonera', 'Kerrville con 3 cajones, Marron y Gris', 1899.00, 10, '2026-06-04 16:14:58', '2026-06-05 04:51:50', 'productos/Lf0rsXIuie34m3jPQ025fIJwRt5tPE8XVY4nu6oc.webp', 3),
(14, 'Vajilla', 'Vajilla cerrada para 4 personas', 1187.00, 16, '2026-06-04 16:14:58', '2026-06-05 04:55:35', 'productos/lLVHzUt6mLoJG6KJwnfjGpiaTnStt91Wk66DDRRe.webp', 3),
(15, 'Reloj Despertador', 'Misik mr486w', 559.00, 13, '2026-06-04 16:14:58', '2026-06-05 04:43:49', 'productos/i3BysdjglD8hCQ82fYmSuggOmSbAGyXCg3f4kEPU.webp', 3),
(16, 'Raqueta', 'Head Ti', 668.00, 25, '2026-06-04 16:14:58', '2026-06-05 04:42:22', 'productos/fWAg4h2vOXemIRfMfwNXcyrvFAFq2BNlfZ1IIBNU.webp', 4),
(17, 'Gafas de Natación', 'TYR Blackops 140 EV', 512.00, 63, '2026-06-04 16:14:58', '2026-06-05 04:45:32', 'productos/FbnMtlBan5pV1NGY4Oi9F9MFqGGbvnKAE8H7DmPX.webp', 4),
(18, 'Saco de Boxeo', 'Portatil e inflable', 701.00, 35, '2026-06-04 16:14:58', '2026-06-05 04:49:31', 'productos/wBvmPQOTF3PGiaZLJohQJ4OoK9XixLhE3E5ulIJO.webp', 4),
(19, 'Mancuernas', 'Par de mancuernas hexagonales de 3lb', 1889.00, 6, '2026-06-04 16:14:58', '2026-06-05 04:48:43', 'productos/bjL2QM0YnPJbRt1xxqmJF9VmNPNIddhPOIHgEZka.webp', 4),
(20, 'Canasta de Baloncesto', 'Ajustable', 1000.00, 11, '2026-06-04 16:14:58', '2026-06-05 05:01:56', 'productos/iiBwdtmZLEgOF73D0ojhXVhyVjppENjioNsSZqgK.webp', 4),
(21, 'Audífonos', 'STF Orion True Wireless Blanco', 530.00, 20, '2026-06-05 05:07:54', '2026-06-05 05:07:54', 'productos/M5YyNsCEcWayMrqpEFEuIl6AHnobHd8d0o6rgCmh.webp', 1),
(22, 'Tableta', 'Samsung Galaxy Tab S10 Fe', 6810.00, 9, '2026-06-05 05:08:39', '2026-06-05 05:08:39', 'productos/3E2ioOGWKuPhKdMKEx0oBXLPdQoFvz6ssgLCzIv5.webp', 1),
(23, 'Teclado y Mouse', 'Kit Logitech MK345', 799.00, 12, '2026-06-05 05:10:00', '2026-06-05 05:10:00', 'productos/FuiMh5HDamdM556W0dDb58CKbmSOLyaCSczYr8hH.webp', 1),
(24, 'Bocina', 'woofer 12 portátil Alienpro Ap-600 tws rgb 130w rms', 5010.00, 5, '2026-06-05 05:10:59', '2026-06-05 05:10:59', 'productos/80IEtaOSlvObxQjcnqLXaeNDQzoHYWdETPSYVDH6.webp', 1),
(25, 'Televisión', 'Hisense 4K QLED', 6001.00, 10, '2026-06-05 05:12:12', '2026-06-05 05:12:12', 'productos/pNs9MBj1NWu6YvANXVNCmuF4d4TQFBAwqisK15JL.webp', 1),
(26, 'Mono', 'Mono De Mujer Ropa Casual De Verano Correas Ajustables', 356.00, 40, '2026-06-05 05:16:38', '2026-06-05 05:16:38', 'productos/jEMbduckYGiMnRcw3q4LpbPPQaFoDTTrtaN0TmoY.webp', 2),
(27, 'Chaleco', 'Sandro', 6280.00, 21, '2026-06-05 05:17:44', '2026-06-05 05:17:44', 'productos/X8bPK1XtII8yClRCbjsicmLYiNdbxg3M2s2uzbwa.webp', 2),
(28, 'Ropa de Fiesta', 'Alta calidad, K 40624', 424.00, 10, '2026-06-05 05:18:44', '2026-06-05 05:18:44', 'productos/xWTl1m2GxbGDtQNVshtKhpSh8fn7ZApCa7xWzFdd.webp', 2),
(29, 'Traje', 'Men\'s BOSS Traje slim fit de dos piezas en lana virgen a cuadros', 14290.00, 9, '2026-06-05 05:20:08', '2026-06-05 05:20:08', 'productos/PLyTtTSRA7e28FYgZ66AZJp93natRS5OhP8mgMCh.webp', 2),
(30, 'Vestido', 'Ivonne, sin mangas y estampado', 2189.00, 4, '2026-06-05 05:21:18', '2026-06-05 05:21:18', 'productos/tIZzobJOk7p1p0tmGenAnONGsomZS2efejjEN5j2.webp', 2),
(31, 'Mueble de Cocina', 'para Fregadero agata madesa 1 puerta 2 cajones Crema/Blanco', 6750.00, 3, '2026-06-05 05:23:37', '2026-06-05 05:23:37', 'productos/0aButMEIzRKtdEcElUVAvPeSDuQScPHIyWmCRmRl.webp', 3),
(32, 'Aspiradora', 'Alámbrica Westinghouse 1.2 L 600w Wfvc600bk', 1189.00, 14, '2026-06-05 05:24:46', '2026-06-05 05:24:46', 'productos/H5NaQCFeIfeUDuq3l1XG1SyOUzy9SWYd2rKgUJqQ.webp', 3),
(33, 'Cesta de Frutas', 'komfora de bambú de 3 niveles con 2 perchas para cocina', 2319.00, 5, '2026-06-05 05:26:12', '2026-06-05 05:26:12', 'productos/2r473Z1oWoExLU3whZV3DyIjeiPhP5LjfwkhS2pB.webp', 3),
(34, 'Cafetera', 'Fcsa Boro 600ml', 357.00, 4, '2026-06-05 05:27:42', '2026-06-05 05:27:42', 'productos/gmTcpD46gfXbnT0INYCnNrR9IFOuNo50R0aAx2iC.jpg', 3),
(35, 'Limpiador', 'Lavanda Mejorado 5 Lt', 55.00, 23, '2026-06-05 05:28:23', '2026-06-05 05:28:23', 'productos/Zww8aTIZ6iYyUqwQT30BVQdCmt0X1njoYMA6I748.jpg', 3),
(36, 'Tenis', 'Asics Gel-Pulse 16 Hombre', 2825.00, 11, '2026-06-05 05:29:43', '2026-06-05 05:29:43', 'productos/kFX2mMNStyEYYiQjnRSxJfJIYAmQDWCobnqA0JeJ.webp', 4),
(37, 'Bolsa de Raquetas', 'Multi Babolat Team Con 2 Raquetas Pulsión', 2240.00, 21, '2026-06-05 05:30:51', '2026-06-05 05:30:51', 'productos/VuFHuDn62vPC0zvkJn74yVKsTQtRtHADW1OGYnor.webp', 4),
(38, 'Balon de Futbol', 'Mxgnp-001', 950.00, 10, '2026-06-05 05:32:19', '2026-06-05 05:32:19', 'productos/NIt3eWOeRdrHwHhTIrRR1dLnmgJ4LAHXEiS3fL5M.webp', 4),
(39, 'Pelota de Yoga con Bomba', 'Wod Pro 75 cm', 188.00, 5, '2026-06-05 05:33:47', '2026-06-05 05:33:47', 'productos/UMb8K39vFUEYAZp6bOKrcmA7AyEac1oisOatNkbC.webp', 4),
(40, 'Juego de Arco y Flecha', 'Con luces de flash LED', 663.00, 2, '2026-06-05 05:35:16', '2026-06-05 05:35:16', 'productos/DvuN2sFVezVMQgvyouCnoPwCgoXCvGFKDKtTiGSP.webp', 4),
(41, 'Calculadora', 'Nextep, Cubierta Metálica Batería Solar', 124.00, 11, '2026-06-05 05:36:28', '2026-06-05 05:36:28', 'productos/KbBlfTHHqHJAY7TdmwIbYNFkKYIGzS0zuQwcsrJA.webp', 1),
(42, 'Báscula', 'Báscula de cocina digitales', 1657.00, 16, '2026-06-05 05:37:45', '2026-06-05 05:37:45', 'productos/5IJ4NTmV8B5l9f4MhZXy6Wwq3pyG6uFCwIGVDzUd.jpg', 1),
(43, 'Telémetro', 'Cinta métrica digital', 654.00, 23, '2026-06-05 05:38:40', '2026-06-05 05:38:40', 'productos/9JmKM7sLTFK9bLS13KQOPHeInc3I0DRhpzuUFsmQ.webp', 1),
(44, 'Cronómetro', 'Digital Y Profesional Para Deporte Fitness', 135.00, 5, '2026-06-05 05:39:48', '2026-06-05 05:39:48', 'productos/MnDXQDXMjPKA8lRjJkVhgTJ5mGeS7hfc8V4Sn1OJ.webp', 4),
(45, 'Guantes de Fútbol', 'Doble Amenaza Deportes De Batalla', 520.00, 13, '2026-06-05 05:40:37', '2026-06-05 05:40:37', 'productos/k3LERDcC42YltLL6HBvf7miG5QcEgdnQZSyzvvpk.webp', 4),
(46, 'Podómetro', 'Greeniant', 499.00, 7, '2026-06-05 05:41:28', '2026-06-05 05:41:28', 'productos/zqyE3oO0IdQbOWnXplqOXZrfvDAR8HXCPoAo4Mml.webp', 4),
(47, 'Mopa', 'Universal para limpieza de suelos en casa', 5099.00, 4, '2026-06-05 05:42:32', '2026-06-05 05:42:32', 'productos/SzwsuNC0BTlDDESykq5QCQWyDbYWKdiUFTN2tVVo.webp', 3),
(48, 'Posavasos', 'Acolchado cuadrado con almohadilla térmica', 60.00, 55, '2026-06-05 05:43:31', '2026-06-05 05:43:31', 'productos/rfPabktpdMI0tWJ1kl9qBHbSWGGZiXJgCqywqtRx.webp', 3),
(49, 'Edredón', 'Matrimonial interior Dalfiori', 1919.00, 22, '2026-06-05 05:45:11', '2026-06-05 05:45:11', 'productos/V7YJWVs2ss1eqIiKogGkk7obx3IbazpnAjU7lyY7.webp', 3),
(50, 'Traje', 'Casual comercial de color liso', 1015.00, 4, '2026-06-05 05:46:12', '2026-06-05 05:46:12', 'productos/JJkxWoFzOv1CuNvhGqtayB15u7GVzGqg1nakxi6S.webp', 2),
(51, 'Conjunto de Ropa', 'De lujo para niños', 640.00, 23, '2026-06-05 05:48:47', '2026-06-05 05:48:47', 'productos/fOHSQOUp3YYJck2YmMib8QOf74osmehQcUUvxTnM.webp', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rol` enum('admin','editor','cliente') NOT NULL DEFAULT 'cliente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `rol`) VALUES
(1, 'Test User', 'test@example.com', '2026-06-04 16:14:56', '$2y$12$bD1FIzc8y6Mo2oh05rIIE.DnYeGi0odm3Mw8JsERXEswoXjVXof02', 'iJIirASS9B', '2026-06-04 16:14:56', '2026-06-04 16:14:56', 'cliente'),
(2, 'Administrador', 'admin@test.com', NULL, '$2y$12$Dy5XWldlR80XJWfrmdyJgerR5nUuPmF49ISR0N/fMamAbIQLKZ9UK', NULL, '2026-06-05 02:22:48', '2026-06-05 08:35:45', 'admin'),
(3, 'Editor', 'editor@test.com', NULL, '$2y$12$7Wv0Yk9DqvA3x0pM4rj3UuYl9jKQeKz8F7j8QeT9xQwzN3r7kW8Tu', NULL, '2026-06-05 02:22:48', '2026-06-05 02:22:48', 'editor'),
(4, 'Cliente', 'cliente@test.com', NULL, '$2y$12$7Wv0Yk9DqvA3x0pM4rj3UuYl9jKQeKz8F7j8QeT9xQwzN3r7kW8Tu', NULL, '2026-06-05 02:22:48', '2026-06-05 02:22:48', 'cliente'),
(6, 'Administrador', 'admin@test1.com', NULL, '$2y$12$wYA8O1HQKHwLStJ4v1CelebCUM4erW5p.G8BKSiNsjry9dLdHdzdW', NULL, '2026-06-05 08:30:42', '2026-06-05 08:30:42', 'admin'),
(7, 'Editor', 'editor@test1.com', NULL, '$2y$12$BlaMR6syrhsmk5LtYgmmZu4Yw0Gi5/ES.jJbhih3Iaw1Sm90e6cfK', NULL, '2026-06-05 08:31:14', '2026-06-05 08:31:14', 'editor'),
(8, 'Cliente', 'cliente@test1.com', NULL, '$2y$12$MNDUsjsa1B2mBSSJFSwLtuYPJKzI3BQKMdWXTJ1CQkPom8N/XKKre', NULL, '2026-06-05 08:31:32', '2026-06-05 08:31:32', 'cliente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categorias_slug_unique` (`slug`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_categoria_id_foreign` (`categoria_id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
