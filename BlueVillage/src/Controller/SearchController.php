<?php

namespace App\Controller;

use App\Form\SearchProduitType;
use App\Repository\ProduitRepository;
use App\Repository\RubriqueRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class SearchController extends AbstractController
{
    #[Route('/searchBar', name: 'app_searchBar')]
    public function searchBar(): Response
    {

        $formSearch = $this->createForm(SearchProduitType::class, null, [
            'action' => $this->generateUrl('app_search')
        ]);

        return $this->render('search/index.html.twig', [
            'formSearch' => $formSearch->CreateView()
        ]);
    }

    #[Route('/Search', name: 'app_search')]
    public function search(Request $request, ProduitRepository $produitRepository, RubriqueRepository $rubriqueRepository)
    {

        $rubriques = $rubriqueRepository->findBy(array('rubrique' => null));

        $formSearch = $this->CreateForm(SearchProduitType::class);

        $search = $formSearch->handleRequest($request);

        if($formSearch->isSubmitted() && $formSearch->isValid())
        {
            $produits = $produitRepository->search(
                $search->get('mots')->getData()
            );

        }

        return $this->render('search/result.html.twig', [
            'produits' => $produits,
            'rubrique' => $rubriques,

        ]
        );
        
        return $this->redirectToRoute('rubrique');

    }
}
