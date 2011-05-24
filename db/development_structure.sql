CREATE TABLE `control_bar_patches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_bar_id` int(11) DEFAULT NULL,
  `patch` varchar(255) DEFAULT NULL,
  `row_num` varchar(255) DEFAULT NULL,
  `column_num` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;

CREATE TABLE `control_bars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `preview` blob,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `customers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB';

CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `kind` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=latin1;

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `standard_id` int(11) DEFAULT NULL,
  `control_bar_id` int(11) DEFAULT NULL,
  `tolerance_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `number` varchar(255) NOT NULL DEFAULT '',
  `customer` varchar(255) NOT NULL DEFAULT '',
  `event` varchar(255) NOT NULL DEFAULT '',
  `printing_process` varchar(255) DEFAULT NULL,
  `printing_type` varchar(255) DEFAULT NULL,
  `substrate` varchar(255) DEFAULT NULL,
  `ink_manufacturer` varchar(255) DEFAULT NULL,
  `inkset` varchar(255) DEFAULT NULL,
  `plate` varchar(255) DEFAULT NULL,
  `plate_curveC` varchar(255) DEFAULT NULL,
  `plate_curveM` varchar(255) DEFAULT NULL,
  `plate_curveY` varchar(255) DEFAULT NULL,
  `plate_curveK` varchar(255) DEFAULT NULL,
  `proof_match` smallint(5) unsigned DEFAULT NULL,
  `active` smallint(5) unsigned DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numberx` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; InnoDB free: 11264 kB; InnoDB free: 1';

