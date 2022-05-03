<?php

namespace App\Controller;

use App\Cart\CartService;
use App\Form\PurchaseType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class PurchaseController extends AbstractController
{
    // #[Route('/purchase', name: 'app_purchase')]
    // public function index(Request $request, EntityManagerInterface $em, CartService $cartService): Response
    // {
    //     $user = $this->getUser();
    //     $total = $cartService->getTotal();

    //     $form = $this->createForm(PurchaseType::class);
    //     $form->handleRequest($request);

    //     if ($form->isSubmitted() && $form->isValid()) {
    //         $purchase = $form->getData();
    //         $purchase->setUser($user);
    //         $purchase->setTotal($total);
    //         $purchase->setProducts()

    //         $em->persist($category);
    //         $em->flush();

    //         return $this->redirectToRoute('homepage');

    //     }
    //     $formview = $form->createView();

    //     return $this->render('category/create.html.twig', [
    //         'formview' => $formview
    //     ]);
    // }
}
