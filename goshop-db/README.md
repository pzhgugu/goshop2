# goshop-db

This directory contains MySQL dump files used by the service modules.

## Business Databases

| Database | Script | Service Module |
| --- | --- | --- |
| `goshop_user` | `goshop_user.sql` | `goshop-service-users` |
| `goshop_cms` | `goshop_cms.sql` | `goshop-service-cms` |
| `goshop_goods` | `goshop_goods.sql` | `goshop-service-goods` |
| `goshop_store` | `goshop_store.sql` | `goshop-service-store` |

Create the databases before importing the scripts. The SQL files contain table
definitions and seed data, but they do not create the databases themselves.

## Test Data

- `goshop_user_test.sql`
- `goshop_user_test_read.sql`

These two files are intended for user-service read/write separation tests.
