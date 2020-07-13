shargs-example-sync-sql is a sample application of [shargs][shargs] 🦈.

See the [`shargs` github repository][shargs] for more details!

[![node version][shield-node]][node]
[![license][shield-license]][license]
[![PRs Welcome][shield-prs]][contribute]

## Setup

```bash
$ git clone https://github.com/Yord/shargs-example-sync-sql.git
$ cd shargs-example-sync-sql
$ npm i
$ chmod +x ./sql
```

## Example

This repository is a simple example of a command-line parser build with [shargs][shargs].
The program can be found in the [`sql`][sql] script.

## Run the Example

The `sql` script parses a very simple version of the SQL query language:

```bash
./sql \
SELECT 'alias, power' \
FROM superheroes,powers \
WHERE 'id = superhero_id AND universe = "Marvel"' \
GROUP BY alias \
HAVING 'COUNT(power) > 5' \
ORDER BY alias \
LIMIT 10
```

This prints the following:

```js
{
  _: [],
  select: [ 'alias', 'power' ],
  from: [ 'superheroes', 'powers' ],
  where: 'id = superhero_id AND universe = "Marvel"',
  groupBy: 'alias',
  having: 'COUNT(power) > 5',
  orderBy: 'alias',
  limit: 10
}
```

Note that the order of the object fields may be different depending on the node version.

## Reporting Issues

Please report issues [in the `shargs` tracker][issues]!

## License

`shargs-example-sync-sql` is [MIT licensed][license].



[contribute]: https://github.com/Yord/shargs#contributing
[issues]: https://github.com/Yord/shargs/issues
[license]: https://github.com/Yord/shargs-example-sync-sql/blob/master/LICENSE
[node]: https://nodejs.org/
[shargs]: https://github.com/Yord/shargs
[shield-license]: https://img.shields.io/badge/license-MIT-yellow.svg?labelColor=313A42
[shield-node]: https://img.shields.io/node/v/shargs?color=red&labelColor=313A42
[shield-prs]: https://img.shields.io/badge/PRs-welcome-green.svg?labelColor=313A42
[sql]: https://github.com/Yord/shargs-example-sync-sql/blob/master/sql