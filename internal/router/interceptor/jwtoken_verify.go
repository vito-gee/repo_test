package interceptor

import (
	"fmt"
	"net/http"

	"github.com/vito-gee/repo_test/configs"
	"github.com/vito-gee/repo_test/internal/code"
	"github.com/vito-gee/repo_test/internal/pkg/core"
	"github.com/vito-gee/repo_test/internal/pkg/jwtoken"
	"github.com/vito-gee/repo_test/internal/proposal"
)

func (i *interceptor) JWTokenAuthVerify(ctx core.Context) (sessionUserInfo proposal.SessionUserInfo, err core.BusinessError) {
	// 登录验证的 Token
	headerTokenString := ctx.GetHeader("Token")
	if headerTokenString == "" {
		err = core.Error(
			http.StatusUnauthorized,
			code.JWTAuthVerifyError,
			"Header 中缺少 Token 参数")

		return
	}

	// 验证 JWT 是否合法
	jwtClaims, jwtErr := jwtoken.New(configs.Get().JWT.Secret).Parse(headerTokenString)
	if jwtErr != nil {
		err = core.Error(
			http.StatusUnauthorized,
			code.JWTAuthVerifyError,
			fmt.Sprintf("jwt token 验证失败： %s", jwtErr.Error()))

		return
	}

	sessionUserInfo = jwtClaims.SessionUserInfo

	return
}
