export function checkTimeExpired(time = '') {
  const dateString = new Date(time)
  // Create a Date object from the string
  const currentDate = new Date()
  // console.log(convertDateToCustomFormat(dateString), convertDateToCustomFormat(currentDate))
  return dateString < currentDate // Check if dateString is before the current date
}

function convertDateToCustomFormat(date) {
  // Check if the input is a valid Date object
  if (!(date instanceof Date) || isNaN(date)) {
    return 'Invalid Date'
  }

  // Extract date components
  const hours = date.getHours().toString().padStart(2, '0')
  const minutes = date.getMinutes().toString().padStart(2, '0')
  const seconds = date.getSeconds().toString().padStart(2, '0')
  const day = date.getDate().toString().padStart(2, '0')
  const month = (date.getMonth() + 1).toString().padStart(2, '0') // Month is zero-based
  const year = date.getFullYear()

  // Create the custom formatted date string
  const customFormat = `${hours}/${minutes}/${seconds}/${day}/${month}/${year}`

  return customFormat
}
