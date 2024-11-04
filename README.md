![OSS Lifecycle](https://img.shields.io/osslifecycle?file_url=https%3A%2F%2Fraw.githubusercontent.com%2Fotto-de%2Fjlineup-action%2Fmain%2FOSSMETADATA)

# JLineup GitHub Action

This actions runs JLineup. It supports Firefox_Headless and Chrome_Headless as browser engine.

See https://github.com/otto-de/jlineup for more information about JLineup. 

## Quickstart:

Put a `lineup.json` file into your project's root directory and add the JLineup action. More information about the JLineup config can be found here: https://github.com/otto-de/jlineup/blob/master/docs/CONFIGURATION.md


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
