<?php

namespace App\Entity;

use App\Repository\RubriqueRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: RubriqueRepository::class)]
class Rubrique
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 255)]
    private $nom;

    #[ORM\Column(type: 'string', length: 255)]
    private $photo;

    #[ORM\ManyToOne(targetEntity: Rubrique::class, inversedBy: "sousRubrique")]
    #[ORM\JoinColumn(nullable: true, onDelete: 'CASCADE')]
    private $rubrique;

    #[ORM\OneToMany(targetEntity: Rubrique::class, mappedBy: "rubrique")]
    #[ORM\JoinColumn(nullable: true)]
    private $sousRubrique;

    #[ORM\OneToMany(targetEntity: Produit::class, mappedBy: "idRubrique")]
    private $produits;

    public function __construct()
    {
        $this->sousRubrique = new ArrayCollection();
        $this->produits = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(int $id): self
    {
        $this->id = $id;

        return $this;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nomRubrique): self
    {
        $this->nom = $nomRubrique;

        return $this;
    }

    public function getPhoto(): ?string
    {
        return $this->photo;
    }

    public function setPhoto(string $photoRubrique): self
    {
        $this->photo = $photoRubrique;

        return $this;
    }

    public function getRubrique(): ?self
    {
        return $this->rubrique;
    }

    public function setRubrique(?self $idRubrique): self
    {
        $this->rubrique = $idRubrique;

        return $this;
    }

    /**
     * @return Collection<int, self>
     */
    public function getSousRubrique(): Collection
    {
        return $this->sousRubrique;
    }

    public function addRubrique(self $rubrique): self
    {
        if (!$this->sousRubrique->contains($rubrique)) {
            $this->sousRubrique[] = $rubrique;
            $rubrique->setRubrique($this);
        }

        return $this;
    }

    public function removeRubrique(self $rubrique): self
    {
        if ($this->sousRubrique->removeElement($rubrique)) {
            // set the owning side to null (unless already changed)
            if ($rubrique->getRubrique() === $this) {
                $rubrique->setRubrique(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Produit>
     */
    public function getProduits(): Collection
    {
        return $this->produits;
    }

    public function addProduit(Produit $produit): self
    {
        if (!$this->produits->contains($produit)) {
            $this->produits[] = $produit;
            $produit->setRubrique($this);
        }

        return $this;
    }

    public function removeProduit(Produit $produit): self
    {
        if ($this->produits->removeElement($produit)) {
            // set the owning side to null (unless already changed)
            if ($produit->getRubrique() === $this) {
                $produit->setRubrique(null);
            }
        }

        return $this;
    }

    public function __toString(): string
    { 
        return $this->getNom();        
    }

}
