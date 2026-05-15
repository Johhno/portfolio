<?php

namespace App\Controller;

use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;

class DonPaymentController extends AbstractController
{

    #[Route('/don', name: 'don')]
    public function pay()
    {
        return $this->render('paiement.html.twig');
    }


/*
    #[Route('/don', name: 'don')]
    public function showCardForm()
    {
        \Stripe\Stripe::setApiKey('sk_test_51KfKXAArrVmPtiM7c2l9METinjYeDSwXBE6qtckuF6z6bq3OEfmePz8aWrJemNSNoUR8CKvyxtQPrxc8qg1oPPZq006I9eqvnH');
        $paymentIntent = \Stripe\PaymentIntent::create([
            'amount' => 50,
            'currency' => 'eur',
        ]);

        //dd($paymentIntent->client_secret);
        return $this->render('dontpn.html.twig', [
            'clientSecret' => $paymentIntent->client_secret
        ]);
    }*/

    #[Route('/charge', name: 'charge')]
    public function paiement()
    {
        $var = $_ENV['STRIPE_SECRET_KEY'];

        \Stripe\Stripe::setApiKey($var);

        $token = $_POST['stripeToken']; // This is a $20.00 charge in US Dollar.

        try {
            $charge = \Stripe\Charge::create(
                array(
                    'amount' => 2000,
                    'currency' => 'usd',
                    'source' => $token
                )
            );
        } catch (\Stripe\Exception\CardException $e) {
            $message_exception = '<br> Status is : ' . $e->getHttpStatus() . '<br>';
            $message_exception .= '<br> Type is : ' . $e->getError()->type . '<br>';
            $message_exception .= '<br> Code is : ' . $e->getError()->code . '<br>';
            $message_exception .= '<br> Param is : ' . $e->getError()->param . '<br>';
            $message_exception .= '<br> Message is : ' . $e->getError()->message . '<br>';
            $code = $e->getError()->decline_code ?? $e->getError()->code;
            return $this->echec_paiement($code);
        } catch (\Stripe\Exception\RateLimitException $e) {
            return $this->echec_paiement('rate_limit');
        } catch (\Stripe\Exception\InvalidRequestException $e) {
            return $this->echec_paiement('invalid_request');
        } catch (\Stripe\Exception\AuthenticationException $e) {
            return $this->echec_paiement('authentication');
        } catch (\Stripe\Exception\ApiConnectionException $e) {
            return $this->echec_paiement('api_connection');
        } catch (\Stripe\Exception\ApiErrorException $e) {
            return $this->echec_paiement('api_error');
        } catch (\Exception $e) {
            return $this->echec_paiement(null);
        }
        return $this->reussi_paiement();
        //return new Response("bro");
    }

    #[Route('/reussi', name: 'reussi')]
    function reussi_paiement()
    {
        return $this->render('paiement_reussi.html.twig', ['msg' => '']);
    }

    #[Route('/echec', name: 'echec')]
    function echec_paiement($data = null)
    {
        return $this->render('paiement_echec.html.twig', ['msg' => $data]);
    }
}
