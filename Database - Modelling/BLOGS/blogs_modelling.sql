




-- creates a new USER 
CREATE TABLE `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(30) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `gender` VARCHAR(10) NOT NULL,
  `password_hash` VARCHAR(50) NOT NULL,
  `refresh_token` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`)
);




-- created a new BLOG
CREATE TABLE `blogs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  `title` VARCHAR(30) NOT NULL,
  `category` VARCHAR(30) NOT NULL,
  `view_count` INT NOT NULL,
  `image` VARCHAR(10) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `thumb_nail` BLOB,  
  `share_link` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE CASCADE
);



-- creates a new REACTION (like,dislike, smile etc..)
CREATE TABLE `reaction` (
  `id` INT NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `description` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`)
);




-- creates a new TAG ( #education #engineers)
CREATE TABLE `tags` (
  `tags_id` VARCHAR(30) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`tags_id`)
);




-- creates a new CATEGORY (technology, science..etc)
CREATE TABLE `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `description` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
);




--  creates a new COMMENT for a post
CREATE TABLE `comments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `blog_id` INT NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`blog_id`) REFERENCES `blogs`(`id`) ON DELETE CASCADE
);




-- creates a reply for a comment
CREATE TABLE `reply` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment_id` INT NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`comment_id`) REFERENCES `comments`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`id`) REFERENCES `reply_reactions`(`reply_reaction_id`) ON DELETE CASCADE
);





-- a new ROW creates by a trigger
CREATE TABLE `reply_reactions` (
  `reply_reaction_id` INT NOT NULL AUTO_INCREMENT,
  `reply_id` INT NOT NULL,
  `reaction_id` INT NOT NULL,
  PRIMARY KEY (`reply_reaction_id`),
  CONSTRAINT `fk_reply_reactions_reply` FOREIGN KEY (`reply_id`) REFERENCES `replies`(`reply_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_reply_reactions_reaction` FOREIGN KEY (`reaction_id`) REFERENCES `reactions`(`reaction_id`) ON DELETE CASCADE
);





--  a new ROW created for an each tag in a BLOG
CREATE TABLE `blog_tags` (
  `blog_tag_id` VARCHAR(50) NOT NULL,
  `blog_id` VARCHAR(50) NOT NULL,
  `comment_id` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`blog_tag_id`),
  FOREIGN KEY (`blog_id`) REFERENCES `blogs`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`comment_id`) REFERENCES `comments`(`id`) ON DELETE CASCADE
);




-- a row created for each REACTION on a comment
CREATE TABLE `comment_reactions` (
  `comment_reaction_id` INT NOT NULL,
  `comment_id` INT NOT NULL,
  `reaction_id` INT NOT NULL,
  PRIMARY KEY (`comment_reaction_id`),
  FOREIGN KEY (`comment_id`) REFERENCES `comments`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`reaction_id`) REFERENCES `reactions`(`id`) ON DELETE CASCADE
);





-- a new ROW created for each reaction on a BLOG by a USER
CREATE TABLE `user_blog_reaction` (
  `user_blog_reaction_id` VARCHAR(50) NOT NULL,
  `user_id` VARCHAR(50) NOT NULL,
  `blog_id` VARCHAR(50) NOT NULL,
  `reaction_id` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`user_blog_reaction_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`blog_id`) REFERENCES `blogs`(`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`reaction_id`) REFERENCES `reactions`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);






-- a new ROW created by the a new saved BLOG
CREATE TABLE `saved_blogs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `blog_id` INT NOT NULL,
  `saved_at` DATETIME NOT NULL,
  `starred` BOOLEAN NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`),
  FOREIGN KEY (`blog_id`) REFERENCES `blogs`(`id`)
);