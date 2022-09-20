describe("jungle-rails plant app", () => {
  it("opens the home page of the app", () => {
    cy.visit("/");
  });

  it("Can click on a product to view it in more detail", () => {
    cy.contains("Scented Blade").click()
  });

  it("The product detail is displayed", () => {
    cy.get("article.product-detail").should("be.visible");
  });

});
