#!/Users/seungjoonlee/git/learn-ansible/venv/bin/python

import json
import time
from ansible.module_utils.basic import AnsibleModule


def run_module():
    module_args = dict(
        msg=dict(type='str', required=True),
        log_path=dict(type='str', required=True)
    )

    module = AnsibleModule(
        argument_spec=module_args
    )

    output = {
        "changed": False
    }

    msg = module.params['msg']
    log_path = module.params['log_path']

    formatted_output = f"{time.strftime('%c')}: {msg}"
    f = open(log_path, "a")
    f.write(f"{formatted_output}\n")
    f.close()

    try:
        output = {
            "msg": formatted_output,
            "changed": True
        }
        module.exit_json(**output)
    except Exception as e:
        module.fail_json(msg=f"failed to write the message :{msg}", **output)

def main():
    run_module()

if __name__ == '__main__':
    main()
