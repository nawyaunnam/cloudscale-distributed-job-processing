package main
import("net/http";"net/http/httptest";"testing")
func TestAuthRejectsMissingToken(t *testing.T){h:=auth("secret",http.HandlerFunc(func(http.ResponseWriter,*http.Request){}));r:=httptest.NewRequest("GET","/",nil);w:=httptest.NewRecorder();h.ServeHTTP(w,r);if w.Code!=401{t.Fatalf("got %d",w.Code)}}

