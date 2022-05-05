<?php

namespace App\Controller\Purchase;

use Stripe\Stripe;
use App\Entity\Purchase;
use Stripe\PaymentIntent;
use App\Repository\PurchaseRepository;
use App\Stripe\StripeService;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PurchasePaymentController extends AbstractController
{
    #[Route('/purchase/pay/{id}', name: 'purchase_payment_form')]
    public function showCardForm($id, PurchaseRepository $purchaseRepository, StripeService $stripeService)
    {
        $user = $this->getUser();
        if(!$user) {
            $this->addFlash('warning', "Vous devez être connecté pour continuer");
            return $this->redirectToRoute('app_login');
        }

        $purchase = $purchaseRepository->find($id);

        if(!$purchase || ($purchase && $purchase->getUser() !== $this->getUser()) || ($purchase && $purchase->getStatus() === Purchase::STATUS_PAID)) {
            return $this->redirectToRoute('cart_show');
        }

        $intent = $stripeService->getPaymentIntent($purchase);
        
        return $this->render('purchase/payment.html.twig', [
            'clientSecret' => $intent->client_secret,
            'purchase' => $purchase,
            'stripePublicKey' => $stripeService->getPublicKey()
        ]);
    }
}