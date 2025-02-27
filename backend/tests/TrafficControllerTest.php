<?php

namespace App\Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class TrafficControllerTest extends WebTestCase
{
    public function testGetTraffic(): void
    {
        $client = static::createClient();

        // Effectuer une requête GET sur l'API
        $client->request('GET', '/api/traffic');

        // Vérifier que la réponse est un succès (code 200)
        $this->assertResponseIsSuccessful();

        // Vérifier que la réponse est bien au format JSON
        $this->assertResponseHeaderSame('content-type', 'application/json');

        // Récupérer le contenu JSON
        $responseData = json_decode($client->getResponse()->getContent(), true);

        // Vérifier que la structure des données est correcte
        $this->assertIsArray($responseData);
        $this->assertCount(5, $responseData);

        foreach ($responseData as $trafficEntry) {
            $this->assertArrayHasKey('page_id', $trafficEntry);
            $this->assertArrayHasKey('page_url', $trafficEntry);
            $this->assertArrayHasKey('traffic', $trafficEntry);

            $this->assertIsInt($trafficEntry['page_id']);
            $this->assertIsString($trafficEntry['page_url']);
            $this->assertIsInt($trafficEntry['traffic']);
        }
    }
}
