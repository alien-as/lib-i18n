package i18n {
    public final class I18nBox {
        private const _groups: Vector.<I18nGroup> = new <I18nGroup> [];

        public final function group (id: String): I18nGroup {
            id = id.toLowerCase()
            for each (var g: I18nGroup in _groups)
                if (g.name === id) return g
            const d: I18nGroup = new I18nGroup(id)
            _groups.push(d)
            return d
        }
    }
}