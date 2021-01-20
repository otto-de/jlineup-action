# JLineup GitHub Action

This actions runs JLineup. It supports Firefox_Headless, Chrome_Headless and PhantomJS as browser engine.

See https://github.com/otto-de/jlineup for more information about JLineup. 

## Quickstart:

Put a `lineup.json` file into your project's root directory and add the JLineup action.


## Inputs

### `config`

**Required** The path to your JLineup config file. Default is `'lineup.json'`.

### `step`

**Required** The step, can be `'before'` or `'after'`. Default is `'before'`.

### `workspace`

**Required** The JLineup working directory. Default is `'jlineup_workspace'`.

## Outputs

### `result`

The output of JLineup in text form

### `workspace`

The workspace where JLineup put it's files during the run

### `success` 

**Only after a full run with `before` and `after`** `true` if no differences were found, `false` if differences were found.

### `difference`

**Only after a full run with `before` and `after`** The sum of all difference percentages of screenshots that were compared.

## Example usage

```yaml
uses: otto-de/jlineup-action@main
with:
  step: 'before'
```
