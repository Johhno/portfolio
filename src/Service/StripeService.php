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
    /**
     * @param Product $product
     * @return \Stripe\PaymentIntent
     * @throws \Stripe\Exception\ApiErrorException
     */
    public function paymentIntent(Product $product)
    {
        \Stripe\Stripe::setApiKey($this->privateKey);

        return \Stripe\PaymentIntent::create([
            'amount' => $product->getPrice() * 100,
            'currency' => 'eur',
            'payment_method_types' => ['card']
        ]);
    }

    public function paiement(
        $amount,
        $currency,
        $description,
        array $stripeParameter
    ) {
        \Stripe\Stripe::setApiKey($this->privateKey);
        $payment_intent = null;

        if (isset($stripeParameter['stripeIntentId'])) {
            $payment_intent = \Stripe\PaymentIntent::retrieve($stripeParameter['stripeIntentId']);
        }

        if ($stripeParameter['stripeIntentId'] === 'succeeded') {
            //TODO
        } else {
            $payment_intent->cancel();
        }

        return $payment_intent;
    }

    public function paiementv2(
        array $stripeParameter
    ) {
        \Stripe\Stripe::setApiKey($this->privateKey);
        $payment_intent = null;

        if (isset($stripeParameter['stripeIntentId'])) {
            $payment_intent = \Stripe\PaymentIntent::retrieve($stripeParameter['stripeIntentId']);
        }

        if ($stripeParameter['stripeIntentId'] === 'succeeded') {
            //TODO
        } else {
            $payment_intent->cancel();
        }

        return $payment_intent;
    }
    /**
     * @param array $stripeParameter
     * @param Product $product
     * @return \Stripe\PaymentIntent\null
     */
    public function stripe(array $stripeParameter, Product $product)
    {
        /*return $this->paiement(
            amount: $product->getPrice() * 100,
            currency: 'eur',
            $product->getName(),
            $stripeParameter
        );*/

        return $this->paiementv2($stripeParameter);
    }
}
