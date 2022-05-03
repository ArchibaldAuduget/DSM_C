<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220503201141 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE purchase CHANGE total total DOUBLE PRECISION NOT NULL');
        $this->addSql('ALTER TABLE purchase_item CHANGE product_price product_price DOUBLE PRECISION NOT NULL, CHANGE total total DOUBLE PRECISION NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE purchase CHANGE total total INT NOT NULL');
        $this->addSql('ALTER TABLE purchase_item CHANGE product_price product_price INT NOT NULL, CHANGE total total INT NOT NULL');
    }
}
