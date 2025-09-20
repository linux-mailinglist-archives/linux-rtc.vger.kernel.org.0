Return-Path: <linux-rtc+bounces-5002-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA926B8CE27
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Sep 2025 19:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFFD41BC0C80
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Sep 2025 17:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C0D3101D2;
	Sat, 20 Sep 2025 17:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmvgxtUr"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54742EA75C
	for <linux-rtc@vger.kernel.org>; Sat, 20 Sep 2025 17:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758390155; cv=none; b=d05kPlb/84U3kOUkmwFk+HMWBmdWfbrpyWwHrLc6lHEmJVtqeqZVOd+DCm6T9OhuPkriiNmZ7Q2lUGItHoBu1XjYT/kM3N3jOjKcus0sO1FZAqdjkiFsph/HQd86/UyfZQmX7d3lgWvMNN9Ryif3/pHyXaI8Yz3d9f7niOstww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758390155; c=relaxed/simple;
	bh=RAQSJApfpP1ypl3NZf562NiE5XnU+hzrNqQWvKoiJPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SSHtdF1FBFBop7CEGZRoZJQpCF8iDuIEHogN+tr0AKZJl20BY3xRdXag2CyrN4YtKboVQKoH2YGXkBcXWMT0qmtK896MY5Pj3aIrvUCU8EnjZJ5Ec8NY9c5DA5VrIJecaN9s81NgtmrVdi57/0mm/aAMtgLgF8mxePZsRdoxryY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmvgxtUr; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-271d1305ad7so6146735ad.2
        for <linux-rtc@vger.kernel.org>; Sat, 20 Sep 2025 10:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758390153; x=1758994953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wSSCzYAllfZVWovAz8fE8y749DkdyjiFUD0mqKaQ7xM=;
        b=DmvgxtUr8ks0sVwTepQCbCCXbKGNezcFYcU838AeXAzkzi0VtIM6DJcLoXxaFhOHQ5
         GEh1OhLq/OfpZtIJIw8NdLEFTtoQdhKWWlOd2kXbchUdsEofc8EdwoQrpIxeUxKFNolG
         xbbOhOqbQ7h5C+RLHUb7nUAfZgFNSyoa9+92O1QLqyLt+mgqCo4mfXwkP2yJ4F5UHIy7
         39fQKP8fqNC17dnNeLRsZPcUxjr5PwMdY2hGsKW5UI33OUSXhj1unx1gUIInAY5VwGdf
         4mB2SirUqdsujQh9dapUOxQBWoMmDdwlq/M8bDMnBOnlDuKQBJjSgei59J+JL/UJwTHn
         y/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758390153; x=1758994953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSSCzYAllfZVWovAz8fE8y749DkdyjiFUD0mqKaQ7xM=;
        b=qemyFT2JJg/atcRwVGi4Vw5DL5aAu2OvbkHeq46w2YeULulyzt+T6g3rKHI2RDnC32
         PKM7RpQKY72Bm/YN/2vdUVW7a7aIs8xGdhQdrOFuL7nxnbQ7gYY56Ec+yAx3sMKEOvyz
         9MXOpi9HaVB6h1c++oMGAZjpxDJc3x5ZxZdQ7F0huuWbNpNN23FUcirgTcft8F0y5+3N
         meVGm9KHjqDPgj8YZVEqTnzSgn4QBiiomDuw+Bpe8b7bZRKseVzdTvYhDsf5lzxGmP6i
         Gmdk/rRwJnQkgsTVb6ZZUWXWmSMbN3bEbQx6ykkbQZr675Gyq6CddYyJWCD0aSuVfXDK
         iTwA==
X-Gm-Message-State: AOJu0YxSG9POVqZxCZnyUqX8yvPhhU0laxYgDkPSHilFuuOTqVkCe4hl
	3afxoDso+1rlmT4uSt7mGtyXgWKrz9+K8FeqMG1dNLeP6GBgXSDMmUEc
X-Gm-Gg: ASbGncsCzU+wnuwUyXRKhCTtkCmcVi8hTPP75LqBQn5+AI5Is1sJA1TKDfPY9d7XViH
	lXN1GdvZ+mZtYLlab1408eluNKfuYIn8UeZCOEHlRAp34t0Yc6rydgdudPIC4r+6ONh19GW39lu
	Gxs4xMtnRaeHzjjpyCGISnxXg9lYftvDnZ6sPFOVkz4SBfdMztazPaV8DOEkhLmVT7zCH2BA7Kz
	LDAQ6HNnSDQm3bLDwka6BrqGh+MQMacX2frNi69lvyHFoR0Ru2klfR0fc+fwc30AeNTticjhFpg
	1m/ktGFSEOE2nksFzJGK5SXhULruxDuPM/35wcr/9WXDTdnkQ86w7qh8mN894ZkWfvpawqPbkHi
	oJtINpVG3jZYr1EjT4Lh0QIri7siUVCqOUF/A4/s6rBqF2eDlELxp2UpWTRLzjdKvj69DUZx3n4
	DKr4M=
