Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5047C107DDA
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Nov 2019 10:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbfKWJFo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 Nov 2019 04:05:44 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43910 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfKWJFn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 23 Nov 2019 04:05:43 -0500
Received: by mail-pg1-f195.google.com with SMTP id b1so4637726pgq.10
        for <linux-rtc@vger.kernel.org>; Sat, 23 Nov 2019 01:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zjmwKoFzrVaKe+wkRFkaDUQjqTWpTAr751TT7M6UiW4=;
        b=eZf0660y0uSh7QjGR5hy9x44SJfCUnuNWu1TaTH6tOTQqPHZ6DqdjyryaFJOa+5QTx
         3UgmXgzOilPeNWjBlnse3g0iDI0lT0MBA4sjWaLT0+7vBAQtnCH5++epteb9ip/6Q2m9
         7bcPeDdZfs3O1kZa8ovZHGiOrfTZ7nP1noiY+LnDR+zRDWuAWjeDn/t+8Cl0hAFfYK10
         aCWXGcyHOhqU0qoVjoVAFUhczu9snC/TK8uodUcGHzMw7r6U36m7KJgZSjBknPYIEYxx
         PWyEEhyb9/WqtioeL9c0Ukb/0REIGfiRLjKDLNpdj9RHLbU+z6c1V2exEdj0SNYHChPQ
         qasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zjmwKoFzrVaKe+wkRFkaDUQjqTWpTAr751TT7M6UiW4=;
        b=K9dcx9I2yD3xPnZPE4DRoSXwrbb0WG2dJfFEEsYkzmZMnix2Qf+yDq+pdR724alSuW
         kI8EKaliX86Ltp3tDc1lcd5ucBXfRLkAd6/0Ny9Jgb9OXNAC/eUCmkaEgnBcdUs+iT8q
         TVLCw6v8EYn3MMZhCEWSfi/Or7S2tpKCXsA1sEx8E5GA1ANvad2VkCW2tRBMoyykuS9O
         V1eJgwvnEj0gDbaO5+d6ROCNRHApqMH4TZQbAZaWk5diol7WnOCbxASDNKz9j7NwItlQ
         0QafSDQuL9x7hGbaGBOh3gVMW0fYuoGCSc+PdXeApjkG5o5Hqkzp/kVK0TRqzPoJyxDc
         c0hQ==
X-Gm-Message-State: APjAAAX0454ldMo5wIk8rtLcmfGGu5pWqNASPmvdF43hMT5UIiMW79UZ
        PslU+3xVdQbpjbryWU7/l78g
X-Google-Smtp-Source: APXvYqzIduQ6Dk+VAkUlo+anpwO68qIFBI95p5LdLFGqWhgoJc/qGzsnsFR0gYZqDoTSyLNJpNR2UQ==
X-Received: by 2002:a63:755c:: with SMTP id f28mr14807085pgn.341.1574499943234;
        Sat, 23 Nov 2019 01:05:43 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:e0b0:dddb:81ef:e64d])
        by smtp.gmail.com with ESMTPSA id u18sm686860pfn.183.2019.11.23.01.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2019 01:05:42 -0800 (PST)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
X-Google-Original-From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] rtc: sun6i: Remove struct device from sun6i_rtc_dev
Date:   Sat, 23 Nov 2019 18:05:38 +0900
Message-Id: <20191123090538.32364-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

struct device in struct sun6i_rtc_dev is not used, remove it.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-sun6i.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 5e2bd9f1d01ea..8dcd20b34dde3 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -136,7 +136,6 @@ struct sun6i_rtc_clk_data {
 
 struct sun6i_rtc_dev {
 	struct rtc_device *rtc;
-	struct device *dev;
 	const struct sun6i_rtc_clk_data *data;
 	void __iomem *base;
 	int irq;
@@ -669,7 +668,6 @@ static int sun6i_rtc_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	platform_set_drvdata(pdev, chip);
-	chip->dev = &pdev->dev;
 
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
-- 
2.24.0.rc1

