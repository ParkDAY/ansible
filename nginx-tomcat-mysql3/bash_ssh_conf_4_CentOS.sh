#! /usr/bin/env bash

now=$(date +"%m_%d_%Y")
cp /etc/ssh/sshd_config /etc/ssh/sshd_config_$now.backup

# 이 명령어는 SSH 설정 파일인 sshd_config을 현재 날짜가 포함된 파일명으로 백업하는 작업을 수행합니다

# now=$(date +"%m_%d_%Y"): 현재 날짜를 월_일_연도 형식으로 변수 now에 저장합니다. 
# 예를 들어, 2024년 9월 20일이라면 now에는 09_20_2024가 저장됩니다.

# cp /etc/ssh/sshd_config /etc/ssh/sshd_config_$now.backup:

# cp 명령어는 파일을 복사하는 명령입니다.
# /etc/ssh/sshd_config: 원본 SSH 설정 파일의 경로입니다.
# /etc/ssh/sshd_config_$now.backup: 백업 파일을 저장할 경로 및 이름입니다. 
# $now 변수에 저장된 날짜가 파일명에 포함되기 때문에, 예를 들어 sshd_config_09_20_2024.backup와 
# 같은 이름으로 백업 파일이 생성됩니다.
# 결과적으로, 이 명령어는 SSH 설정 파일을 백업하면서 파일명에 현재 날짜를 포함시켜 
# 쉽게 식별할 수 있도록 합니다











sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
# SSH 서버의 설정 파일인 sshd_config에서 "PasswordAuthentication no"
# 라는 구문을 찾아 "PasswordAuthentication yes"로 변경하는 역할을 합니다.
# sed: 스트림 편집기(텍스트 파일을 수정하는 도구)입니다.
# -i: 파일을 직접 수정하겠다는 옵션입니다.
# -e: 표현식을 사용하겠다는 옵션입니다.
# s/old/new/g: old 문자열을 new 문자열로 모두(global) 바꾸겠다는 의미입니다.
# /etc/ssh/sshd_config: 수정할 파일의 경로입니다.
# 결과적으로 이 명령어는 SSH를 통해 비밀번호 인증을 활성화하여, 사용자가 SSH로 서버에 접속할 때 
# 비밀번호로 인증할 수 있도록 설정하는 것입니다.

systemctl restart sshd
