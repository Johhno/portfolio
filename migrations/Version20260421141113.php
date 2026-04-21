<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20260421141113 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Add discord_id and discord_username columns to user table';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('ALTER TABLE user ADD discord_id VARCHAR(255) DEFAULT NULL, ADD discord_username VARCHAR(255) DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE user DROP discord_id, DROP discord_username');
    }
}
