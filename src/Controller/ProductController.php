<?php

namespace App\Controller;

use DateTimeImmutable;
use App\Form\CommentType;
use App\Repository\CommentRepository;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ProductController extends AbstractController
{
    #[Route('/{catslug}/{slug}', name: 'product', priority: -2)]
    public function show($slug, ProductRepository $productRepository, CommentRepository $commentRepository, Request $request, EntityManagerInterface $em): Response
    {

        $product = $productRepository->findOneBy([
            'slug' => $slug
        ]);

        if (!$product) {
            $this->addFlash("danger", "Le produit n'a pas été trouvé");
            return $this->redirectToRoute('category_list');
        }

        $comments = $commentRepository->findBy([
            'product' => $product
        ], ['PostedAt' => 'DESC']);

        $form = $this->createForm(CommentType::class);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            if (!$product) {
                $this->addFlash("danger", "Le produit n'a pas été trouvé");
                return $this->redirectToRoute('category_list');
            }


            // algo de sécurisation
            $count = 0;
            foreach ($this->getUser()->getPurchases() as $purchase) {
                foreach($purchase->getPurchaseItems() as $item) {
                    if ($item->getProduct() == $product) {
                        $count++;
                    }
                }
            }

            if ($count == 0) {
                $this->addFlash("danger", "Une erreur s'est produite");
                return $this->redirectToRoute('home');
            }
            // fin de la sécu

            $comment = $form->getData()
                ->setUser($this->getUser())
                ->setProduct($product)
                ->setPostedAt(new DateTimeImmutable())
                ->setFullName($this->getUser()->getFirstName() . ' ' . $this->getUser()->getLastName());
            $em->persist($comment);
            $em->flush();

            $this->addFlash("success", "Votre commentaire a bien été ajouté");
            return $this->redirectToRoute('product', [
                'catslug' => 'addcoment',
                'slug' => $slug
            ]);
        }

        $proposedProducts = $productRepository->findBy([], ['nSell' => 'DESC'], 8);

        return $this->render('product/show.html.twig', [
            'product' => $product,
            'comments' => $comments,
            'formview' => $form->createView(),
            'proposedProducts' => $proposedProducts
        ]);
    }

    #[Route('/comment/remove/{id}', name: 'comment_remove')]
    public function commentRemove($id, CommentRepository $commentRepository, EntityManagerInterface $em, ProductRepository $productRepository)
    {
        $comment = $commentRepository->findOneBy([
            'id' => $id
        ]);

        if(!$this->getUser() || !$comment || ($this->getUser() !== $comment->getUser())) {
            $this->addFlash("danger", "Une erreur s'est produite");
            return $this->redirectToRoute('home');
        }

        $product = $comment->getProduct();

        $em->remove($comment);
        $em->flush();

        $this->addFlash("success", "Le commentaire a bien été supprimé");
        return $this->redirectToRoute('product', [
            'catslug' => 'removecomment',
            'slug' => $product->getSlug()
        ]);
    }
}
