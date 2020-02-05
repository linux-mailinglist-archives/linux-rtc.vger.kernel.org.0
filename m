Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B94A1538DF
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2020 20:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgBETSb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 5 Feb 2020 14:18:31 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37061 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbgBETSb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 5 Feb 2020 14:18:31 -0500
Received: by mail-pf1-f195.google.com with SMTP id p14so1710707pfn.4
        for <linux-rtc@vger.kernel.org>; Wed, 05 Feb 2020 11:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sIFpMqGTN8n/WcYKnxRJgbTze8DyNUUZFg70ZbIEoWI=;
        b=XVhusW/LvjaHg45v8IC8C/sf8nqOfxR/MgkOe7tWcZ5rqexAZOw27w9omEU3kFoUj6
         yamxpa+X3Qf/Y83drLrOSbaZi9LWIMQ/xdlM/FSgeH4NeH9nWr22UZeNxVXs4MiFQn4r
         kQBI3IEUXAtTCaW+1u8wHXwiChhvk5AEdmq+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sIFpMqGTN8n/WcYKnxRJgbTze8DyNUUZFg70ZbIEoWI=;
        b=aE745b/7zWi8k3NcwF+vJ2ZdqCZQBCIkK499o/XVEoZPJfBlAbiynX09eUSQKi5ZYV
         LinzkaSmwMVA0m6mIYnWdpV2UXDiUwZXAoh53S385DO0T3aBXLyCk86g/akrmDiCyQq6
         PWkdHtWnxO3ar3zwUDMJzxD6QjiKbAt69wG+IGteoYKigzNpaK7ylJNO0ko/GPGfRaer
         LAAp0gjRTAn5voOybgPC8k0wcFObXYD7z4eRLN6N+/CdjggFntQlPYJR7GOa+eussd96
         jRfdlR81d0jKOqcwyphDjNVUWulwCCB4krYFs/eVb3D3ZHsL+bib/eYACC+qgDdRRex6
         uc3A==
X-Gm-Message-State: APjAAAVujMYPoZad+hx//Fl6s8r8GhnCel450dWX06kXvXhWwgRugV3x
        yMljzGXJrKbgmmf4iMrbVyJGy+bEyAY=
X-Google-Smtp-Source: APXvYqxPpI/egGs5VfP1lfsj8LKYY+ZuiZR7QWRXekYLGdP4+g4jIec04hsk/l1nke1QrQ2mtlwzIQ==
X-Received: by 2002:a63:7b5a:: with SMTP id k26mr16144682pgn.406.1580930310289;
        Wed, 05 Feb 2020 11:18:30 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:172e:4646:c089:ce59])
        by smtp.gmail.com with ESMTPSA id u23sm257224pfm.29.2020.02.05.11.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 11:18:29 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM)
Subject: [PATCH v2 14/17] rtc: cros-ec: Use cros_ec_cmd()
Date:   Wed,  5 Feb 2020 11:00:22 -0800
Message-Id: <20200205190028.183069-15-pmalani@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200205190028.183069-1-pmalani@chromium.org>
References: <20200205190028.183069-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Replace cros_ec_cmd_xfer_status() with cros_ec_cmd() which does the
message buffer setup and cleanup.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes in v2:
- Updated to use new function name and parameter list.

 drivers/rtc/rtc-cros-ec.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index f7343c289cab73..6886100ad0b8b7 100644
--- a/drivers/rtc/rtc-cros-ec.c
+++ b/drivers/rtc/rtc-cros-ec.c
@@ -33,16 +33,11 @@ static int cros_ec_rtc_get(struct cros_ec_device *cros_ec, u32 command,
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
+	ret = cros_ec_cmd(cros_ec, 0, command, NULL, 0, &data, sizeof(data),
+			  NULL);
 	if (ret < 0) {
 		dev_err(cros_ec->dev,
 			"error getting %s from EC: %d\n",
@@ -51,7 +46,7 @@ static int cros_ec_rtc_get(struct cros_ec_device *cros_ec, u32 command,
 		return ret;
 	}
 
-	*response = msg.data.time;
+	*response = data.time;
 
 	return 0;
 }
@@ -60,17 +55,11 @@ static int cros_ec_rtc_set(struct cros_ec_device *cros_ec, u32 command,
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
+	ret = cros_ec_cmd(cros_ec, 0, command, &data, sizeof(data), NULL, 0,
+			  NULL);
 	if (ret < 0) {
 		dev_err(cros_ec->dev, "error setting %s on EC: %d\n",
 			command == EC_CMD_RTC_SET_VALUE ? "time" : "alarm",
-- 
2.25.0.341.g760bfbb309-goog

