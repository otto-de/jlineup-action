# JLineup GitHub Action

This actions runs JLineup

## Inputs

### `url`

**Required** The url of the page to JLineup. Default is `"https://www.otto.de"`.

## Outputs

### `result`

The output of JLineup

## Example usage

```yaml
uses: actions/jlineup-github-action@main
with:
  url: 'https://www.otto.de'
```
