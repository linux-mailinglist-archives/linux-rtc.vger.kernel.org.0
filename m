Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E16642FBE7
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Oct 2021 21:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241928AbhJOTXe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Oct 2021 15:23:34 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:44281 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242578AbhJOTXe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Oct 2021 15:23:34 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 257CCC0002;
        Fri, 15 Oct 2021 19:21:26 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] rtc: add alarm related features
Date:   Fri, 15 Oct 2021 21:21:14 +0200
Message-Id: <20211015192121.817642-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015192121.817642-1-alexandre.belloni@bootlin.com>
References: <20211015192121.817642-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Correct and add alarm related features to be declared by drivers.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 include/uapi/linux/rtc.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/rtc.h b/include/uapi/linux/rtc.h
index f950bff75e97..60ea711b1843 100644
--- a/include/uapi/linux/rtc.h
+++ b/include/uapi/linux/rtc.h
@@ -113,8 +113,10 @@ struct rtc_pll_info {
 /* feature list */
 #define RTC_FEATURE_ALARM		0
 #define RTC_FEATURE_ALARM_RES_MINUTE	1
-#define RTC_FEATURE_NEED_WEEK_DAY	2
-#define RTC_FEATURE_CNT			3
+#define RTC_FEATURE_ALARM_RES_2S	2
+#define RTC_FEATURE_UPDATE_INTERRUPT	3
+#define RTC_FEATURE_NEED_WEEK_DAY	4
+#define RTC_FEATURE_CNT			5
 
 #define RTC_MAX_FREQ	8192
 
-- 
2.31.1

