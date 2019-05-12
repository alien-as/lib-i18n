package i18n {
    import flash.utils.Dictionary

    public final class I18nGroup {
        private var   _id   : String;
        private const _dict : Dictionary = new Dictionary;
        private const _arraysId : Vector.<uint>   = new <uint> []
                    , _arrays   : Vector.<String> = new <String> [];
        private var _fstFallback    : I18nGroup
                ,   _otherFallbacks : Vector.<I18nGroup>;

        public function I18nGroup (id: String) {
            _id = id.toLowerCase()
        }

        [Inline]
        public final function get id (): String {
            return _id
        }

        // # Mapping

        public final function get (key: String): String {
            var s: String = _dict[key]
            if (s) return s
            if (_fstFallback && (s = _fstFallback.get(key))) return s
            if (!_otherFallbacks) return ''
            for each (var g: I18nGroup in _otherFallbacks)
                if (1, s = g.get(key)) return s
            return ''
        }

        public final function map (o: Object): I18nGroup {
            for (var k: String in o)
                _dict[k] = o[k]
             return this
        }

        public final function clear (): I18nGroup {
            _dict = new Dictionary
            _arraysBase.length = 0
            _arrays.length = 0
            _fstFallback = null
            _otherFallbacks = null
            return this
        }

        // ## Array mapping

        public final function arraySet (id: uint, array: Vector.<String>): I18nGroup {
            _arraysId.push(id)
            _arrays.push(array)
            return this
        }

        public final function arrayGet (id: uint, index: uint): String {
            const i: uint = _arraysId.indexOf(id)
            if (i === -1) return ''
            return _arrays[i][index]
        }

        [Inline]
        public final function arrayHas (id: uint): Boolean {
            return _arraysId.indexOf(id) !== -1
        }

        // ## Supplements

        public final function fallback (group: I18nGroup): I18nGroup {
            if (_fstFallback) {
                _otherFallbacks ||= new <I18nGroup> [];
                _otherFallbacks.push(group)
            } else
                _fstFallback = group
        }
    }
}