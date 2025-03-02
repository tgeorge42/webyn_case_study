<?php

namespace App\Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class TrafficControllerTest extends WebTestCase
{
    public function testGetTraffic(): void
    {
        $client = static::createClient();

        $client->request('GET', '/api/traffic');

        $this->assertResponseIsSuccessful();

        $this->assertResponseHeaderSame('content-type', 'application/json');

        $responseData = json_decode($client->getResponse()->getContent(), true);

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
