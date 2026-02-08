# Criar uma tag de versão no Git (fluxo correto)

## 1. Verificar se não há alterações pendentes

git status

Tudo deve estar commitado antes de criar a tag.

---

## 2. Fazer o commit (se ainda não existir)

git add.
git commit -m "docs: define project scope and architecture"

---

## 3. Criar a tag anotada apontando para o commit atual

git tag -a v0.1.0 -m "Initial documentation baseline"

---

## 4. Confirmar que a tag foi criada

git tag

Opcional:

git show v0.1.0

---

## 5. Enviar a tag para o repositório remoto

git push origin v0.1.0

Ou, para enviar todas as tags locais:

git push origin --tags



### Como enviar todas as tags que ficaram locais

`git push origin --tags`

---

## Regra mental para lembrar

Commit primeiro → tag depois → push por último.

---

## Boas práticas

- Usar tags anotadas para versões
- Seguir o padrão de nome vX.Y.Z
- Cada tag aponta para um commit específico
- Tags não são enviadas automaticamente para o remoto
