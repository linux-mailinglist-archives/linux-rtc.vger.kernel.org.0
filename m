Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A21414E416
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Jan 2020 21:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbgA3Ufp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 30 Jan 2020 15:35:45 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46836 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727277AbgA3Ufp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 30 Jan 2020 15:35:45 -0500
Received: by mail-pl1-f195.google.com with SMTP id y8so1772089pll.13
        for <linux-rtc@vger.kernel.org>; Thu, 30 Jan 2020 12:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ldqIZ6sPhq//haR6JhuLeaz+UARJkR4FJ67lvvC/A2Y=;
        b=Ulucti+2qvuFC3vI4rNTAN/cJDWhE7oBYsz4wXAMUl1LItbzBv7fsrsGX97hK4cjlP
         jYF7i3PPDJGArgokJjNswcH0qJr1MP1VmFGswBvgu5ET7ZVobicNE6+rqyDjlpc/KnO6
         VEcuNXxY6M2OFVJIOY5pgCc8dPZuLRjEAd1Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ldqIZ6sPhq//haR6JhuLeaz+UARJkR4FJ67lvvC/A2Y=;
        b=dJYKxf7Xl76Zk5FGs8awFubqxwJ5iQvCFLnTLmZzDflgZ/sjOfQF89sV43eEh6ai81
         7iY3vrmSS1788S9/MFhLXGdaQ/ovFQTgGBAWKuRnJARIvr2CTHznFdHYBf4HyFfnfsAw
         KyA17ZPsfEETUVRFuJ7nnBziXKcuowS7m3zFDejuYcbt5Xd86XSGfw24rrUj/6fsTtkK
         kbflYjCNFeJy6fB8ROaNrifLMbr3axVMRQjPQLSMMycKSarKkay4AoOeV2U4Yq7IhVvr
         QBhq1/ahzBFg6R265f0XgxzQ5Z0+DG7tmEN9NsHbaVfQl2dlpuRcwFKa9L8dBdFQDMz1
         9gCQ==
X-Gm-Message-State: APjAAAXIWHzZaAWJmrmW19dPbWSG+9NCLQooZIP4JO1rnqAolvXbV3D1
        oqTH/Zu736K1KSj5SfoS9Gp6fw==
X-Google-Smtp-Source: APXvYqzsUims1gTPplV0R4QmmovDkeLvsAFQ+78ErasQirqavgYKt4DVmq4UrEpBdDxO7aO/jwEGgQ==
X-Received: by 2002:a17:90b:3109:: with SMTP id gc9mr8021528pjb.30.1580416544193;
        Thu, 30 Jan 2020 12:35:44 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:172e:4646:c089:ce59])
        by smtp.gmail.com with ESMTPSA id q12sm7469321pfh.158.2020.01.30.12.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 12:35:43 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM)
Subject: [PATCH 14/17] rtc: cros-ec: Use cros_ec_send_cmd_msg()
Date:   Thu, 30 Jan 2020 12:31:03 -0800
Message-Id: <20200130203106.201894-15-pmalani@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200130203106.201894-1-pmalani@chromium.org>
References: <20200130203106.201894-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Replace cros_ec_cmd_xfer_status() with cros_ec_send_cmd_msg() which does
the message buffer setup and cleanup.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/rtc/rtc-cros-ec.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index d043d30f05bc1d..113638a82e2c0c 100644
--- a/drivers/rtc/rtc-cros-ec.c
+++ b/drivers/rtc/rtc-cros-ec.c
@@ -34,16 +34,11 @@ static int cros_ec_rtc_get(struct cros_ec_device *cros_ec, u32 command,
 			   u32 *response)
 {
 	int ret;
-	struct {
-		struct cros_ec_command msg;
-		struct ec_response_rtc data;
-	} __packed msg;
 
-	memset(&msg, 0, sizeof(msg));
-	msg.msg.command = command;
-	msg.msg.insize = sizeof(msg.data);
+	struct ec_response_rtc data = {0};
 
-	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
+	ret = cros_ec_send_cmd_msg(cros_ec, 0, command, NULL, 0,
+				   &data, sizeof(data));
 	if (ret < 0) {
 		dev_err(cros_ec->dev,
 			"error getting %s from EC: %d\n",
@@ -52,7 +47,7 @@ static int cros_ec_rtc_get(struct cros_ec_device *cros_ec, u32 command,
 		return ret;
 	}
 
-	*response = msg.data.time;
+	*response = data.time;
 
 	return 0;
 }
@@ -61,17 +56,11 @@ static int cros_ec_rtc_set(struct cros_ec_device *cros_ec, u32 command,
 			   u32 param)
 {
 	int ret = 0;
-	struct {
-		struct cros_ec_command msg;
-		struct ec_response_rtc data;
-	} __packed msg;
+	struct ec_response_rtc  data;
 
-	memset(&msg, 0, sizeof(msg));
-	msg.msg.command = command;
-	msg.msg.outsize = sizeof(msg.data);
-	msg.data.time = param;
-
-	ret = cros_ec_cmd_xfer_status(cros_ec, &msg.msg);
+	data.time = param;
+	ret = cros_ec_send_cmd_msg(cros_ec, 0, command, &data, sizeof(data),
+				   NULL, 0);
 	if (ret < 0) {
 		dev_err(cros_ec->dev, "error setting %s on EC: %d\n",
 			command == EC_CMD_RTC_SET_VALUE ? "time" : "alarm",
-- 
2.25.0.341.g760bfbb309-goog

