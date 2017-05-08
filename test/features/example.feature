Feature: Google can search

Background:
	Given I am on Google

Scenario: Search for a term
	When I search "TestingBot"
	Then I should see title "testingbot - Buscar con Google"