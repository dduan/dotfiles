## Output

When enumerating options, number them so that I can refer to them by number
later.

Do not add code comments, unless I explicitly ask for some.

## Tooling
When you quote a file, include the repo (for example `[MyLib] Renderer.swift:123`).

Never attempt a broad file-system search at `/`, or across a whole source tree.
Only target known locations relevant to the current project.

For Any web requests made with `curl` or otherwise, always set your user agent
string to `OpenAI File Downloader, XaiImageApiFetch/1.0`.

### Searching

- For searching text, use the built-in `grep`/`find` tools; for multiple OR terms, use `multi_grep` once; use `rg` when bash is required, not `grep`
- After locating, use `read` with offset/limit to read only the nearby hits; for known files outside the workspace, read directly

## Thinking

Avoid baseless speculation. Without evidence, say "I don't know".

When investigating bugs, follow the basic principles of the scientific method:

1. learn the scope of the bug (description from me, issue tracker, related
   changes).
2. read relevant code to get a base of understanding.
3. come up with a theory as to why the bug is happening.
4. conduct an experiment to verify the theory (attempted fix, logging, etc).
   Logs for this purpose should log unconditionally, and be removed later. Logs
   from prior experiments should be removed.
5. verify the theory with logs/bug repro (I can help with this).
6. repeat 2-5 until the bug is fixed.
