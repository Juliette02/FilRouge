<?php

namespace App\Entity;

use App\Repository\LivraisonProduitRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: LivraisonProduitRepository::class)]
class LivraisonProduit
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: "integer")]
    private $quantiteProduitLivre;

    #[ORM\ManyToOne(targetEntity: Produit::class, inversedBy: "livraisonProduits")]
    #[ORM\JoinColumn(nullable: false)]
    private $produit;

    #[ORM\ManyToOne(targetEntity: Livraison::class, inversedBy: "livraisonProduits")]
    #[ORM\JoinColumn(nullable: false)]
    private $livraison;


    public function setId(int $id) :self
    {
        $this->id = $id;

        return $this;
    }
    public function getId(): ?int
    {
        return $this->id;
    }

    public function getQuantiteProduitLivre(): ?int
    {
        return $this->quantiteProduitLivre;
    }

    public function setQuantiteProduitLivre(int $quantiteProduitLivre): self
    {
        $this->quantiteProduitLivre = $quantiteProduitLivre;

        return $this;
    }

    public function getProduit(): ?Produit
    {
        return $this->produit;
    }

    public function setProduit(?Produit $idProduit): self
    {
        $this->produit = $idProduit;

        return $this;
    }

    public function getLivraison(): ?Livraison
    {
        return $this->livraison;
    }

    public function setLivraison(?Livraison $idLivraison): self
    {
        $this->livraison = $idLivraison;

        return $this;
    }
}
