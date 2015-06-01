angular.module("app").config ($translateProvider) ->
  $translateProvider.translations 'fr',
   	TITLE: "Baccardi"
    ADD_PROJECTION: "Nouvelle projection"
    UPDATE_PROJECTION: "Modifier la projection"
   	LABEL_ADD: "Détail"
    VARIATION_ADD: "Variation"
    CREATE: "Ajouter"
    CANCEL: "Annuler"
    UPDATE: "Modifier"
    DESTROY: "Supprimer"
    RECURRING: "Tout les mois"
    EVERY_DAY: "par jour"
    EVERY_MONTH: "par mois"
    DAY: "Jour"
    MONTH: "Mois"

  $translateProvider.preferredLanguage('fr')