CREATE TABLE `member_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `pref` varchar(255) DEFAULT NULL,
  `value` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `patch_standards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standard_id` int(11) DEFAULT NULL,
  `patch` varchar(255) DEFAULT NULL,
  `spectral_1` float DEFAULT NULL,
  `spectral_2` float DEFAULT NULL,
  `spectral_3` float DEFAULT NULL,
  `spectral_4` float DEFAULT NULL,
  `spectral_5` float DEFAULT NULL,
  `spectral_6` float DEFAULT NULL,
  `spectral_7` float DEFAULT NULL,
  `spectral_8` float DEFAULT NULL,
  `spectral_9` float DEFAULT NULL,
  `spectral_10` float DEFAULT NULL,
  `spectral_11` float DEFAULT NULL,
  `spectral_12` float DEFAULT NULL,
  `spectral_13` float DEFAULT NULL,
  `spectral_14` float DEFAULT NULL,
  `spectral_15` float DEFAULT NULL,
  `spectral_16` float DEFAULT NULL,
  `spectral_17` float DEFAULT NULL,
  `spectral_18` float DEFAULT NULL,
  `spectral_19` float DEFAULT NULL,
  `spectral_20` float DEFAULT NULL,
  `spectral_21` float DEFAULT NULL,
  `spectral_22` float DEFAULT NULL,
  `spectral_23` float DEFAULT NULL,
  `spectral_24` float DEFAULT NULL,
  `spectral_25` float DEFAULT NULL,
  `spectral_26` float DEFAULT NULL,
  `spectral_27` float DEFAULT NULL,
  `spectral_28` float DEFAULT NULL,
  `spectral_29` float DEFAULT NULL,
  `spectral_30` float DEFAULT NULL,
  `spectral_31` float DEFAULT NULL,
  `spectral_32` float DEFAULT NULL,
  `spectral_33` float DEFAULT NULL,
  `spectral_34` float DEFAULT NULL,
  `spectral_35` float DEFAULT NULL,
  `spectral_36` float DEFAULT NULL,
  `density` float DEFAULT NULL,
  `dot_gain` float DEFAULT NULL,
  `print_contrast` float DEFAULT NULL,
  `l` float DEFAULT NULL,
  `a` float DEFAULT NULL,
  `b` float DEFAULT NULL,
  `c` float DEFAULT NULL,
  `h` float DEFAULT NULL,
  `rgb_r` float DEFAULT NULL,
  `rgb_g` float DEFAULT NULL,
  `rgb_b` float DEFAULT NULL,
  `g7` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=558 DEFAULT CHARSET=latin1;

CREATE TABLE `patch_tolerances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tolerance_id` int(11) DEFAULT NULL,
  `patch` varchar(255) DEFAULT NULL,
  `de` float DEFAULT NULL,
  `spectral_1` float DEFAULT NULL,
  `spectral_2` float DEFAULT NULL,
  `spectral_3` float DEFAULT NULL,
  `spectral_4` float DEFAULT NULL,
  `spectral_5` float DEFAULT NULL,
  `spectral_6` float DEFAULT NULL,
  `spectral_7` float DEFAULT NULL,
  `spectral_8` float DEFAULT NULL,
  `spectral_9` float DEFAULT NULL,
  `spectral_10` float DEFAULT NULL,
  `spectral_11` float DEFAULT NULL,
  `spectral_12` float DEFAULT NULL,
  `spectral_13` float DEFAULT NULL,
  `spectral_14` float DEFAULT NULL,
  `spectral_15` float DEFAULT NULL,
  `spectral_16` float DEFAULT NULL,
  `spectral_17` float DEFAULT NULL,
  `spectral_18` float DEFAULT NULL,
  `spectral_19` float DEFAULT NULL,
  `spectral_20` float DEFAULT NULL,
  `spectral_21` float DEFAULT NULL,
  `spectral_22` float DEFAULT NULL,
  `spectral_23` float DEFAULT NULL,
  `spectral_24` float DEFAULT NULL,
  `spectral_25` float DEFAULT NULL,
  `spectral_26` float DEFAULT NULL,
  `spectral_27` float DEFAULT NULL,
  `spectral_28` float DEFAULT NULL,
  `spectral_29` float DEFAULT NULL,
  `spectral_30` float DEFAULT NULL,
  `spectral_31` float DEFAULT NULL,
  `spectral_32` float DEFAULT NULL,
  `spectral_33` float DEFAULT NULL,
  `spectral_34` float DEFAULT NULL,
  `spectral_35` float DEFAULT NULL,
  `spectral_36` float DEFAULT NULL,
  `density` float DEFAULT NULL,
  `dot_gain` float DEFAULT NULL,
  `print_contrast` float DEFAULT NULL,
  `l` float DEFAULT NULL,
  `a` float DEFAULT NULL,
  `b` float DEFAULT NULL,
  `c` float DEFAULT NULL,
  `h` float DEFAULT NULL,
  `rgb_r` float DEFAULT NULL,
  `rgb_g` float DEFAULT NULL,
  `rgb_b` float DEFAULT NULL,
  `g7` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

CREATE TABLE `readings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sheet_id` int(11) DEFAULT NULL,
  `patch` varchar(255) DEFAULT NULL,
  `row_num` varchar(255) DEFAULT NULL,
  `column_num` varchar(255) DEFAULT NULL,
  `de` float DEFAULT NULL,
  `spectral_1` float DEFAULT NULL,
  `spectral_2` float DEFAULT NULL,
  `spectral_3` float DEFAULT NULL,
  `spectral_4` float DEFAULT NULL,
  `spectral_5` float DEFAULT NULL,
  `spectral_6` float DEFAULT NULL,
  `spectral_7` float DEFAULT NULL,
  `spectral_8` float DEFAULT NULL,
  `spectral_9` float DEFAULT NULL,
  `spectral_10` float DEFAULT NULL,
  `spectral_11` float DEFAULT NULL,
  `spectral_12` float DEFAULT NULL,
  `spectral_13` float DEFAULT NULL,
  `spectral_14` float DEFAULT NULL,
  `spectral_15` float DEFAULT NULL,
  `spectral_16` float DEFAULT NULL,
  `spectral_17` float DEFAULT NULL,
  `spectral_18` float DEFAULT NULL,
  `spectral_19` float DEFAULT NULL,
  `spectral_20` float DEFAULT NULL,
  `spectral_21` float DEFAULT NULL,
  `spectral_22` float DEFAULT NULL,
  `spectral_23` float DEFAULT NULL,
  `spectral_24` float DEFAULT NULL,
  `spectral_25` float DEFAULT NULL,
  `spectral_26` float DEFAULT NULL,
  `spectral_27` float DEFAULT NULL,
  `spectral_28` float DEFAULT NULL,
  `spectral_29` float DEFAULT NULL,
  `spectral_30` float DEFAULT NULL,
  `spectral_31` float DEFAULT NULL,
  `spectral_32` float DEFAULT NULL,
  `spectral_33` float DEFAULT NULL,
  `spectral_34` float DEFAULT NULL,
  `spectral_35` float DEFAULT NULL,
  `spectral_36` float DEFAULT NULL,
  `density` float DEFAULT NULL,
  `dot_gain` float DEFAULT NULL,
  `print_contrast` float DEFAULT NULL,
  `l` float DEFAULT NULL,
  `a` float DEFAULT NULL,
  `b` float DEFAULT NULL,
  `c` float DEFAULT NULL,
  `h` float DEFAULT NULL,
  `rgb_r` float DEFAULT NULL,
  `rgb_g` float DEFAULT NULL,
  `rgb_b` float DEFAULT NULL,
  `g7` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3584 DEFAULT CHARSET=latin1;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

CREATE TABLE `sheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `version` varchar(255) DEFAULT '',
  `press_speed` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `shift` varchar(255) DEFAULT NULL,
  `sheet_number` varchar(255) DEFAULT NULL,
  `sheet_side` varchar(255) DEFAULT NULL,
  `make_ready` int(11) DEFAULT NULL,
  `spectro_device` varchar(255) DEFAULT NULL,
  `spectro_serialnum` varchar(255) DEFAULT NULL,
  `control_bar_zone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sheet_numberx` (`sheet_number`,`job_id`,`device_id`,`sheet_side`,`control_bar_zone`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=latin1;

CREATE TABLE `standards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `icc` blob,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

CREATE TABLE `tolerances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `pref` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `hashed_password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `versions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB';

INSERT INTO schema_migrations (version) VALUES ('20090721203701');

INSERT INTO schema_migrations (version) VALUES ('20090721203710');

INSERT INTO schema_migrations (version) VALUES ('20090721203730');

INSERT INTO schema_migrations (version) VALUES ('20090721203740');

INSERT INTO schema_migrations (version) VALUES ('20090721203750');

INSERT INTO schema_migrations (version) VALUES ('20090721203760');

INSERT INTO schema_migrations (version) VALUES ('20090721203770');

INSERT INTO schema_migrations (version) VALUES ('20090721203780');

INSERT INTO schema_migrations (version) VALUES ('20090721203800');

INSERT INTO schema_migrations (version) VALUES ('20090721203810');

INSERT INTO schema_migrations (version) VALUES ('20090721203820');

INSERT INTO schema_migrations (version) VALUES ('20090721203830');

INSERT INTO schema_migrations (version) VALUES ('20090721203840');

INSERT INTO schema_migrations (version) VALUES ('20090721203850');