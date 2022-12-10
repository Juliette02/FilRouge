<?php

namespace App\Repository;

use App\Entity\DetailCommande;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<DetailCommande>
 *
 * @method DetailCommande|null find($id, $lockMode = null, $lockVersion = null)
 * @method DetailCommande|null findOneBy(array $criteria, array $orderBy = null)
 * @method DetailCommande[]    findAll()
 * @method DetailCommande[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DetailCommandeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, DetailCommande::class);
    }

    public function add(DetailCommande $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(DetailCommande $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

//-- Chiffre d'affaires mois par mois pour une année sélectionnée
    public function CAPerYear($years = null)
    {
        //$years = $_GET['year'];
        $query = $this->createQueryBuilder('dc');

        // if($years != null){

        $query
            ->select('SUM(dc.prixVente * dc.quantiteArticle) AS CA, MONTH(c.date) AS date')
            ->join('dc.commande', 'c')
            ->where('YEAR(c.date) = 2022')
            ->groupBy('date');
            // ->setParameter(':years', $years);
        // }
        return $query->getQuery()->getResult();
    }

//Chiffre d'affaires généré pour un fournisseur
    public function CAPerFou($fournisseur = null) {
        
        $query = $this->createQueryBuilder('dc');

        $query
            ->select('SUM(dc.prixVente * dc.quantiteArticle) AS CAF, f.nom as Fournisseur')
            ->join('dc.produit', 'p')
            ->join('p.fournisseur', 'f')
            ->groupBy('Fournisseur');
            
        return $query->getQuery()->getResult();
    }

//TOP 10 des produits les plus commandés pour une année sélectionnée (référence et nom du produit, quantité commandée, fournisseur)
    public function TOP10Commande($years = null) {

        $query = $this->createQueryBuilder('dc');

        $query
            ->select('p.libelleCourt AS Reference, p.libelleLong AS Nomproduit, dc.quantiteArticle AS QuantiteCommandee, f.nom AS NomFournisseur')
            ->join('dc.produit','p')
            ->join('p.fournisseur', 'f')
            ->groupBy('dc.produit')
            ->orderBy('QuantiteCommandee', 'DESC')
            ->setMaxResults(10);

            return $query->getQuery()->getResult();
        }

// TOP 10 des produits les plus rémunérateurs pour une année sélectionnée (référence et nom du produit, marge, fournisseur)
        public function Top10Remu($years = null) {

            $query = $this->createQueryBuilder('dc');

            $query
                ->select('p.libelleCourt AS Ref, p.libelleLong AS DescriptionProduit, SUM(p.prixHorsTaxe - p.prixAchat) AS Marge, f.nom AS NomFou')
                ->join('dc.commande', 'c')
                ->join('dc.produit','p')
                ->join('p.fournisseur', 'f')
                ->where('YEAR(c.date) = 2022')
                ->groupBy('dc.produit')
                ->orderBy('Marge', 'DESC')
                ->setMaxResults(10);

            return $query->getQuery()->getResult();
        }

//Top 10 des clients en nombre de commandes ou chiffre d'affaires
        public function Top10Clients() {

            $query = $this->createQueryBuilder('dc');

            $query
                ->select('CONCAT(c.nom,\' \', c.prenom) AS NomClient, SUM(dc.prixVente * dc.quantiteArticle) AS CAC')
                ->join('dc.commande', 'commande')
                ->join('commande.client', 'c')
                ->groupBy('c.id')
                ->orderBy('CAC', 'DESC')
                ->setMaxResults(10);

                return $query->getQuery()->getResult();
        }

//Répartition du chiffre d'affaires par type de client
        public function CAParClient() {

            $query = $this->createQueryBuilder('dc');

            $query
                ->select('c.categorie AS CategorieClient, SUM(dc.prixVente * dc.quantiteArticle) AS CAClient')
                ->join('dc.commande', 'commande')
                ->join('commande.client', 'c')
                ->groupBy('CategorieClient');

                return $query->getQuery()->getResult();
        }



    //    /**
    //     * @return DetailCommande[] Returns an array of DetailCommande objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('d')
    //            ->andWhere('d.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('d.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }
    //    public function findOneBySomeField($value): ?DetailCommande
    //    {
    //        return $this->createQueryBuilder('d')
    //            ->andWhere('d.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
