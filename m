Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC2A812416D
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Dec 2019 09:16:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbfLRIQi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 18 Dec 2019 03:16:38 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41734 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbfLRIQh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 18 Dec 2019 03:16:37 -0500
Received: by mail-pf1-f193.google.com with SMTP id w62so786297pfw.8
        for <linux-rtc@vger.kernel.org>; Wed, 18 Dec 2019 00:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V/LZCELMK6pDMafofa6y/tuZCT7qg8lsOMPE/fk8gL0=;
        b=ZKCb7rNHDRglFa3hX/9uYWW99vIeqokOsfIsOtBlk+0ByU/DC9hRx570jDkiUdHBR5
         fyqSTFMhZT66OS1Ne1eUYq+l3pe+t2sZSwadoqHhwwiYBH2s2pWHniFWrFbLfZvk1pub
         T5SnSLQwg9ffcPb4BSWKrX206nQ8wRDAshuyGociG+JteXXuJIAloPisvZFwHh21zeF6
         atpT2Gk1pszL/0ncuqk6xOI+msagNIi0DzK2dWGEefjHcSTqYhpAcjjExKZrABDyY4lE
         cjX/228VucL6BuFkp1AAJzFReWf9vm98fQbbrqJ2zjIepcbLJGK5ZAA/P3Xcei3L3kgs
         /Fng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V/LZCELMK6pDMafofa6y/tuZCT7qg8lsOMPE/fk8gL0=;
        b=JLWWw0u5fLEptXS0wmOui3Oq27ozDw/fSTClOUpZEjpMR/149DEKBEdASrfeYbomyH
         2q43PWNv5PM8xNvUPHYrCXsdbUicT9jIZWxZQKDrlao9YsdeyRCDbx3eFdfs4vOu8vTd
         /2C93o+MoAoSqPieQ4zlrSBl/G+AtECXbv7satRh5eCu31tL2sY0NMW6GqPpFmd5Nsz1
         g+HdqJd49n1WFOVDYONdF1Iq0d7ikNmf0xL/JkqxolNY3may2tV10YHMGwVuKu1zXv/C
         Bk+yqG9MpywZ1p2vCj0YENlqmDPlUC0BocHu1GjY8HLpauDxlUeDitrOM1VHDGgrJBS6
         tNrg==
X-Gm-Message-State: APjAAAXzyjX0TxqKXdG9XER7CBpDuI3WgORUuBDg8cd/jCnSlgAC+0TE
        c0eJAV71FZ/Cy4jrGkiEgh3F5d8ypw==
X-Google-Smtp-Source: APXvYqwWsWlBhGhlvfRUC3ayjbsrWbx0ktln+8Oeau3C2jU2mNMLf7VUCrCyyWw/CGO1Gtq1ZYZvZw==
X-Received: by 2002:a63:774a:: with SMTP id s71mr1645492pgc.57.1576656996719;
        Wed, 18 Dec 2019 00:16:36 -0800 (PST)
Received: from localhost (om126208136186.22.openmobile.ne.jp. [126.208.136.186])
        by smtp.gmail.com with ESMTPSA id o10sm1846987pgq.68.2019.12.18.00.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 00:16:36 -0800 (PST)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     linux-rtc@vger.kernel.org
Cc:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wolfgang Grandegger <wg@grandegger.com>
Subject: [PATCH] rtc: rx8025: Remove struct i2c_client from struct rx8025_data
Date:   Wed, 18 Dec 2019 17:16:24 +0900
Message-Id: <20191218081624.3307752-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

struct i2c_client can be referenced from the device structure, so this
doesn't need to have it in struct rx8025_data.
Remove struct i2c_client from struct rx8025_data.

