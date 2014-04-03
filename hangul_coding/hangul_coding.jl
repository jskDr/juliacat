# hangul_coding.jl
#                           wookay.noh at gmail.com

const 냉무 = ""
const 공백 = " "
macro _w_str(s)
  Expr(:call, ()->split(s, 공백))
end
const 첫소리순서 = _w"ㄱ ㄲ ㄴ ㄷ ㄸ ㄹ ㅁ ㅂ ㅃ ㅅ ㅆ ㅇ ㅈ ㅉ ㅊ ㅋ ㅌ ㅍ ㅎ"
const 가운뎃소리순서 = _w"ㅏ ㅐ ㅑ ㅒ ㅓ ㅔ ㅕ ㅖ ㅗ ㅘ ㅙ ㅚ ㅛ ㅜ ㅝ ㅞ ㅟ ㅠ ㅡ ㅢ ㅣ"
const 끝소리순서 = vcat([냉무], _w"ㄱ ㄲ ㄳ ㄴ ㄵ ㄶ ㄷ ㄹ ㄺ ㄻ ㄼ ㄽ ㄾ ㄿ ㅀ ㅁ ㅂ ㅄ ㅅ ㅆ ㅇ ㅈ ㅊ ㅋ ㅌ ㅍ ㅎ")
const 가운뎃소리오프셋 = 28
const 첫소리오프셋 = 21가운뎃소리오프셋
const 가 = 0xAC00

type 닿 소리
end
type 홀 소리
end
type 낱 소리
end

function index(a, x)
  findin(a, [x])[1]
end

function +(첫::닿, 가운뎃::홀)
  +(첫::닿, 가운뎃::홀, 닿(냉무))
end

function +(첫::닿, 가운뎃::홀, 끝::닿)
  값 = 가 +
    (index(첫소리순서, 첫.소리) - 1) * 첫소리오프셋 +
    (index(가운뎃소리순서, 가운뎃.소리) - 1) * 가운뎃소리오프셋 +
    (index(끝소리순서, 끝.소리) - 1)
  낱(string(char(값)))
end

ㄱ, ㄲ, ㄴ, ㄷ, ㄸ, ㄹ, ㅁ, ㅂ, ㅃ, ㅅ, ㅆ, ㅇ, ㅈ, ㅉ, ㅊ, ㅋ, ㅌ, ㅍ, ㅎ =
  닿("ㄱ"), 닿("ㄲ"), 닿("ㄴ"), 닿("ㄷ"), 닿("ㄸ"), 닿("ㄹ"),
  닿("ㅁ"), 닿("ㅂ"), 닿("ㅃ"), 닿("ㅅ"), 닿("ㅆ"), 닿("ㅇ"),
  닿("ㅈ"), 닿("ㅉ"), 닿("ㅊ"), 닿("ㅋ"), 닿("ㅌ"), 닿("ㅍ"), 닿("ㅎ")
ㅏ, ㅐ, ㅑ, ㅒ, ㅓ, ㅔ, ㅕ, ㅖ, ㅗ, ㅘ, ㅙ, ㅚ, ㅛ, ㅜ, ㅝ, ㅞ, ㅟ, ㅠ, ㅡ, ㅢ, ㅣ =
  홀("ㅏ"), 홀("ㅐ"), 홀("ㅑ"), 홀("ㅒ"), 홀("ㅓ"), 홀("ㅔ"), 홀("ㅕ"),
  홀("ㅖ"), 홀("ㅗ"), 홀("ㅘ"), 홀("ㅙ"), 홀("ㅚ"), 홀("ㅛ"), 홀("ㅜ"),
  홀("ㅝ"), 홀("ㅞ"), 홀("ㅟ"), 홀("ㅠ"), 홀("ㅡ"), 홀("ㅢ"), 홀("ㅣ")
ㄳ, ㄵ, ㄶ, ㄺ, ㄻ, ㄼ, ㄽ, ㄾ, ㄿ, ㅀ, ㅄ =
  닿("ㄳ"), 닿("ㄵ"), 닿("ㄶ"), 닿("ㄺ"), 닿("ㄻ"), 닿("ㄼ"), 닿("ㄽ"),
  닿("ㄾ"), 닿("ㄿ"), 닿("ㅀ"), 닿("ㅄ")


@assert "ㅎ" == ㅎ.소리
@assert 닿 == typeof(ㅎ)
@assert "ㅏ" == ㅏ.소리
@assert 홀 == typeof(ㅏ)
@assert "한" == (ㅎ+ㅏ+ㄴ).소리
@assert 낱 == typeof(ㅎ+ㅏ+ㄴ)
@assert "글" == (ㄱ+ㅡ+ㄹ).소리
@assert "이" == (ㅇ+ㅣ).소리