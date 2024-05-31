function useCountdown(duration, callBack = () => false) {
  const remainingTime = ref(duration)
  const intervalId = ref(null)
  const start = () => {
    if (intervalId.value) return reset()
    intervalId.value = setInterval(() => {
      if (remainingTime.value > 0) {
        remainingTime.value--
      } else {
        callBack()
        reset()
      }
    }, 1000)
  }
  function reset() {
    if (intervalId.value) {
      clearInterval(intervalId.value)
      intervalId.value = null
    }
    remainingTime.value = duration
  }
  onUnmounted(reset)
  return { remainingTime, start, reset, intervalId }
}

export default useCountdown
