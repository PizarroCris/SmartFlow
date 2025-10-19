---
title:
date: 2025-10-19
tags:
---
# Initial Planning and Data Model

## First User Story

- As a user, I want to be able to activate my focus timer to work/study in a focused manner.
	- As a user, I want to be able to define the duration of my focus blocks on the Timer, or use the suggested ones.

## User and FocusSession Tables

### Model: `User`

| Column Name | Data Type | Constraints & Validations |
| :--- | :--- | :--- |
| `id` | `integer` | `Primary Key` |
| `name` | `string` | `NOT NULL`, `presence: true` |
| `email` | `string` | `NOT NULL`, `unique index`, `uniqueness: { case_sensitive: false }` |
| `encrypted_password` | `string` | `NOT NULL` |
| `created_at` | `datetime` | |
| `updated_at` | `datetime` | |

**Note:** We use `encrypted_password` because it is the correct way with the `Devise` gem in Rails to maintain a secure password. If we were not using the gem, we would switch to `password_digest`, where Rails would use `has_secure_password`. A password is never passed as a simple string.

### Model: `FocusSession`

| Column Name        | Data Type    | Constraints & Validations                     |
| :----------------- | :----------- | :-------------------------------------------- |
| `id`               | `integer`    | `Primary Key`                                 |
| `title`            | `string`     | `NOT NULL`, `presence: true`                  |
| `duration_minutes` | `integer`    | `NOT NULL`                                    |
| `status`           | `string`     | enum status: { completed: 0, interrupted: 1 } |
| `start_time`       | `datetime`   |                                               |
| `end_time`         | `datetime`   |                                               |
| `user_id`          | `references` | `NOT NULL`, `Foreign Key`                     |
| `created_at`       | `datetime`   |                                               |
| `updated_at`       | `datetime`   |                                               |