const router = require('express').Router();
const { Ingredient, Recipe} = require ('../../models');

// GET All Ingredients
// /api
router.get('/',( reg, res) => {
    Ingredient.findAll({
        attributes:[
            'ingredient_id','ingredient_name']
            ,
        order: [['ingredient_name', 'ASC']],
        include: [
            {
                model: Recipe,
                attributes: ['recipe_id'],
                as: 'recipe_ingredients',
                through: {
                    attributes: ['amount'],
                    as: 'ingredient_amount'
                  }
            },
        ],
    })
    .then(dbIngredientData => res.json(dbIngredientData))
    .catch(err => {
        console.log(err);
        res.status(500).json(err);
    });
})

// GET one ingredient by ingredient_id
// /api/ingredients/1
router.get('/:id',( req, res) => {
    Ingredient.findOne({
        where: {
            ingredient_id: req.params.id
        }
    })
    .then(dbIngredientData => {
        if(!dbIngredientData) {
            res.status(404).json({ message: 'No ingredient found with this id' });
            return;
        }
        res.json(dbIngredientData);
    })
    .catch(err => {
        console.log(err);
        res.status(500).json(err);
    });
});

// POST to find an ingredient or create it if it doesn't exist
// /api/ingredient/findorcreate
// Required body:
// {"ingredient_name": "orange peel"}
router.post('/findorcreate', (req, res) => {
    Ingredient.findOrCreate({
        where: { ingredient_name: req.body.ingredient_name }
    })
    .then(dbIngredientData => {
        res.json(dbIngredientData);
    })
    .catch(err => {
        console.log(err);
        res.status(500).json(err);
    });
});

module.exports = router;