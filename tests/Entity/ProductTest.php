<?php

namespace App\Tests\Entity;

use App\Entity\Product;
use PHPUnit\Framework\TestCase;

class ProductTest extends TestCase
{
    public function testSetAndGetName(): void
    {
        $product = new Product();
        $product->setName('T-shirt blanc');

        $this->assertSame('T-shirt blanc', $product->getName());
    }

    public function testSetAndGetPrice(): void
    {
        $product = new Product();
        $product->setPrice(1999);

        $this->assertSame(1999, $product->getPrice());
    }

    public function testSetAndGetSlug(): void
    {
        $product = new Product();
        $product->setSlug('t-shirt-blanc');

        $this->assertSame('t-shirt-blanc', $product->getSlug());
    }

    public function testPrixNegatifLanceException(): void
    {
        $this->expectException(\InvalidArgumentException::class);
        
        $product = new Product();
        $product->setPrice(-1);
    }
}