<?php

namespace App\Controller\Purchase;

use App\Cart\CartService;
use App\Entity\PurchaseItem;
use App\Form\PurchaseType;
use DateTimeImmutable;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;

class PurchaseConfirmationController extends AbstractController
{
    protected $cartService;
    protected $em;

    public function __construct(CartService $cartService, EntityManagerInterface $em)
    {
        $this->cartService = $cartService;
        $this->em = $em;
    }

    #[Route('/purchase/confirm', name: 'purchase_confirm')]
    public function confirm(Request $request)
    {
        $form = $this->createForm(PurchaseType::class);

        $form->handleRequest($request);

        if(!$form->isSubmitted()) {
            $this->addFlash('warning', 'Vous devez remplir le formulaire de confirmation');
            return $this->redirectToRoute('cart_show');
        }

        $user = $this->getUser();

        if(!$user) {
            throw new AccessDeniedException("Vous devez être connecté pour confirmer une commande");
        }

        $cartItems = $this->cartService->getDetailedCardItems();

        if(count($cartItems) === 0) {
            $this->addFlash('warning', 'Vous ne pouvez pas confirmer une commande avec un panier vide');
            return $this->redirectToRoute('cart_show');
        }

        $purchase = $form->getData();
        $purchase->setUser($user)
            ->setTotal($this->cartService->getTotal())
            ->setPurchasedAt(new DateTimeImmutable());

        $this->em->persist($purchase);

        // liaison avec les produits dans le panier
        // creation des lignes de commande (purchaseItem)
        foreach($this->cartService->getDetailedCardItems() as $cartItem) {
            $purchaseItem = new PurchaseItem;
            $purchaseItem->setPurchase($purchase)
                ->setProduct($cartItem->product)
                ->setProductName($cartItem->product->getName())
                ->setQuantity($cartItem->qty)
                ->setTotal($cartItem->getTotal())
                ->setProductPrice($cartItem->product->getPrice());
            
            
            $this->em->persist($purchaseItem);

        }

        $this->em->flush();

        return $this->redirectToRoute('purchase_payment_form', [
            'id' => $purchase->getId()
        ]);
    }
}