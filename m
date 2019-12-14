Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88CF511F0C3
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Dec 2019 08:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbfLNHpi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 14 Dec 2019 02:45:38 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45635 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbfLNHpi (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 14 Dec 2019 02:45:38 -0500
Received: by mail-pg1-f195.google.com with SMTP id b9so649262pgk.12;
        Fri, 13 Dec 2019 23:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=171Md9ofEXhJtMsBZQ4ZGBIOthbQw6oHUQqRUHleNKs=;
        b=GtJYq8Yzqlzee8TSFmjnSSSYzBAe76dfgpqhoABAeo3g45uI22ppM5LP3lfoPBNz7O
         1CXDIQrq1gDrT1aXQTesoYKoeC+O23xK3jrjnxvd93k6rYGdLQCACmstPuBJDtxrDvbs
         KeM/nEn1qePXBiRDzgT9v7ZSOSCs9rSxb68ZkzHrcns2IB5KItNZYC8i2SggyCUfYJqj
         FkCHX6tdQ+NcN4LE2RnWcn0lTLG1AglOkx6mcysbZU+X0r8pvDCHtkbYXuL5U6xKaGvt
         MFoqueVVu1AALW18TnNenelqnaf7Nmk/djIja2e4tWZmjtrvX4G7CPNdxxvOrPbvPPyD
         kWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=171Md9ofEXhJtMsBZQ4ZGBIOthbQw6oHUQqRUHleNKs=;
        b=jjjUiBi6h/qWKIZHFkUSBOV4sUvuo7i3N7gY4cJx3Mit9WGgWw/ifPDq3ghWN5jRII
         6qhkefrue9BJyx2nsv3FB8g+zYX6xwckRCymA6Xy6drrbVzoqWd1qU3UUcaBFbGwzlZC
         G88dSUeEqp4poi4wchKszqAptOlQmxMffH/HuWoF3Ih0LyqtOafe2laDIfe6sgin6QUF
         KWXVxMlT9bxEtGswuetrlRXtxpWm22RgM/jk0WJlDeoan20HRcAnoXX1HAtBqKeCzO99
         j2NWZ5Y+fPhti5TzqbItlHuWBa94sFFGt1+QDeHpNBR8vtcjQsi/nvhiEjWwBQnG6TDQ
         Pe1w==
X-Gm-Message-State: APjAAAX37WtGHhoz/+xFwX6QFPvsaBHZhRIV9PgM/aaUKPE+tliLJC3j
        4X8FF2kbT9M/wsC88zsmi4S4mBcr
X-Google-Smtp-Source: APXvYqxMzG4nmo15Dkm5aQHzyMOFISYvZS2x0fDvsWvXeJbqm172b3UTx31qm1tEZJ9nfmBjG8xBjA==
X-Received: by 2002:a63:5f91:: with SMTP id t139mr4087513pgb.185.1576309537939;
        Fri, 13 Dec 2019 23:45:37 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id z14sm12577737pfg.57.2019.12.13.23.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 23:45:37 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] rtc: asm9260: add the missed check for devm_clk_get
Date:   Sat, 14 Dec 2019 15:45:28 +0800
Message-Id: <20191214074528.16806-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The driver misses a check for devm_clk_get().
Add the check to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/rtc/rtc-asm9260.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/rtc/rtc-asm9260.c b/drivers/rtc/rtc-asm9260.c
index 10064bdabdff..3ab81cdec00b 100644
--- a/drivers/rtc/rtc-asm9260.c
+++ b/drivers/rtc/rtc-asm9260.c
@@ -264,6 +264,9 @@ static int asm9260_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->iobase);
 
 	priv->clk = devm_clk_get(dev, "ahb");
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->clk);
+
 	ret = clk_prepare_enable(priv->clk);
 	if (ret) {
 		dev_err(dev, "Failed to enable clk!\n");
-- 
2.24.0

