Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A993342EF6B
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 13:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233034AbhJOLO3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Oct 2021 07:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhJOLO1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 07:14:27 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6FCAC061570
        for <linux-rtc@vger.kernel.org>; Fri, 15 Oct 2021 04:12:20 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id u18so25989404wrg.5
        for <linux-rtc@vger.kernel.org>; Fri, 15 Oct 2021 04:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TN5tAyN8j8rWJ17cXA0EevDLE3MR9amtnzn88LcMl/o=;
        b=fHGUCkJMHSdMUqxhh/4GNEQgLGITuTKQEeXkduLPdwZRxvEygeNZcEPzIeKMENHhVS
         S6eqJ3hsvzXd5UDuBDgbdGQWBlb5GY1PCg8S4j5XuGo+oPYlvUssf9Wg7YtEXJcfsf7O
         1GXollW07kGPSKhU4BK2gl4wq97u0xRQAiYe3026VZO5/5CZNZ15aoJD2BOvdg9rZjpL
         3dR3/qt2lJbyHRyduYfdH3H2Nj55BxcLvyCNS3+ZtVsiVluPLgv/haUjGfPoYQih5k2B
         /4BbKwZwJfpf4nV0XsNojJ60059RvcSxgib7xXPduKEIHISjNcPHZN9kxNX4xF13vbvZ
         4/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TN5tAyN8j8rWJ17cXA0EevDLE3MR9amtnzn88LcMl/o=;
        b=t7IK6+Ey7Jr1cGYnj1pYKWyiqEkmuqq2vo8JXN+QvX7geVfiAb/DqbNyXp3i7IOJNg
         wI5T/EzSsU8h4qIsJ5octmqhhsfF3GfHNRdRrLcYGpr7MYAWmYZV/qabfXlhE9zEao1u
         3MSlAHUO6LUFWcJwh0m6/bvhoCVLcXiyjbVgsmLvarwKBD8m9HXK4pBXYyz6mD+6qnhh
         j+KAC7OWLE6hMaKVIVCoZqI/C4w4JHZoISE4P5uSopp37na280tzjh3XEsJF3A+mX55g
         Oac3Xy26XbHzm8euab2c0WgqMEcfmkeiRiKvUFvCJaOHyGCk7xtu73h0k+EEzFwnIQaP
         ulDA==
X-Gm-Message-State: AOAM532o3fzPQN1hmVYfNIFvBLNvgml+n2XU3u0xB2ABZDIbtuumjsnZ
        bWTPOqkG9E97mpN8mJXko5N7vg==
X-Google-Smtp-Source: ABdhPJyXnpCSnOA82kRFwfKktHkS4KbWk6ZklEDrVOJ37Z7gEYggT4jR56fIYXGqwmRn7T6EUCjzAw==
X-Received: by 2002:adf:f309:: with SMTP id i9mr13770705wro.256.1634296339376;
        Fri, 15 Oct 2021 04:12:19 -0700 (PDT)
Received: from buildbot.pitowers.org ([2a00:1098:3142:14:ae1f:6bff:fedd:de54])
        by smtp.gmail.com with ESMTPSA id k17sm4741621wrq.7.2021.10.15.04.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 04:12:19 -0700 (PDT)
From:   Phil Elwell <phil@raspberrypi.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     Phil Elwell <phil@raspberrypi.com>
Subject: [PATCH] rtc: pcf85063: Always clear EXT_TEST from set_time
Date:   Fri, 15 Oct 2021 12:12:08 +0100
Message-Id: <20211015111208.1757110-1-phil@raspberrypi.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Power-on reset after the insertion of a battery does not always complete
successfully, leading to corrupted register content. The EXT_TEST bit
will stop the clock from running, but currently the driver will never
recover.

Safely handle the erroneous state by clearing EXT_TEST as part of the
usual set_time method.

Signed-off-by: Phil Elwell <phil@raspberrypi.com>
---
 drivers/rtc/rtc-pcf85063.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 14da4ab30104..ea75b71a1f16 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -34,6 +34,7 @@
 #define PCF85063_REG_CTRL1		0x00 /* status */
 #define PCF85063_REG_CTRL1_CAP_SEL	BIT(0)
 #define PCF85063_REG_CTRL1_STOP		BIT(5)
+#define PCF85063_REG_CTRL1_EXT_TEST	BIT(7)
 
 #define PCF85063_REG_CTRL2		0x01
 #define PCF85063_CTRL2_AF		BIT(6)
@@ -117,6 +118,7 @@ static int pcf85063_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	 * reset state until all time/date registers are written
 	 */
 	rc = regmap_update_bits(pcf85063->regmap, PCF85063_REG_CTRL1,
+				PCF85063_REG_CTRL1_EXT_TEST |
 				PCF85063_REG_CTRL1_STOP,
 				PCF85063_REG_CTRL1_STOP);
 	if (rc)
-- 
2.25.1

