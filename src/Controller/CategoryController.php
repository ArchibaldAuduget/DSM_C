<?php

namespace App\Controller;

use App\Repository\CategoryRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CategoryController extends AbstractController
{
    #[Route('/category', name: 'category_list')]
    public function categoryIndex(CategoryRepository $categoryRepository): Response
    {
        $categories = $categoryRepository->findAll();

        return $this->render('category/index.html.twig', [
            'categories' => $categories
        ]);
    }

    #[Route('/{slug}', name: 'category_show', priority: -2)]
    public function categoryShow($slug, CategoryRepository $categoryRepository)
    {
        $category = $categoryRepository->findOneBy([
            'slug' => $slug
        ]);

        if (!$category) {
            $this->addFlash("danger", "La catégorie n'a pas été trouvé");
            return $this->redirectToRoute('category_list');
        }


        $products = $category->getProducts();

        return $this->render('category/show.html.twig', [
            'slug' => $slug,
            'category' => $category,
            'products' => $products,
        ]);
    }
}
