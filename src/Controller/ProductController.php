<?php

namespace App\Controller;

use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    #[Route('/{catslug}/{slug}', name: 'product', priority: -2)]
    public function show($slug, ProductRepository $productRepository): Response
    {

        $product = $productRepository->findOneBy([
            'slug' => $slug
        ]);

        if (!$product) {
            $this->addFlash("danger", "Le produit n'a pas été trouvé");
            return $this->redirectToRoute('category_list');
        }

        return $this->render('product/show.html.twig', [
            'product' => $product,
        ]);
    }
}
