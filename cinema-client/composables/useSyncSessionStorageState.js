export const useSyncSessionStorageState = ({ nameSessionStorage,value} ) => {
  const sessionValue = JSON.parse(sessionStorage.getItem(nameSessionStorage))
  if(!sessionValue){
    sessionStorage.setItem(nameSessionStorage, 'Beta Mỹ Đình')
  }
  const name = useState(nameSessionStorage,() => sessionValue)
  watch(name, () => (sessionValue = name))
  return name
}
