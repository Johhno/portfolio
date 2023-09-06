<?php

namespace App\Service;

use App\Entity\Product;

class StripeService
{

    private $privateKey;

    public function __construct()
    {
        if ($_ENV['APP_ENV'] === 'dev') {
            $this->privateKey = $_ENV['STRIPE_SECRET_KEY_TEST'];
        } else {
            $this->privateKey = $_ENV['STRIPE_SECRET_KEY_LIVE'];
        }
    }

    public function paymentIntent(Product $product)
    {
        \Stripe\Stripe::setApiKey($this->privateKey);

        return \Stripe\PaymentIntent::create([
            'amount' => $product->getPrice() * 100,
            'currency' => 'eur',
            'payment_method_types' => ['card']
        ]);
    }
}
