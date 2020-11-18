import compile_ from 'coffee-ahk'

// function

async function main_(): Promise<void> {

  await compile_('./source/index.coffee', {
    salt: 'toolkit',
    verbose: true
  })
}

// export
export default main_