X-Google-Smtp-Source: AGHT+IH6GFLr86ytlJPjrA7tylx0p6RzKs3fGvhV4JpwcYZT+navTHrXD95VS9c+s2XWqM7yvy10NQ==
X-Received: by 2002:a17:903:90b:b0:263:b8f:77dd with SMTP id d9443c01a7336-269ba568cd3mr111143425ad.57.1758390152964;
        Sat, 20 Sep 2025 10:42:32 -0700 (PDT)
Received: from localhost.localdomain (118-169-88-29.dynamic-ip.hinet.net. [118.169.88.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800530a8sm88229095ad.5.2025.09.20.10.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 10:42:32 -0700 (PDT)
From: Nick Huang <sef1548@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kusogame68@gmail.com,
	byron.bbradley@gmail.com,
	Nick Huang <sef1548@gmail.com>
Subject: [PATCH] rtc: s35390a: use u8 instead of char for register buffer
Date: Sun, 21 Sep 2025 01:42:23 +0800
Message-ID: <20250920174224.108795-1-sef1548@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The register buffer in s35390a_get_reg() was previously defined as
`char *buf`. This is not ideal since register data represents raw
binary values rather than textual data.

Switch the type to `u8 *buf` to better reflect its intended usage and
to avoid potential issues with sign extension when handling register
values on platforms where `char` is signed by default.

This change improves type safety and makes the code consistent with
other RTC drivers that operate on raw register data.

Signed-off-by: Nick Huang <sef1548@gmail.com>
---
 drivers/rtc/rtc-s35390a.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index 3408d2ab27..07bd983b56 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -66,7 +66,7 @@ struct s35390a {
 	int twentyfourhour;
 };
 
-static int s35390a_set_reg(struct s35390a *s35390a, int reg, char *buf, int len)
+static int s35390a_set_reg(struct s35390a *s35390a, int reg, u8  *buf, int len)
 {
 	struct i2c_client *client = s35390a->client[reg];
 	struct i2c_msg msg[] = {
@@ -83,7 +83,7 @@ static int s35390a_set_reg(struct s35390a *s35390a, int reg, char *buf, int len)
 	return 0;
 }
 
-static int s35390a_get_reg(struct s35390a *s35390a, int reg, char *buf, int len)
+static int s35390a_get_reg(struct s35390a *s35390a, int reg, u8 *buf, int len)
 {
 	struct i2c_client *client = s35390a->client[reg];
 	struct i2c_msg msg[] = {
@@ -168,7 +168,7 @@ static int s35390a_read_status(struct s35390a *s35390a, char *status1)
 
 static int s35390a_disable_test_mode(struct s35390a *s35390a)
 {
-	char buf[1];
+	u8 buf[1];
 
 	if (s35390a_get_reg(s35390a, S35390A_CMD_STATUS2, buf, sizeof(buf)) < 0)
 		return -EIO;
@@ -210,7 +210,7 @@ static int s35390a_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct s35390a	*s35390a = i2c_get_clientdata(client);
 	int i;
-	char buf[7], status;
+	u8 buf[7], status;
 
 	dev_dbg(&client->dev, "%s: tm is secs=%d, mins=%d, hours=%d mday=%d, "
 		"mon=%d, year=%d, wday=%d\n", __func__, tm->tm_sec,
@@ -239,7 +239,7 @@ static int s35390a_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct s35390a *s35390a = i2c_get_clientdata(client);
-	char buf[7], status;
+	u8 buf[7], status;
 	int i, err;
 
 	if (s35390a_read_status(s35390a, &status) == 1)
@@ -273,7 +273,7 @@ static int s35390a_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct s35390a *s35390a = i2c_get_clientdata(client);
-	char buf[3], sts = 0;
+	u8 buf[3], sts = 0;
 	int err, i;
 
 	dev_dbg(&client->dev, "%s: alm is secs=%d, mins=%d, hours=%d mday=%d, "\
@@ -326,7 +326,7 @@ static int s35390a_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct s35390a *s35390a = i2c_get_clientdata(client);
-	char buf[3], sts;
+	u8 buf[3], sts;
 	int i, err;
 
 	err = s35390a_get_reg(s35390a, S35390A_CMD_STATUS2, &sts, sizeof(sts));
@@ -383,7 +383,7 @@ static int s35390a_rtc_ioctl(struct device *dev, unsigned int cmd,
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct s35390a *s35390a = i2c_get_clientdata(client);
-	char sts;
+	u8 sts;
 	int err;
 
 	switch (cmd) {
@@ -422,7 +422,7 @@ static int s35390a_probe(struct i2c_client *client)
 	unsigned int i;
 	struct s35390a *s35390a;
 	struct rtc_device *rtc;
-	char buf, status1;
+	u8 buf, status1;
 	struct device *dev = &client->dev;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
-- 
2.48.1


