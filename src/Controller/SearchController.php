<?php

namespace App\Controller;

use App\Entity\Product;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class SearchController extends AbstractController
{
    #[Route('/search', name: 'search')]
    public function search(Request $request, EntityManagerInterface $em): Response
    {

        if (!$request->getQueryString()) {
            $this->addFlash("danger", "Une erreur s'est produite");
            return $this->redirectToRoute('home');
        }

        // transforme les caractères de la recherche pour se rapprocher du slug
        $searchString = (explode('=', $request->getQueryString()))[1];
        $searchString = str_replace('%20', '-', $searchString);
        $searchString = strtolower($searchString);

        $searchSplit = str_split($searchString);

        // va permettre via incrémentation de prendre la valeur de la clef pour avoid ré ecriture
        $count = 0;
        // va permettre de stocker les résultats de chaque boucle
        $newsearch = [];

        // boucle qui permet de remplacer chaque lettre tour à tour par '_'
        foreach($searchSplit as $key => $value) {
            $change = '_';
            $searchSplit[$key] = $change;

            // on sauvegarde la modification
            $firstModifiedResearch = $searchSplit;

            // boucle du second '_'
            foreach($searchSplit as $key2 => $value2) {
                $searchSplit[$key2] = $change;
                $secondModifiedResearch = implode('', $searchSplit);

                $searchSplit = $firstModifiedResearch;
                
                $newsearch += [$count => $secondModifiedResearch];
                $count++;
            }

            // Permet de reset la string à chaque tour
            $searchSplit = str_split($searchString);
        }

        $products = [];

        // boucle qui permet de rechercher chaque résultats de la boucle remplacant d'un caractère
        foreach($newsearch as $key => $value) {
            $sqlQuery = $em->getRepository(Product::class)->createQueryBuilder('p')
            ->where("p.slug LIKE '%" . $value . "%'")
            ->getQuery()
            ->getResult();

            $products += $sqlQuery;
        }

        $searchNameShow = str_replace('-', ' ', $searchString);

        return $this->render('search/index.html.twig', [
            'products' => $products,
            'searchName' => $searchNameShow
        ]);
        
    }
}
