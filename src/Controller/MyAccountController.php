<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserType;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;

class MyAccountController extends AbstractController
{

    #[Route('/account', name: 'account')]
    public function index(): Response
    {
        /**
         * @var User
         */
        $user = $this->getUser();

        if(!$user){
            $this->addFlash("danger", "Vous devez être connecté pour accéder à cette partie du site");
            return $this->redirectToRoute('app_login');
        }



        return $this->render('my_account/index.html.twig', [
            'purchases' => $user->getPurchases(),
        ]);
    }

    #[Route('/account/modify/{id}', name: 'account_modify')]
    public function accountModify($id, UserRepository $userRepository, Request $request, EntityManagerInterface $em)
    {
        $user = $userRepository->find($id);

        if(!$this->getUser()){
            $this->addFlash("danger", "Vous devez être connecté pour accéder à cette partie du site");
            return $this->redirectToRoute('app_login');
        }

        if($this->getUser() !== $user) {
            return $this->redirectToRoute('home');
        }

        $form = $this->createForm(UserType::class, $user);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $user = $form->getData();
            $em->persist($user);
            $em->flush();

            $this->addFlash("success", "Vos informations ont bien été modifiées");
            return $this->redirectToRoute('account');
        }

        return $this->render('my_account/account_modify.html.twig', [
            'formview' => $form->createView()
        ]);

        
    }
}
