Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06D3113EC73
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Jan 2020 18:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394539AbgAPR4u (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 16 Jan 2020 12:56:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:34130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393983AbgAPRnp (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 16 Jan 2020 12:43:45 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5412124718;
        Thu, 16 Jan 2020 17:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579196625;
        bh=98beNfV0hie/L+0Qn0HzOYwCS5/+cPSO2gow27zvHbo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j1IDDAmEj3kEi4FvZ7YpARIpCy0Gns6DIlwck4qSS/3Xwuu1zpLCMlrjTj90xuUhy
         dLOgJczjs9TX0QvaWIPs0QrhEitKJCBBXK6/tbYP6yJLHSGLRqZZD5oFbjy/Y66hrD
         uIMPtdWPoeQYZOSoaNLN1Fd1KJnzw2zM/Jgfyz8Q=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Colin Ian King <colin.king@canonical.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sasha Levin <sashal@kernel.org>, linux-rtc@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 040/174] rtc: pm8xxx: fix unintended sign extension
Date:   Thu, 16 Jan 2020 12:40:37 -0500
Message-Id: <20200116174251.24326-40-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116174251.24326-1-sashal@kernel.org>
References: <20200116174251.24326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit e42280886018c6f77f0a90190f7cba344b0df3e0 ]

Shifting a u8 by 24 will cause the value to be promoted to an integer. If
the top bit of the u8 is set then the following conversion to an unsigned
long will sign extend the value causing the upper 32 bits to be set in
the result.

Fix this by casting the u8 value to an unsigned long before the shift.

Detected by CoverityScan, CID#1309693 ("Unintended sign extension")

Fixes: 9a9a54ad7aa2 ("drivers/rtc: add support for Qualcomm PMIC8xxx RTC")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/rtc/rtc-pm8xxx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index 795fcbd02ea3..a0dae6271ff6 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -186,7 +186,8 @@ static int pm8xxx_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		}
 	}
 
-	secs = value[0] | (value[1] << 8) | (value[2] << 16) | (value[3] << 24);
+	secs = value[0] | (value[1] << 8) | (value[2] << 16) |
+	       ((unsigned long)value[3] << 24);
 
 	rtc_time_to_tm(secs, tm);
 
@@ -267,7 +268,8 @@ static int pm8xxx_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 		return rc;
 	}
 
-	secs = value[0] | (value[1] << 8) | (value[2] << 16) | (value[3] << 24);
+	secs = value[0] | (value[1] << 8) | (value[2] << 16) |
+	       ((unsigned long)value[3] << 24);
 
 	rtc_time_to_tm(secs, &alarm->time);
 
-- 
2.20.1

