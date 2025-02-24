#!/usr/bin/env node
import inquirer from 'inquirer'

async function init() {
  const answers = await inquirer.prompt([
    { type: 'input', name: 'projectName', message: 'Enter project name:' },
    {
      type: 'list',
      name: 'environment',
      message: 'Select environment:',
      choices: ['staging', 'production'],
    },
  ])
  console.log(`Project: ${answers.projectName}`)
  console.log(`Environment: ${answers.environment}`)
}

init()
