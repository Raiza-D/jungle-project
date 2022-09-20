describe("jungle-rails plant app", () => {
  it("opens the home page of the app", () => {
    cy.visit("/");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Clicks on the Add button of a product and increases cart count by 1", () => {
    cy.contains('Add').first().click({force: true})

    cy.contains('My Cart (1)').should("be.visible");
  });


});
