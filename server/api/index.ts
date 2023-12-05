export default defineEventHandler(() => {
  console.log('API is running')
  return {
    API: 'Running!',
    nitro: 'Is Awesome!'
  }
})
