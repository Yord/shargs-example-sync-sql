#!/usr/bin/env node

const {parserSync} = require('shargs')
const {array, command, number, string, subcommand} = require('shargs-opts')
const {cast} = require('shargs-parser')

const csv = array(['csv'])

const group = subcommand([
  string('by', ['BY'])
])

const order = subcommand([
  string('by', ['BY'])
])

const opts = [
  csv('select', ['SELECT']),
  csv('from', ['FROM']),
  string('where', ['WHERE']),
  group('group', ['GROUP']),
  string('having', ['HAVING']),
  order('order', ['ORDER']),
  number('limit', ['LIMIT'])
]

const sql = command('sql', opts)

const stages = {
  opts: [
    csvToArray,
    cast
  ],
  args: [
    withBy('group', 'groupBy'),
    withBy('order', 'orderBy')
  ]
}

const argv = process.argv.slice(2)
const {args} = parserSync(stages)(sql)(argv)

console.log(args)
process.exit(0)

function csvToArray ({errs, opts}) {
  return {
    errs,
    opts: opts.map(opt => {
      if (opt.values && opt.values[0] && opt.types && opt.types[0] === 'csv') {
        const values = opt.values[0].split(',').map(str => str.trim())
        const types  = Array.from({length: values.length}, () => 'string')
        return {...opt, types, values}
      } else {
        return opt
      }
    })
  }
}

function withBy (from, to) {
  return ({errs, args}) => {
    const {[from]: group, ...rest} = args
  
    if (group) {
      if (group._)  rest._ = group._
      if (group.by) rest[to] = group.by
    }
  
    return {
      errs,
      args: rest
    }
  }
}