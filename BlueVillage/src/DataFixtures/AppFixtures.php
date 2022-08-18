<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use App\Entity\Client;
use App\Entity\Commande;
use App\Entity\Commercial;
use App\Entity\DetailCommande;
use App\Entity\Fournisseur;
use App\Entity\Livraison;
use App\Entity\LivraisonProduit;
use App\Entity\Produit;
use App\Entity\Rubrique;
use App\Entity\User;


class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {

        include 'Commercial_vg.php';

        $commercialRepo = $manager->getRepository(Commercial::class);

        foreach ($commercials as $commer){

            $commercial = new Commercial();
            $commercial
            ->setId($commer['id'])
            ->setNom($commer['nom_commercial'])
            ->setPrenom($commer['prenom_commercial'])
            ->setAdresse($commer['adresse_commercial'])
            ->setCp($commer['cp_commercial'])
            ->setVille($commer['ville_commercial'])
            ->setEmail($commer['email_commercial'])
            ->setTelephone($commer['telephone_commercial']);

            $manager->persist($commercial);

            $metadata = $manager->getClassMetaData(Commercial::class);
            $metadata->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetaData::GENERATOR_TYPE_NONE);
        }

        $manager->flush();
        






        include 'Fournisseur_vg.php';
        

        $fournisseurRepo = $manager->getRepository(Fournisseur::class);

        foreach ($fournisseur as $fou){

            $fournisseur = new Fournisseur();
            $fournisseur
            ->setId($fou['id'])
            ->setNom($fou['nom_fournisseur'])
            ->setAdresse($fou['adresse_fournisseur'])
            ->setCp($fou['cp_fournisseur'])
            ->setVille($fou['ville_fournisseur'])
            ->setEmail($fou['email_fournisseur'])
            ->setTelephone($fou['telephone_fournisseur']);

            $manager->persist($fournisseur);

            $metadata = $manager->getClassMetaData(Fournisseur::class);
            $metadata->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetaData::GENERATOR_TYPE_NONE);
        }

        $manager->flush();







        include 'Client_vg.php';
        $clientRepo = $manager->getRepository(Client::class);

        foreach ($clients as $cli){


            $client = new Client();
            $client
            ->setId($cli['id'])
            ->setCategorie($cli['categorie_client'])
            ->setAdresseLivraison($cli['adresse_livraison_client'])       
            ->setCpLivraison($cli['cp_livraison_client'])
            ->setVilleLivraison($cli['ville_livraison_client'])
            ->setAdresseFacture($cli['adresse_facture_client'])
            ->setCpFacture($cli['cp_facture_client'])
            ->setVilleFacture($cli['ville_facture_client'])
            ->setModePaiement($cli['mode_paiement_client'])
            ->setReduction($cli['reduction_client'])
            ->setCoefficient($cli['coefficient_client'])
            ->setNumeroSiret($cli['numero_siret_client'])
            ->setNom($cli['nom_client'])
            ->setPrenom($cli['prenom_client'])
            ->setNomEntreprise($cli['nom_entreprise_client']);

            $manager->persist($client);

            $metadata = $manager->getClassMetaData(Client::class);
            $metadata->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetadata::GENERATOR_TYPE_NONE);
        }

        $manager->flush();
  




        include 'Commande_vg.php';

        $commandeRepo = $manager->getRepository(Commande::class);

        foreach ($commandes as $com){

            $client = $clientRepo->find($com["id_client_id"]);

            $commande = new Commande();
            $commande
            ->setId($com['id'])
            ->setClient($client)
            ->setDate(new \DateTime($com['date_commande']))
            ->setAdresseLivraison($com['adresse_livraison_commande'])
            ->setCpLivraison($com['cp_livraison_commande'])
            ->setVilleLivraison($com['ville_livraison_commande'])
            ->setAdresseFacture($com['adresse_facture_commande'])
            ->setCpFacture($com['cp_facture_commande'])
            ->setVilleFacture($com['ville_facture_commande'])
            ->setDateFacture(new \DateTime($com['date_facture']))
            ->setTotal($com['total_commande']);

            $manager->persist($commande);

            $metadata = $manager->getClassMetaData(Commande::class);
            $metadata->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetadata::GENERATOR_TYPE_NONE);
        }

        $manager->flush();







        include 'Rubrique_vg.php';
        
        $rubriqueRepo = $manager->getRepository(Rubrique::class);

        foreach ($rubriques as $rub){

            $rubrique = new Rubrique();
            $rubrique
            ->setNom($rub['nom_rubrique'])
            ->setPhoto($rub['photo_rubrique']);


            $manager->persist($rubrique);

            
            foreach ($rub['sousrubriques'] as $rub2) {
                $rubrique2 = new Rubrique();
                $rubrique2
                ->setNom($rub2['nom_rubrique'])
                ->setPhoto($rub2['photo_rubrique'])
                ->setRubrique($rubrique);

                $manager->persist($rubrique2);

            }

            $manager->flush();
        }






        include 'Produit_vg.php';



        $produitRepo = $manager->getRepository(Produit::class);

        foreach ($produits as $pro){


            $produits = new Produit();
            $produits 
            ->setId($pro['id']);
            $rubriques = $rubriqueRepo->find($pro['rubrique_id']);
            $produits
            ->setRubrique($rubriques);
            $fournisseur = $fournisseurRepo->find($pro['fournisseur_id']);
            $produits
            ->setFournisseur($fournisseur);
            $produits
            ->setLibelleCourt($pro['libelle_court'])
            ->setLibelleLong($pro['libelle_long'])
            ->setReferenceFournisseur($pro['reference_fournisseur'])
            ->setPhoto($pro['photo_produit'])
            ->setPrixAchat($pro['prix_achat'])
            ->setPrixHorsTaxe($pro['prix_hors_taxe']);
    
            $manager->persist($produits);

            $metadata = $manager->getClassMetaData(Produit::class);
            $metadata->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetaData::GENERATOR_TYPE_NONE);
        }

        $manager->flush();

        






        include 'DetailCommande_vg.php';

        $detailCommandeRepo = $manager->getRepository(DetailCommande::class);

        foreach ($detail_commandes as $detail){

            $details = new DetailCommande();
            $details
            ->setId($detail['id'])
            ->setQuantiteArticle($detail['quantite_article'])
            ->setPrixVente($detail['prix_vente'])
            ->setPrixHorsTaxeTotal($detail['prix_hors_taxe_total'])
            ->setTvaProduit($detail['tva_produit']);
            $commande = $commandeRepo->find($detail['id_commande_id']);
            $details 
            ->setCommande($commande);
            $produit = $produitRepo->find($detail['id_produit_id']);
            $details
            ->setProduit($produit);

            $manager->persist($details);

            $metadata = $manager->getClassMetaData(DetailCommande::class);
            $metadata->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetaData::GENERATOR_TYPE_NONE);
        }

        $manager->flush();





        include 'Livraison_vg.php';

        $livraisonRepo = $manager->getRepository(Livraison::class);

        foreach($livraison as $liv){

            $commande = $commandeRepo->find($liv['id_commande_id']);

            $livraisons = new Livraison;

            $livraisons
            ->setId($liv['id'])
            ->setCommande($commande)
            ->setAdresse($liv['adresse_livraison'])
            ->setCp($liv['cp_livraison'])
            ->setVille($liv['ville_livraison'])
            ->setDate(new \DateTime($liv['date_livraison']));

            $manager->persist($livraisons);

            $metadata = $manager->getClassMetaData(Livraison::class);
            $metadata->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetaData::GENERATOR_TYPE_NONE);
        }

        $manager->flush();


        // $livraisonProduits = new LivraisonProduit;
        include 'LivraisonProduit_vg.php';
        
        $livraisonProduitRepo = $manager->getRepository(LivraisonProduit::class);

        foreach($livraison_produit as $livPro){

            $produit = $produitRepo->find($livPro['id_produit_id']);
            $livraison = $livraisonRepo->find($livPro['id_livraison_id']);

            $livraisonProduits = new LivraisonProduit;

            $livraisonProduits
            ->setId($livPro['id'])
            ->setProduit($produit)
            ->setLivraison($livraison)
            ->setQuantiteProduitLivre($livPro['quantite_produit_livre']);
        
            $manager->persist($livraisonProduits);

            $metadata = $manager->getClassMetaData(LivraisonProduit::class);
            $metadata->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetaData::GENERATOR_TYPE_NONE);
        }

        $manager->flush();


        // $user = new User;
        include 'User_vg.php';

        $userRepository = $manager->getRepository(User::class);

        foreach($user as $use){

            $user = new User();
            
            $client = $use["client_id"]?$clientRepo->find($use["client_id"]):null;
            // ===  if ($use["client_id"] != null) {
            //          $client = $clientRepo->find($use["client_id"]);
            //      }
            //      else {
            //           $client = null;
            //      }
            $user
            ->setClient($client);
            $user
            ->setEmail($use['email'])
            ->setRoles($use['roles'])
            ->setPassword($use['password']);
            

            $manager->persist($user);

            $metadata = $manager->getClassMetaData(User::class);
            $metadata->setIdGeneratorType(\Doctrine\ORM\Mapping\ClassMetaData::GENERATOR_TYPE_NONE);
        }

        $manager->flush();
  }
}
