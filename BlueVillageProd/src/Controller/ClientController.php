<?php

namespace App\Controller;

use App\Repository\ClientRepository;
use App\Repository\RubriqueRepository;
use App\Repository\UserRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ClientController extends AbstractController
{
    #[Route('/client', name: 'app_client')]
    public function index(RubriqueRepository $repo): Response
    {
       
        $rubriques = $repo->findBy(array('rubrique' => null));

        return $this->render('client/client.html.twig', [
            'rubrique' => $rubriques,
        ]);
    }
}
