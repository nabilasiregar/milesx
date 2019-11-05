const airport = () => {
  const departInput = document.querySelector('#depart')
  const arrivalInput = document.querySelector('#arrival')
  if (departInput){
    const options = {
      fuse_options : {
        shouldSort: true,
        threshold: 0.4,
        maxPatternLength: 32,
        keys: [{
            name: "IATA",
            weight: 0.6
          },
          {
            name: "name",
            weight: 0.4
          },
          {
            name: "city",
            weight: 0.2
          }
        ]
      }
    }
    AirportInput('depart', options)
    AirportInput('arrival', options)
   }
  }


export { airport };
