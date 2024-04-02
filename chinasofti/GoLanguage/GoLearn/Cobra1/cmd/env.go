/*
Copyright © 2024 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"ray.com/GoLean/Cobra1/cmd/env"
)

// envCmd represents the env command
var envCmd = &cobra.Command{
	Use:   "env",
	Short: "A brief description of your command",
	Long: `A longer description that spans multiple lines and likely contains examples
and usage of using your command. For example:
Cobra is a CLI library for Go that empowers applications.
This application is a tool to generate the needed files
to quickly create a Cobra application.`,
	Run: func(cmd *cobra.Command, args []string) {
		selectEnv := env.SelectEnv("Choose a support enviroment")
		viper.Set("env", selectEnv)
		_ = viper.WriteConfig()
	},
}

func init() {
	addSubCommand()
	rootCmd.AddCommand(envCmd)
}

func addSubCommand() {
	envCmd.AddCommand(env.ShowEnvCmd)
}
