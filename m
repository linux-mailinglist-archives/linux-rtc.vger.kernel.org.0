Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50487107DDB
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Nov 2019 10:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbfKWJIn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 Nov 2019 04:08:43 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36680 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbfKWJIm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 23 Nov 2019 04:08:42 -0500
Received: by mail-pf1-f195.google.com with SMTP id b19so4862559pfd.3
        for <linux-rtc@vger.kernel.org>; Sat, 23 Nov 2019 01:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5nPeKeaZRF3Y180HBD3QXO2jryP/z0opWsoqcga9ixo=;
        b=givem6XrKl2I63K6h4uBza5NfNn34Pxf8XwpMJHURVGa9V9Ih61urqlS/fFk0k5Mxe
         vxjYYagDBEl63UGVyY0NblWbHsL72UPHGqAKhCjdB/yMmQw+ebvjSuVeQjt1c7O/JQd/
         ZH1Ygi0PDWEvgXWgvv1tKy8PHqpYYD/uvys7WxSxcgectk+diEspPWhWyBKfBtOngjNA
         UEuvoTZ/fT18eZZee/FG/GpN3AZ+aKwILyaPhejIqpSr33dVcinzptN/iFsQBK7dpyiF
         XqVWxGbKAUKVLz86jvK1WTxM2em+ZhVZX2vJ2HM/2w6pefXAP5/atbOTNyx4jZk9ju4h
         J+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5nPeKeaZRF3Y180HBD3QXO2jryP/z0opWsoqcga9ixo=;
        b=sFL+h0fnJ6hohRHLq6Pyw3h3WxxxcxlLTOuieLeW5BbtYua7zKXlBscL+q2JBpsTUG
         BnMou2Yec61Tr0fXjtzSqne083ghBa3morWjo5knvbH5T5od3F/iXjFeX4iTGUIJp+dk
         OS4u7dTzsC+kVbeqr9GwW05QvlsX9VO3kWztxpNi+rrlVdnUKZeci7ReRqGkdXYo7KX8
         5jq473CAUvXfcWG0cmpPdcG+Buf5d9TTupwuwf3wuKOsxOTSrKMS7hBEvbRl4jcyW+5A
         QhIJSwL/ZCfLCx29foafxiWnJAUxmsTIy77dwPKzhFPzBgDPzJssNhSEoARwjwaHIasu
         7kZw==
X-Gm-Message-State: APjAAAVZHoQcpU7p/wvyQD/29DjLbllyR8t6A8y87F1+/UtAaH21ZcW4
        JrUg3OmogPjE3ne+Xfn0j6ZqxOG/bg==
X-Google-Smtp-Source: APXvYqzB+tI7iS04G8E3lvGnrJKzk2p4trJUTEyOEYg+L77QEN49104gmW1UGNLl1fw8+16RM06nKg==
X-Received: by 2002:a63:e4a:: with SMTP id 10mr18468305pgo.121.1574500121927;
        Sat, 23 Nov 2019 01:08:41 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:e0b0:dddb:81ef:e64d])
        by smtp.gmail.com with ESMTPSA id a19sm764390pfn.144.2019.11.23.01.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2019 01:08:41 -0800 (PST)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
X-Google-Original-From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, thierry.reding@avionic-design.de,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] rtc: pcf8523: Remove struct pcf8523
Date:   Sat, 23 Nov 2019 18:08:38 +0900
Message-Id: <20191123090838.1619-1-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

struct pcf8523 is referenced only by pcf8523_probe(). And member variable in
this is not referenced by any function. Remove struct pcf8523.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-pcf8523.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index ada1c21ef3faf..48d938e4feafd 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -35,10 +35,6 @@
 #define REG_OFFSET   0x0e
 #define REG_OFFSET_MODE BIT(7)
 
-struct pcf8523 {
-	struct rtc_device *rtc;
-};
-
 static int pcf8523_read(struct i2c_client *client, u8 reg, u8 *valuep)
 {
 	struct i2c_msg msgs[2];
@@ -345,16 +341,12 @@ static const struct rtc_class_ops pcf8523_rtc_ops = {
 static int pcf8523_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
-	struct pcf8523 *pcf;
+	struct rtc_device *rtc;
 	int err;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -ENODEV;
 
-	pcf = devm_kzalloc(&client->dev, sizeof(*pcf), GFP_KERNEL);
-	if (!pcf)
-		return -ENOMEM;
-
 	err = pcf8523_load_capacitance(client);
 	if (err < 0)
 		dev_warn(&client->dev, "failed to set xtal load capacitance: %d",
@@ -364,12 +356,10 @@ static int pcf8523_probe(struct i2c_client *client,
 	if (err < 0)
 		return err;
 
-	pcf->rtc = devm_rtc_device_register(&client->dev, DRIVER_NAME,
+	rtc = devm_rtc_device_register(&client->dev, DRIVER_NAME,
 				       &pcf8523_rtc_ops, THIS_MODULE);
-	if (IS_ERR(pcf->rtc))
-		return PTR_ERR(pcf->rtc);
-
-	i2c_set_clientdata(client, pcf);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
 	return 0;
 }
-- 
2.24.0.rc1

