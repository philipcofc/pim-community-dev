Feature: Edit a product group
  In order to manage existing product groups for the catalog
  As a product manager
  I need to be able to edit a product group

  Background:
    Given a "footwear" catalog configuration
    And I am logged in as "Julia"
    And I am on the "similar_boots" product group page
    And I visit the "Properties" tab

  @javascript
  Scenario: Successfully edit a group
    Then the product group property "Code" should be disabled
    When I fill in the product group property "English (United States)" with "My similar boots"
    And I press the "Save" button
    Then I should see "My similar boots"

  @javascript
  Scenario: Successfully display a dialog when we quit a page with unsaved changes
    Given I fill in the product group property "English (United States)" with "My similar boots"
    And I click on the Akeneo logo
    Then I should see a confirm dialog with the following content:
      | title   | Are you sure you want to leave this page?                          |
      | content | You will lose changes to the product group if you leave this page. |

  @javascript
  Scenario: Successfully display a message when there are unsaved changes
    When I fill in the product group property "English (United States)" with "My similar boots"
    Then I should see the text "There are unsaved changes."