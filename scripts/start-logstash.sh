#!/bin/bash

STATE_NAME=$(ctx node properties state_name)

salt-call state.sls $STATE_NAME