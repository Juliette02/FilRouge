<?php

namespace App\Entity;

use DateTimeInterface;
use Doctrine\ORM\Mapping as ORM;
use App\Repository\CommandeRepository;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\Validator\Constraints\DateTime;

#[ORM\Entity(repositoryClass: CommandeRepository::class)]
class Commande
{
    
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: "date")]
    private $date;

    #[ORM\Column(type: 'string', length: 255)]
    private $adresseLivraison;

    #[ORM\Column(type: 'string', length: 255)]
    private $cpLivraison;

    #[ORM\Column(type: 'string', length: 255)]
    private $villeLivraison;

    #[ORM\Column(type: 'string', length: 255)]
    private $adresseFacture;

    #[ORM\Column(type: 'string', length: 255)]
    private $cpFacture;

    #[ORM\Column(type: 'string', length: 255)]
    private $villeFacture;

    #[ORM\Column(type: "date")]
    private $dateFacture;

    #[ORM\Column(type: "decimal", precision: 19, scale: 4, nullable: true)]
    private $total;


    #[ORM\OneToMany(targetEntity: Livraison::class, mappedBy: "idCommande")]
    private $livraisons;


    #[ORM\OneToMany(targetEntity: DetailCommande::class, mappedBy: "idCommande")]
    private $detailCommandes;

    #[ORM\ManyToOne(targetEntity: Client::class, inversedBy: "commandes")]
    #[ORM\JoinColumn(nullable: false)]
    private $client;

    public function __construct()
    {
        $this->livraisons = new ArrayCollection();
        $this->detailCommandes = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(INT $id): self
    {
        $this->id = $id;

        return $this;
    } 

    public function getDate(): ?\DateTime
    {
        return $this->date;
    }

    /**
     * @param \DateTime $dateCommande
     */

    public function setDate(\DateTime $dateCommande): self
    {
        $this->date = $dateCommande;

        return $this;
    }

    public function getAdresseLivraison(): ?string
    {
        return $this->adresseLivraison;
    }

    public function setAdresseLivraison(string $adresseLivraisonCommande): self
    {
        $this->adresseLivraison = $adresseLivraisonCommande;

        return $this;
    }

    public function getCpLivraison(): ?string
    {
        return $this->cpLivraison;
    }

    public function setCpLivraison(string $cpLivraisonCommande): self
    {
        $this->cpLivraison = $cpLivraisonCommande;

        return $this;
    }

    public function getVilleLivraison(): ?string
    {
        return $this->villeLivraison;
    }

    public function setVilleLivraison(string $villeLivraisonCommande): self
    {
        $this->villeLivraison = $villeLivraisonCommande;

        return $this;
    }

    public function getAdresseFacture(): ?string
    {
        return $this->adresseFacture;
    }

    public function setAdresseFacture(string $adresseFactureCommande): self
    {
        $this->adresseFacture = $adresseFactureCommande;

        return $this;
    }

    public function getCpFacture(): ?string
    {
        return $this->cpFacture;
    }

    public function setCpFacture(string $cpFactureCommande): self
    {
        $this->cpFacture = $cpFactureCommande;

        return $this;
    }

    public function getVilleFacture(): ?string
    {
        return $this->villeFacture;
    }

    public function setVilleFacture(string $villeFactureCommande): self
    {
        $this->villeFacture = $villeFactureCommande;

        return $this;
    }

    public function getDateFacture(): ?\DateTime
    {
        return $this->dateFacture;
    }

    public function setDateFacture(\DateTime $dateFacture): self
    {
        $this->dateFacture = $dateFacture;

        return $this;
    }

    public function getTotal(): ?string
    {
        return $this->total;
    }

    public function setTotal(string $totalCommande): self
    {
        $this->total = $totalCommande;

        return $this;
    }

 

    /**
     * @return Collection<int, Livraison>
     */
    public function getLivraisons(): Collection
    {
        return $this->livraisons;
    }

    public function addLivraison(Livraison $livraison): self
    {
        if (!$this->livraisons->contains($livraison)) {
            $this->livraisons[] = $livraison;
            $livraison->setCommande($this);
        }

        return $this;
    }

    public function removeLivraison(Livraison $livraison): self
    {
        if ($this->livraisons->removeElement($livraison)) {
            // set the owning side to null (unless already changed)
            if ($livraison->getCommande() === $this) {
                $livraison->setCommande(null);
            }
        }

        return $this;
    }

  

    /**
     * @return Collection<int, DetailCommande>
     */
    public function getDetailCommandes(): Collection
    {
        return $this->detailCommandes;
    }

    public function addDetailCommande(DetailCommande $detailCommande): self
    {
        if (!$this->detailCommandes->contains($detailCommande)) {
            $this->detailCommandes[] = $detailCommande;
            $detailCommande->setCommande($this);
        }

        return $this;
    }

    public function removeDetailCommande(DetailCommande $detailCommande): self
    {
        if ($this->detailCommandes->removeElement($detailCommande)) {
            // set the owning side to null (unless already changed)
            if ($detailCommande->getCommande() === $this) {
                $detailCommande->setCommande(null);
            }
        }

        return $this;
    }

    public function getClient(): ?Client
    {
        return $this->client;
    }

    public function setClient(?Client $client): self
    {
        $this->client = $client;

        return $this;
    }
}
