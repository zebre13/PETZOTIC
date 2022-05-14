// import algoliasearch from 'algoliasearch/lite';
// import { autocomplete } from '@algolia/autocomplete-js';
// // import { autocomplete, getAlgoliaResults } from '@algolia/autocomplete-js';

// const searchClient = algoliasearch(
//   'I1MPP60BUM',
//   'ed2e90d2ea59cda400a2d9d36713b7a6'
// );

// console.log('coucou');


// const index = searchClient.initIndex('contacts');
// const contactsJSON = require('./contacts.json');

// // index.saveObjects(['tiger', 'lion'])
// index.saveObject(contactsJSON, {
//   autoGenerateObjectIDIfNotExist: true
// }).then(({ objectIDs }) => {
//   console.log(objectIDs);
// });


// // const pets = index.saveObjects(objects).then(({ objectIDs }) => {
// //   console.log(objectIDs);
// // });

// // import { MyComponent } from './my-components';

// // autocomplete({
// //   // ...
// //   components: {
// //     MyComponent,
// //   },
// //   render({ sections, components, html, render }, root) {
// //     render(
// //       html`<div class="aa-PanelLayout aa-Panel--scollable">${sections}</div>
// //         ${components.MyComponent()}`,
// //       root
// //     );
// //   },
// // });

// // const index = algoliaSearch.initIndex(pets.specie);

// export const autocompleteSearch = autocomplete({
//   container: '#autocomplete',
//   placeholder: 'Specie',
//   getSources() {
//     return [
//       {
//         sourceId: 'querySuggestions',
//         getItemInputValue: ({ item }) => item.query,
//         getItems({ query }) {
//           return getAlgoliaResults({
//             searchClient,
//             queries: [
//               {
//                 indexName: 'contacts',
//                 query,
//                 params: {
//                   hitsPerPage: 4,
//                 },
//               },
//             ],
//           });
//         },
//         templates: {
//           item({ item }) {
//             return components.ReverseHighlight({ hit: item, attribute: 'query' });
//                     },
//         },
//       },
//     ];
//   },
// });
