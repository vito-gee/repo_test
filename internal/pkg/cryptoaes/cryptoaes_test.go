package cryptoaes

import "testing"

const (
	key = "m52psEZHSn4!&hbs"
)

func TestEncrypt2(t *testing.T) {
	t.Log(Encrypt(key, "github.com/vito-gee/repo_test"))
}

func TestDecrypt(t *testing.T) {
	t.Log(Decrypt(key, "qAyQtb9bkvbDFW47H5DGDVwTjw399k13xM2ceBg/OGc="))
}
