package cryptorsa

import "testing"

const (
	publicKey = `-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtoO/YB9GpcdIspc10Esy
MSKfBVspAnHsBOiyLmzlHXYfHdOf04aC+rDLC8UTbxm3/VGLTef+b7N9a6BQskjX
aMoMceKlWihdmvJPD+6ybEpSjcGXj8aaDEjJjiJhLnk1zJ5d+J9OQd5xgRSFtEFy
+OiWEhkqlwMxjFNIY0xXD0iHlnLyrAaB4Jlwp2uIwq6MCzVAJnzF/+8cov6YXfVQ
YwITDthHGG1KviPQlx5a9Nvjx/jEn1pN8OzcJKI3CRpCEuAP+80xts3nXBFUC5nT
ouHfTxyriV4r4XEO+N7H3QTBuIZ7Wr8XRFtJQcFAgye2eNJtfYMpYKb+wjqVAbR6
qwIDAQAB
-----END PUBLIC KEY-----`

	privateKey = `-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAtoO/YB9GpcdIspc10EsyMSKfBVspAnHsBOiyLmzlHXYfHdOf
04aC+rDLC8UTbxm3/VGLTef+b7N9a6BQskjXaMoMceKlWihdmvJPD+6ybEpSjcGX
j8aaDEjJjiJhLnk1zJ5d+J9OQd5xgRSFtEFy+OiWEhkqlwMxjFNIY0xXD0iHlnLy
rAaB4Jlwp2uIwq6MCzVAJnzF/+8cov6YXfVQYwITDthHGG1KviPQlx5a9Nvjx/jE
n1pN8OzcJKI3CRpCEuAP+80xts3nXBFUC5nTouHfTxyriV4r4XEO+N7H3QTBuIZ7
Wr8XRFtJQcFAgye2eNJtfYMpYKb+wjqVAbR6qwIDAQABAoIBADF0VYDYOK5m513s
9xnvpjQGK4yp/Ny6vbc+zjkiLJrlDN1qIF6Sjh8blIkl53QtRduQIu0DNcBSpGNr
VzJX5nZweRrKzP82/NYlXiL1DMenA+OBV24P5GH7vxGSYz7SfS9qog/iKrRSb/MH
+oqzSVIEw9U3mIC+zsg1MOInJ1fuXAy/rZUKL3Aw5WBwQ8+I7F1bYEn21k5TSgw4
nnt5o+gK/ooMqLL3eB/CJs3T8RqoHkL5nxt1aVZYCdF7rglMLWpANWneNU3hEteN
5AvBuo+NOt230/bqK3SkqOofVPJjLiyhoMqPGDUGuC76dGm8KfQojovFpz/tSxGU
BVsUh/ECgYEA0a9t4Yzf/aJthVneZMO5vcSCfIHgLEdSAAnFMHGkNBbtgKSfbshM
7nE8vatihkcU7McuZeULFKX/db4rfRahGvuMlH8k5Wzvr+LqcrZQnR27d25+cQiD
P0p3NRyX6KIYuBcKvarP2hthjN7FwzQ7EF9xQ4OZHHHswkgvd493KU0CgYEA3tP3
OQPSLQU5MCncxW36Xy6gk4gjYvPIcOG6ME3/hlE6cupOQaRXrG+VadItgJEofZNR
GePZWMflAe1ntja3N8dZ8hJ5bdGpYsx+rf0BYz/BFXYwWqPxHpoHz+bw797NPKMv
8yOjqLOzvjUZ8ecIvFpUsseZczwa3fPfP3smd9cCgYEAxOP3R40iXmUAdfDW9MMc
S+aTqBnDx5AInWSPNlffGdJVnS/3TOzj4BmQMYEWeIOSUGsPVDpn1zGv2H2DFGgF
SvLdJCrnGE7cGcn231P2CjH678BfFgAqTWm82bBJq/VZRLLOMR6NIX4IcWBVTmBi
/ZLBJeYSBTWsXRmvCJM8DxkCgYBVUuccrujhEln2pmECPH2dytX0CDI8psq+5sCL
1KIexaXS8QNsQUjNH6Ef9zozO+I8S5fHiSblxw1a8pQ/Aq6frjcz6X0T3y+0REfR
ycqpPXVrCWm0m4gtxp9tLapev3rpWDd5K9F0PPN7xwubRHNk5FYAa0vIA2DqUoLO
5RIy2wKBgQCtyXWbcdG3Acrz90PmZzGIcAHIje+5a9mvOQTZaa7yBxn5RU+jZWqg
dzRc2cWCabOJX/skT2vKwAzGPaJN3tRhwLxLnVnSv5mrnoMq/0FG2fJ4kSjXcjwt
/vAm3+3D5KKCAqO/3Umdg2U64h+8jzMO7DtwCYJro2VWNytmgwsL/g==
-----END RSA PRIVATE KEY-----`
)

func TestPublicKeyEncrypt(t *testing.T) {
	plaintext := "github.com/vito-gee/repo_test"
	t.Log(PublicKeyEncrypt(publicKey, plaintext))
}

func TestPrivateKeyDecrypt(t *testing.T) {
	ciphertext := "bpPQp-PI-9HFjtro8Iowv7RNhY1todIhmjFkmmwjIana5RIp6ZkfkjN7_auZp_5Xo9htF_1kJ7L4cE4ixDT8l0R4u3ZGvfYJ3lP7d-De7rk_vvrEdetGEh-VGAhp3iHRgypV8CErt0JNCXcCEM_Bk87K5FLThFoU997c9IYdS6vO1WGcLsd_qzqWGxolNrSJt_oWrX4BEwu8PtVomSHbV7oG3XBRFcitzx6Ye9SjFrouUks5snzj9_2FqLoNE6dRRBPvyR0Iz753dE3CqgxUDjBhQftXPufx6r5XU1EJ4DcZDk6ZRAplOo_bgqTa91cfKhddIfdyg9nxcovmoxxyKg=="
	t.Log(PrivateKeyDecrypt(privateKey, ciphertext))
}
