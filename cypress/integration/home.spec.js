
describe('jungle-rails plant app', () => {
  
  it ('opens the home page of the app', () => {
    cy.visit('/') // Why is it a slash instead of the entire site's URL?
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

});