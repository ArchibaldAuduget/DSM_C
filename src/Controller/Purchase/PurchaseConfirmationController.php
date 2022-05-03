<?php

namespace App\Controller\Purchase;

use App\Cart\CartService;
use App\Entity\Purchase;
use App\Entity\PurchaseItem;
use App\Form\PurchaseType;
use DateTime;
use DateTimeImmutable;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Routing\RouterInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Form\FormFactoryInterface;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Session\Flash\FlashBagInterface;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;

class PurchaseConfirmationController extends AbstractController
{
    protected $formFactory;
    protected $router;
    protected $security;
    protected $cartService;
    protected $em;

    public function __construct(FormFactoryInterface $formFactory, RouterInterface $router, Security $security, CartService $cartService, EntityManagerInterface $em)
    {
        $this->formFactory = $formFactory;
        $this->router = $router;
        $this->security = $security;
        $this->cartService = $cartService;
        $this->em = $em;
    }

    #[Route('/purchase/confirm', name: 'purchase_confirm')]
    public function confirm(Request $request, FlashBagInterface $flashBag)
    {
        $form = $this->formFactory->create(PurchaseType::class);

        $form->handleRequest($request);

        if(!$form->isSubmitted()) {
            $flashBag->add('warning', 'Vous devez remplir le formulaire de confirmation');
            return new RedirectResponse($this->router->generate('cart_show'));
        }

        $user = $this->security->getUser();

        if(!$user) {
            throw new AccessDeniedException("Vous devez être connecté pour confirmer une commande");
        }

        $cartItems = $this->cartService->getDetailedCardItems();

        if(count($cartItems) === 0) {
            $flashBag->add('warning', 'Vous ne pouvez pas confirmer une commande avec un panier vide');
            return new RedirectResponse($this->router->generate('cart_show'));
        }

        $purchase = $form->getData();
        $purchase->setUser($user)
            ->setPurchasedAt(new DateTimeImmutable());

        $this->em->persist($purchase);

        $total = 0;

        // liaison avec les produits dans le panier
        // creation des lignes de commande (purchaseItem)
        foreach($this->cartService->getDetailedCardItems() as $cartItem) {
            $purchaseItem = new PurchaseItem;
            $purchaseItem->setPurchase($purchase)
                ->setProduct($cartItem->product)
                ->setProductName($cartItem->product->getPrice())
                ->setQuantity($cartItem->qty)
                ->setTotal($cartItem->getTotal())
                ->setProductPrice($cartItem->product->getPrice());
            
            $total += $cartItem->getTotal();
            
            $this->em->persist($purchaseItem);

        }

        $purchase->setTotal($total);

        $this->em->flush();

        $flashBag->add('success', 'La commande a bien été enregistrée');
        return new RedirectResponse($this->router->generate('cart_show'));
    }
}