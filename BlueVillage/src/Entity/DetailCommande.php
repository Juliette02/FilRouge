<?php

namespace App\Entity;

use App\Repository\DetailCommandeRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: DetailCommandeRepository::class)]
class DetailCommande
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: "integer")]
    private $quantiteArticle;

    #[ORM\Column(type: "decimal", precision: 19, scale: 4)]
    private $prixVente;

    #[ORM\Column(type: "decimal", precision: 19, scale: 4)]
    private $prixHorsTaxeTotal;

    #[ORM\Column(type: "decimal", precision: 10, scale: 4)]
    private $tvaProduit;

    #[ORM\ManyToOne(targetEntity: Commande::class, inversedBy: "detailCommandes")]
    #[ORM\JoinColumn(nullable: false)]
    private $commande;

    #[ORM\ManyToOne(targetEntity: Produit::class, inversedBy: "detailCommandes")]
    #[ORM\JoinColumn(nullable: false)]
    private $produit;


    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(int $id) : self
    {
        $this->id = $id;

        return $this;
    }

    public function getQuantiteArticle(): ?int
    {
        return $this->quantiteArticle;
    }

    public function setQuantiteArticle(int $quantiteArticle): self
    {
        $this->quantiteArticle = $quantiteArticle;

        return $this;
    }

    public function getPrixVente(): ?string
    {
        return $this->prixVente;
    }

    public function setPrixVente(string $prixVente): self
    {
        $this->prixVente = $prixVente;

        return $this;
    }

    public function getPrixHorsTaxeTotal(): ?string
    {
        return $this->prixHorsTaxeTotal;
    }

    public function setPrixHorsTaxeTotal(string $prixHorsTaxeTotal): self
    {
        $this->prixHorsTaxeTotal = $prixHorsTaxeTotal;

        return $this;
    }

    public function getTvaProduit(): ?string
    {
        return $this->tvaProduit;
    }

    public function setTvaProduit(string $tvaProduit): self
    {
        $this->tvaProduit = $tvaProduit;

        return $this;
    }

    public function getcommande(): ?Commande
    {
        return $this->idCommande;
    }

    public function setcommande(?Commande $idCommande): self
    {
        $this->commande = $idCommande;

        return $this;
    }

    public function getproduit(): ?Produit
    {
        return $this->produit;
    }

    public function setProduit(?Produit $idProduit): self
    {
        $this->produit = $idProduit;

        return $this;
    }
}
