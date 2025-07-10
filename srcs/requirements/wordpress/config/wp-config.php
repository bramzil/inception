<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp_db' );

/** Database username */
define( 'DB_USER', 'wp_user' );

/** Database password */
define( 'DB_PASSWORD', 'Lizma@154991' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'J ma8--F=Yu;*4Q)+*.v@XeoQ63KNRLhoqGV|a96oz>0~P}i(( ]uG/e_$vTT[vX' );
define( 'SECURE_AUTH_KEY',   '^gob`Fz9IH;)IMADh@P?Q0=6?hM;@])EcNIC8SkxdJD{wE_}z_MG3xnf%4=29c`:' );
define( 'LOGGED_IN_KEY',     'npI5UF69SBe[K6mNhk$h^~Fmc):2y9xc$$8[O^5iHWs.2ous{{>4a3<bdSd(y/t8' );
define( 'NONCE_KEY',         '-d3H6Rj?!ltK$=(7LfGbLt>t5oth4@5@>/7vs7K)_#yW=*jcpX&hazyri?^^wS{!' );
define( 'AUTH_SALT',         '!6Px`i~|5[4j4*Z+gRjlABv$k|:$$&Gb>q(>l?-ft-H5F3PsRDEtXO!qi#Vno9FH' );
define( 'SECURE_AUTH_SALT',  'D0%w6A/sR>`TS.=;*0B#&|b|!`FSx&si5N;ColC`/HFc2i1&@$f:vn}{cagI#2QB' );
define( 'LOGGED_IN_SALT',    'JMKSlSIX/v/qX$$KOIl:t}H}y@ENZ(*y^E&69iG.hJFrAg(.]CfAh?9&=DMj07&A' );
define( 'NONCE_SALT',        '&:l/Qb5xO&9~ApU&xif#NUQpXcPMvzRk*}`It5Ac_S/Ew[7~:J@_$i<_XF:3WwJF' );
define( 'WP_CACHE_KEY_SALT', 'Dmzy(*F-PT uwn:e9+oHu42tzB2rh`]fVD.3Deg^JUjO)sl+A-7++%fHiJ5RB)x%' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', 6379);
define('WP_REDIS_TIMEOUT', 1);
define('WP_REDIS_DATABASE', 0);

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
