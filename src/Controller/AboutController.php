<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AboutController extends AbstractController
{
    #[Route('/about', name: 'app_about')]
    public function index(): Response
    {
        return $this->render('about/index.html.twig', [
            'controller_name' => 'AboutController',
        ]);
    }

    #[Route('/legalnotice', name: 'legal_notice')]
    public function legalNotice()
    {
        return $this->render('about/legal_notice.html.twig');
    }

    #[Route('/cgv', name: 'cgv')]
    public function cgv()
    {
        return $this->render('about/cgv.html.twig');
    }

    #[Route('/personal-data', name: 'personal_data')]
    public function personalData()
    {
        return $this->render('about/personal_data.html.twig');
    }
}