CC: Alessandro Zummo <a.zummo@towertech.it>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Wolfgang Grandegger <wg@grandegger.com>
Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-rx8025.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index b9bda10589e0d..a24f85893f90a 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -67,7 +67,6 @@ static const struct i2c_device_id rx8025_id[] = {
 MODULE_DEVICE_TABLE(i2c, rx8025_id);
 
 struct rx8025_data {
-	struct i2c_client *client;
 	struct rtc_device *rtc;
 	u8 ctrl1;
 };
@@ -103,10 +102,10 @@ static s32 rx8025_write_regs(const struct i2c_client *client,
 
 static int rx8025_check_validity(struct device *dev)
 {
-	struct rx8025_data *rx8025 = dev_get_drvdata(dev);
+	struct i2c_client *client = to_i2c_client(dev);
 	int ctrl2;
 
-	ctrl2 = rx8025_read_reg(rx8025->client, RX8025_REG_CTRL2);
+	ctrl2 = rx8025_read_reg(client, RX8025_REG_CTRL2);
 	if (ctrl2 < 0)
 		return ctrl2;
 
@@ -178,6 +177,7 @@ static irqreturn_t rx8025_handle_irq(int irq, void *dev_id)
 
 static int rx8025_get_time(struct device *dev, struct rtc_time *dt)
 {
+	struct i2c_client *client = to_i2c_client(dev);
 	struct rx8025_data *rx8025 = dev_get_drvdata(dev);
 	u8 date[7];
 	int err;
@@ -186,7 +186,7 @@ static int rx8025_get_time(struct device *dev, struct rtc_time *dt)
 	if (err)
 		return err;
 
-	err = rx8025_read_regs(rx8025->client, RX8025_REG_SEC, 7, date);
+	err = rx8025_read_regs(client, RX8025_REG_SEC, 7, date);
 	if (err)
 		return err;
 
@@ -211,6 +211,7 @@ static int rx8025_get_time(struct device *dev, struct rtc_time *dt)
 
 static int rx8025_set_time(struct device *dev, struct rtc_time *dt)
 {
+	struct i2c_client *client = to_i2c_client(dev);
 	struct rx8025_data *rx8025 = dev_get_drvdata(dev);
 	u8 date[7];
 	int ret;
@@ -237,11 +238,11 @@ static int rx8025_set_time(struct device *dev, struct rtc_time *dt)
 
 	dev_dbg(dev, "%s: write %7ph\n", __func__, date);
 
-	ret = rx8025_write_regs(rx8025->client, RX8025_REG_SEC, 7, date);
+	ret = rx8025_write_regs(client, RX8025_REG_SEC, 7, date);
 	if (ret < 0)
 		return ret;
 
-	return rx8025_reset_validity(rx8025->client);
+	return rx8025_reset_validity(client);
 }
 
 static int rx8025_init_client(struct i2c_client *client)
@@ -251,7 +252,7 @@ static int rx8025_init_client(struct i2c_client *client)
 	int need_clear = 0;
 	int err;
 
-	err = rx8025_read_regs(rx8025->client, RX8025_REG_CTRL1, 2, ctrl);
+	err = rx8025_read_regs(client, RX8025_REG_CTRL1, 2, ctrl);
 	if (err)
 		goto out;
 
@@ -280,8 +281,8 @@ static int rx8025_init_client(struct i2c_client *client)
 /* Alarm support */
 static int rx8025_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 {
+	struct i2c_client *client = to_i2c_client(dev);
 	struct rx8025_data *rx8025 = dev_get_drvdata(dev);
-	struct i2c_client *client = rx8025->client;
 	u8 ald[2];
 	int ctrl2, err;
 
@@ -347,18 +348,18 @@ static int rx8025_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 
 	if (rx8025->ctrl1 & RX8025_BIT_CTRL1_DALE) {
 		rx8025->ctrl1 &= ~RX8025_BIT_CTRL1_DALE;
-		err = rx8025_write_reg(rx8025->client, RX8025_REG_CTRL1,
+		err = rx8025_write_reg(client, RX8025_REG_CTRL1,
 				       rx8025->ctrl1);
 		if (err)
 			return err;
 	}
-	err = rx8025_write_regs(rx8025->client, RX8025_REG_ALDMIN, 2, ald);
+	err = rx8025_write_regs(client, RX8025_REG_ALDMIN, 2, ald);
 	if (err)
 		return err;
 
 	if (t->enabled) {
 		rx8025->ctrl1 |= RX8025_BIT_CTRL1_DALE;
-		err = rx8025_write_reg(rx8025->client, RX8025_REG_CTRL1,
+		err = rx8025_write_reg(client, RX8025_REG_CTRL1,
 				       rx8025->ctrl1);
 		if (err)
 			return err;
@@ -369,6 +370,7 @@ static int rx8025_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 
 static int rx8025_alarm_irq_enable(struct device *dev, unsigned int enabled)
 {
+	struct i2c_client *client = to_i2c_client(dev);
 	struct rx8025_data *rx8025 = dev_get_drvdata(dev);
 	u8 ctrl1;
 	int err;
@@ -381,7 +383,7 @@ static int rx8025_alarm_irq_enable(struct device *dev, unsigned int enabled)
 
 	if (ctrl1 != rx8025->ctrl1) {
 		rx8025->ctrl1 = ctrl1;
-		err = rx8025_write_reg(rx8025->client, RX8025_REG_CTRL1,
+		err = rx8025_write_reg(client, RX8025_REG_CTRL1,
 				       rx8025->ctrl1);
 		if (err)
 			return err;
@@ -516,7 +518,6 @@ static int rx8025_probe(struct i2c_client *client,
 	if (!rx8025)
 		return -ENOMEM;
 
-	rx8025->client = client;
 	i2c_set_clientdata(client, rx8025);
 
 	err = rx8025_init_client(client);
-- 
2.24.0

