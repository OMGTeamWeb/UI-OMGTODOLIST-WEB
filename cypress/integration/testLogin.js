describe('My First Test', function() {
  it("Gets, types and asserts", function() {
    cy.visit('http://localhost:4200/register')

     cy.pause()

    // Get an input, type into it and verify that the value has been updated

    cy.get('.action-name')
      .type('Yazmin')
      .should('have.value', 'Yazmin')

    cy.get('.action-email')
      .type('yaz@min.com')
      .should('have.value', 'yaz@min.com')

    cy.get('.action-password')
      .type('123')
      .should('have.value', '123')

      cy.get('form').submit()   // Submit a form

  })
})
