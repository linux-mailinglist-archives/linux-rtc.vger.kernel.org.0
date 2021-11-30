Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DEB1463503
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Nov 2021 13:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbhK3NCZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Nov 2021 08:02:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbhK3NCW (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Nov 2021 08:02:22 -0500
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0846DC061574;
        Tue, 30 Nov 2021 04:59:02 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id 70so13504390vkx.7;
        Tue, 30 Nov 2021 04:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7eybnsDg7wBXEVC+0fnHnHq01RFd44IK/DduaEmP+Sc=;
        b=Pp2dv3ij7s3Ac/IHzAFULShVGarzukm5R9jJuaDa0Z+n1hLs3MfLbRfFwdq/jSvOWn
         0Yog2H6PxEfTY4zBiATACk8rhBAsaKMZ68xrUDm7AxZhxc0AWeHE9VYeiQkXn/eFy9KY
         I7Gp3UIccYfHSsquL4Iez+Yp8Bak3WOPB1UNAl8CYI84d3NcxC0j9R9v0sBA6JoooAc7
         Que1aUT67ageAE++q/cxrB/qzQ6qysP8n0g6upyMuz5IwHzbCp3NNHCsj3J2Th5NHdeS
         qaxkjLWM+t4yuZO3L3HyX5aQONFA5EcAu5Wrj6cxhOrJX+72bDFj9rtHAzRYg0cZm988
         HO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7eybnsDg7wBXEVC+0fnHnHq01RFd44IK/DduaEmP+Sc=;
        b=drNNtxWVeGmRisRgWVPBgeH1mXeV1alcmaTfsz457B3IC8xkOiQHxjT9rklX+Kq5jY
         RyhY7ODHaapv9lTK6BYlH3K8DsrtpwIUQWJGM8k+fd53UvwWIsGY0qHZ4w5wl7/408cx
         HswEy6eSYhAw/XoGk+SOmhbZyKBqc0DQ1Zk0H54rSK9hDmeoz0keZRi7C0j70c5GGK7L
         wZ26ZtbLcghKwVEUfqqSDhjo0/5o8XFneEFXJG/anXwmagGKRPZjsFY3hCHuZVV46L1J
         jvfjJe+R7Od1UpexOm2veMYpoL4t7aAwiOKC7gcIDJseL2+9C/C99VGb7yf6B3HJuazI
         zskg==
X-Gm-Message-State: AOAM531ll5VRx8ZVA+0lGK++UQEIbElxVYFS1/eOGYqwR3jV0npT96F5
        psTrRRLKkk4VmLjBm3muCt0=
X-Google-Smtp-Source: ABdhPJz6YfnyoRKlVLGUkaiFvcvcijtGNsP6I2SBXO/YV7reF4PuNEnim/DaKUS/XPdQRya4U2f/TQ==
X-Received: by 2002:a1f:a08c:: with SMTP id j134mr39268831vke.35.1638277140156;
        Tue, 30 Nov 2021 04:59:00 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:eba2:106:255b:d69c])
        by smtp.gmail.com with ESMTPSA id x9sm10008031vkn.36.2021.11.30.04.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 04:59:00 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     robh+dt@kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, otavio@ossystems.com.br,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2 RESEND] rtc: rv8803: Add support for the Epson RX8804 RTC
Date:   Tue, 30 Nov 2021 09:58:30 -0300
Message-Id: <20211130125830.1166194-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130125830.1166194-1-festevam@gmail.com>
References: <20211130125830.1166194-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The Epson RX8804 RTC has the same programming model as RV8803.

Add support for it in the driver.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
---
 drivers/rtc/rtc-rv8803.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
index 0d5ed38bf60c..f69e0b1137cd 100644
--- a/drivers/rtc/rtc-rv8803.c
+++ b/drivers/rtc/rtc-rv8803.c
@@ -55,6 +55,7 @@
 
 enum rv8803_type {
 	rv_8803,
+	rx_8804,
 	rx_8900
 };
 
@@ -601,6 +602,7 @@ static int rv8803_probe(struct i2c_client *client,
 
 static const struct i2c_device_id rv8803_id[] = {
 	{ "rv8803", rv_8803 },
+	{ "rv8804", rx_8804 },
 	{ "rx8803", rv_8803 },
 	{ "rx8900", rx_8900 },
 	{ }
@@ -616,6 +618,10 @@ static const __maybe_unused struct of_device_id rv8803_of_match[] = {
 		.compatible = "epson,rx8803",
 		.data = (void *)rv_8803
 	},
+	{
+		.compatible = "epson,rx8804",
+		.data = (void *)rx_8804
+	},
 	{
 		.compatible = "epson,rx8900",
 		.data = (void *)rx_8900
-- 
2.25.1

