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

        // transforme les caractères de la recherche pour se rapprocher du slug
        $searchString = (explode('=', $request->getQueryString()))[1];
        $searchString = str_replace('%20', '-', $searchString);
        $searchString = strtolower($searchString);
        $searchSplit = str_split($searchString);

        // premiere recherche de la chaine de caractère
        $search = $em->getRepository(Product::class)->createQueryBuilder('p')
        ->where("p.slug LIKE '%" . $searchString . "%'")
        ->getQuery()
        ->getResult();


        $newsearch = [];

        // boucle qui permet de remplacer chaque lettre tour à tour par '_'
        foreach($searchSplit as $key => $uniqueSearch) {
            $change = '_';
            $searchSplit[$key] = $change;
            $searchModified = implode('', $searchSplit);
            $searchSplit = str_split($searchString);
            $newsearch += [$key => $searchModified];
        }

        $array = [];

        // boucle qui permet de rechercher chaque les résultats de la boucle de remplacant d'un caractère
        foreach($newsearch as $key => $value) {
            $array = $em->getRepository(Product::class)->createQueryBuilder('p')
            ->where("p.slug LIKE '%" . $value . "%'")
            ->getQuery()
            ->getResult();
            // boucle qui évite de récupérer plusieurs fois le même produit
            foreach($array as $arrayKey => $arrayValue) {
                foreach($search as $searchKey => $searchValue) {
                    if($arrayValue == $searchValue) {
                        unset($search[$searchKey]);
                    }
                }
            }
            $search = array_merge($search, $array);
        }

        $searchNameShow = str_replace('-', ' ', $searchString);

        return $this->render('search/index.html.twig', [
            'products' => $search,
            'searchName' => $searchNameShow
        ]);
        
    }
}
