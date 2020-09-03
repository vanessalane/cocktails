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
        .then(dbPostData => res.json(dbPostData))
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
    .then(dbUserData => {
        if(!dbUserData) {
            res.status(404).json({ message: 'No ingredient found with this id' });
            return;
        }
        res.json(dbUserData);
    })
    .catch(err => {
        console.log(err);
        res.status(500).json(err);
    });
});

// POST to add multiple ingredients at once
// /api/ingredient/bulkcreate
// Required body:
// [
//   {"ingredient_name": "orange peel"},
//   {"ingredient_name": "orange peel"}
// ]
router.post('/bulkcreate', (req, res) => {
    Ingredient.bulkCreate(req.body.newIngredients)
    .then(dbUserData => {
        req.session.save(() => {
            req.session.ingredient_id = dbUserData.ingredient_id;
            req.session.ingredient_name = dbUserData.ingredient_name;
            res.json(dbUserData);
        });
    })
    .catch(err => {
        console.log(err);
        res.status(500).json(err);
    });
});

module.exports = router;