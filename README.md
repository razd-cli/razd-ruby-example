# Razd Ruby Example

Простой пример Ruby Rack приложения с использованием [Razd](https://github.com/razd-cli/razd) для управления задачами.

## Требования

- [Razd](https://github.com/razd-cli/razd) - менеджер задач
- [mise](https://mise.jdx.dev/) - менеджер версий инструментов (устанавливается автоматически через Razd)

## Быстрый старт

```bash
# Установка зависимостей и запуск сервера
razd
```

Сервер запустится на http://localhost:9292

## Доступные команды

```bash
# Установить инструменты и зависимости
razd install

# Запустить dev-сервер
razd dev

# Проверить настройку проекта
razd build

# Очистить зависимости
razd clean

# Показать все доступные задачи
razd --list
```

## Структура проекта

- `app.ru` - Rack приложение
- `gems.rb` - зависимости Ruby (Gemfile)
- `gems.locked` - locked версии зависимостей
- `Razdfile.yml` - конфигурация задач Razd
- `mise.toml` - конфигурация инструментов mise

## Что делает Razd?

Razd автоматически:
- Устанавливает Ruby через mise
- Устанавливает task runner
- Запускает `bundle install` для установки gems
- Запускает Rack сервер с помощью rackup

Все это одной командой: `razd`
