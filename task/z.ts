import compile_ from 'coffee-ahk'

// function

async function main_(): Promise<void>{

  await compile_('./script/index.coffee',{
    salt: 'z'
  })
}

// export
export default main_