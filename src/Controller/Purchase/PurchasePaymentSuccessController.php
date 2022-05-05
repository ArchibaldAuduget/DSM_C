<?php

namespace App\Controller\Purchase;

use App\Cart\CartService;
use App\Entity\Purchase;
use App\Repository\PurchaseRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class PurchasePaymentSuccessController extends AbstractController
{
    #[Route('/purchase/terminate/{id}', name: 'purchase_payment_success')]
    public function success($id, PurchaseRepository $purchaseRepository, EntityManagerInterface $em, CartService $cartService)
    {
        $user = $this->getUser();
        if(!$user) {
            $this->addFlash('warning', "Vous devez être connecté pour continuer");
            return $this->redirectToRoute('app_login');
        }

        $purchase = $purchaseRepository->find($id);

        if(!$purchase || ($purchase && $purchase->getUser() !== $this->getUser()) || ($purchase && $purchase->getStatus() === Purchase::STATUS_PAID)) {
            $this->addFlash('warning', "La commande n'existe pas");
            return $this->redirectToRoute('cart_show');
        }

        $purchase->setStatus(Purchase::STATUS_PAID);
        $em->flush();

        $cartService->empty();

        $this->addFlash('success', "La commande a été payée et confirmée !");
        return $this->redirectToRoute('home');
    }
}