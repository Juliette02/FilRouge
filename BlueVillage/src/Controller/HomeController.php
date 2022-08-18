<?php

namespace App\Controller;

use App\Entity\Rubrique;
use App\Repository\DetailCommandeRepository;
use App\Repository\ProduitRepository;
use App\Repository\RubriqueRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    
    #[Route('/rubrique', name: 'rubrique')]
    public function index(RubriqueRepository $repo, ProduitRepository $repoPro, DetailCommandeRepository $repoDet, $limit = 4): Response
    {

        $rubriques = $repo->findBy(array('rubrique' => null));
        $pro = $repoPro->findAll();
        $det = $repoDet->findBy([], ['quantiteArticle' => 'DESC'], $limit); // $limit == LIMIT dans SQL ATTENTION le mettre dans public function ... ($limit = ..)

        return $this->render('home/rubrique.html.twig', [
            'rubrique' => $rubriques,
            'detCom' => $det,
            'produit' => $pro
        ]);
    }


    #[Route('/sousRubrique/{id}', name: 'sousRubrique')]
    public function sousRubrique(RubriqueRepository $repo2, $id): Response
    { 
        $rubriques = $repo2->findBy(array('rubrique' => null));   
        $ssRub = $repo2->findBy(array('rubrique' => $id ));

        return $this->render('home/sousRubrique.html.twig', [
            'sousRubrique' => $ssRub,
            'rubrique'     => $rubriques       
        ]);
    }


}
