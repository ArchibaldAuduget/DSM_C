<?php

namespace App\Controller;

use App\Cart\CartService;
use App\Form\PurchaseType;
use App\Repository\ProductRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CartController extends AbstractController
{
    protected $productRepository;
    protected $cartService;

    public function __construct(ProductRepository $productRepository, CartService $cartService)
    {
        $this->productRepository = $productRepository;
        $this->cartService = $cartService;
    }

    #[Route('/cart/add/{id}', name: 'cart_add', requirements: ['id' => '\d+'])]
    public function add($id, Request $request)
    {
        $product = $this->productRepository->find($id);
        if (!$product) {
            $this->addFlash("danger", "Le produit n'a pas été trouvé");
            return $this->redirectToRoute('home');
        }

        $this->cartService->add($id);
        
        $this->addFlash("success", "Le produit a bien été ajouté au panier");

        if($request->query->get('returnToCart')) {
            return $this->redirectToRoute('cart_show');
        }

        return $this->redirectToRoute('product', [
            'slug' => $product->getSlug(),
            'catslug' => 'addcart'
        ]);
    }

    #[Route('/cart', name: 'cart_show')]
    public function show()
    {
        $form = $this->createForm(PurchaseType::class);

        $detailedCart = $this->cartService->getDetailedCardItems();
        $total = $this->cartService->getTotal();

        return $this->render('cart/index.html.twig', [
            'items' => $detailedCart,
            'total' => $total,
            'formview' => $form->createView()
        ]);
    }

    #[Route('/cart/delete/{id}', name: 'cart_delete', requirements: ['id' => '\d+'])]
    public function delete($id)
    {
        $product = $this->productRepository->find($id);

        if (!$product) {
            $this->addFlash("danger", "Le produit n'a pas été trouvé");
            return $this->redirectToRoute('cart_show');
        }

        $this->cartService->remove($id);

        $this->addFlash("success", "Le produit a bien été supprimé du panier");
        return $this->redirectToRoute('cart_show');
    }

    #[Route('/cart/decrement/{id}', name: 'cart_decrement', requirements: ['id' => '\d+'])]
    public function decrement($id)
    {
        $product = $this->productRepository->find($id);

        if (!$product) {
            $this->addFlash("danger", "Le produit n'a pas été trouvé");
            return $this->redirectToRoute('cart_show');
        }

        $this->cartService->decrement($id);

        $this->addFlash("success", "Un exemplaire du produit a bien été retiré");
        return $this->redirectToRoute('cart_show');
    }
}
