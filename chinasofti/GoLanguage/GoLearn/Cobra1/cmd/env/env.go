package env

import (
	"fmt"
	"net/url"

	"github.com/manifoldco/promptui"

	"github.com/spf13/viper"
)

type Environment string

const (
	INT  Environment = "int"
	QA   Environment = "qa"
	REG  Environment = "reg"
	UAT  Environment = "uat"
	PERF Environment = "perf"
	PROD Environment = "prod"
)

var AllEnviroments = []Environment{INT, QA, REG, UAT, PERF, PROD}
var pmEnvUrlMap = map[Environment]string{
	INT:  "https://paymentmanager-int-awpayment.aw.k8sw.dev.activenetwork.com/rest/",
	QA:   "https://paymentmanager-qa-awpayment.aw.k8sw.dev.activenetwork.com/rest/",
	REG:  "https://paymentmanager-reg-awpayment.aw.k8sw.dev.activenetwork.com/rest/",
	UAT:  "https://paymentmanager-uat-awpayment.aw.k8sw.dev.activenetwork.com/rest/",
	PERF: "https://paymentmanager-perf-awpayment.aw.k8sw.dev.activenetwork.com/rest/",
	PROD: "https://paymentmanager-prod-awpayment.aw.k8sw.dev.activenetwork.com/rest/",
}

func GetCurrentEnvPmAPIBaseURL() *url.URL {
	env := Environment(viper.GetString("env"))
	fmt.Println(env)
	return env.GetPmApiBaseURL()
}

func (e *Environment) GetPmApiBaseURL() *url.URL {
	rawUrl := pmEnvUrlMap[*e]
	parsedURL, err := url.Parse(rawUrl)
	if err != nil {
		panic(err)
	}
	return parsedURL
}

func SelectEnv(label string) Environment {
	prompt := promptui.Select{
		Label: label,
		Items: AllEnviroments,
	}

	_, result, err := prompt.Run()
	if err != nil {
		fmt.Printf("Prompt failed %v\n", err)
		panic(err)
	}
	return Environment(result)
}
