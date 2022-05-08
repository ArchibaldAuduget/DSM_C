<?php

namespace App\Cart;

use App\Cart\CartItem;
use App\Repository\ProductRepository;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class CartService
{

    protected $session;
    protected $productRepository;

    public function __construct(SessionInterface $session, ProductRepository $productRepository)
    {
        $this->session = $session;
        $this->productRepository = $productRepository;
    }

    // fonction récupération ou init du panier
    protected function getCart(): array
    {
        return $this->session->get('cart', []);
    }

    // fonction sauvegarde du panier
    protected function saveCart(array $cart)
    {
        return $this->session->set('cart', $cart);
    }

    public function add($id) 
    {
        // session init
        $cart = $this->getCart();
        
        // ajout produit dans la session
        if(array_key_exists($id, $cart)) {
            $cart[$id]++;
        } else {
            $cart[$id] = 1;
        }

        $this->saveCart($cart);
    }

    public function remove(int $id)
    {
        $cart = $this->getCart();

        unset($cart[$id]);

        $this->saveCart($cart);
    }

    public function decrement(int $id)
    {
        $cart = $this->getCart();

        if(!array_key_exists($id, $cart)) {
            return;
        }

        if($cart[$id] == 1) {
            $this->remove($id);
            return;
        }

        $cart[$id]--;

        $this->saveCart($cart);
    }

    public function getTotal(): int
    {
        $total = 0;

        foreach($this->getCart() as $id => $qty) {
            $product = $this->productRepository->find($id);

            if(!$product) {
                continue;
            }

            $total += $product->getPrice() * $qty;
        }

        return $total;
    }

    public function getqtyItems(): int
    {
        $qtyItems = 0;

        foreach($this->getCart() as $id => $qty) {
            $qtyItems += $qty;
        }

        return $qtyItems;
    }

    /**
     * Undocumented function
     *
     * @return CartItem[]
     */
    public function getDetailedCardItems(): array
    {
        $detailedCart = [];

        foreach($this->getCart() as $id => $qty) {
            $product = $this->productRepository->find($id);

            if(!$product) {
                continue;
            }

            $detailedCart[] = new CartItem($product, $qty);
        }

        return $detailedCart;
    }

    public function empty()
    {
        $this->saveCart([]);
    }
}