<?php

namespace App\Entity;

use App\Repository\LivraisonRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: LivraisonRepository::class)]
class Livraison
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 255)]
    private $adresse;

    #[ORM\Column(type: 'string', length: 255)]
    private $cp;

    #[ORM\Column(type: 'string', length: 255)]
    private $ville;

    #[ORM\Column(type: "date")]
    private $date;

    #[ORM\ManyToOne(targetEntity: Commande::class, inversedBy: "livraisons")]
    #[ORM\JoinColumn(nullable: false)]
    private $commande;

    #[ORM\OneToMany(targetEntity: LivraisonProduit::class, mappedBy: "idLivraison")]
    private $livraisonProduits;

    public function __construct()
    {
        $this->livraisonProduits = new ArrayCollection();
    }


    public function setId(int $id):self
    {
        $this->id = $id;

        return $this;
    }
    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAdresse(): ?string
    {
        return $this->adresse;
    }

    public function setAdresse(string $adresseLivraison): self
    {
        $this->adresse = $adresseLivraison;

        return $this;
    }

    public function getCp(): ?string
    {
        return $this->cp;
    }

    public function setCp(string $cpLivraison): self
    {
        $this->cp = $cpLivraison;

        return $this;
    }

    public function getVille(): ?string
    {
        return $this->ville;
    }

    public function setVille(string $villeLivraison): self
    {
        $this->ville = $villeLivraison;

        return $this;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(\DateTimeInterface $dateLivraison): self
    {
        $this->date = $dateLivraison;

        return $this;
    }

    public function getCommande(): ?Commande
    {
        return $this->commande;
    }

    public function setCommande(?Commande $idCommande): self
    {
        $this->commande = $idCommande;

        return $this;
    }

    /**
     * @return Collection<int, LivraisonProduit>
     */
    public function getLivraisonProduits(): Collection
    {
        return $this->livraisonProduits;
    }

    public function addLivraisonProduit(LivraisonProduit $livraisonProduit): self
    {
        if (!$this->livraisonProduits->contains($livraisonProduit)) {
            $this->livraisonProduits[] = $livraisonProduit;
            $livraisonProduit->setLivraison($this);
        }

        return $this;
    }

    public function removeLivraisonProduit(LivraisonProduit $livraisonProduit): self
    {
        if ($this->livraisonProduits->removeElement($livraisonProduit)) {
            // set the owning side to null (unless already changed)
            if ($livraisonProduit->getLivraison() === $this) {
                $livraisonProduit->setLivraison(null);
            }
        }

        return $this;
    }
}
