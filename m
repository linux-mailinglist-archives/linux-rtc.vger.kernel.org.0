Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FEBD43229A
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Oct 2021 17:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233207AbhJRPVv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Oct 2021 11:21:51 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:44047 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233109AbhJRPVv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Oct 2021 11:21:51 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 4FB1B240009;
        Mon, 18 Oct 2021 15:19:38 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] rtc: add alarm related features
Date:   Mon, 18 Oct 2021 17:19:27 +0200
Message-Id: <20211018151933.76865-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018151933.76865-1-alexandre.belloni@bootlin.com>
References: <20211018151933.76865-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Add more alarm related features to be declared by drivers.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 include/uapi/linux/rtc.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/rtc.h b/include/uapi/linux/rtc.h
index f950bff75e97..f4037c541925 100644
--- a/include/uapi/linux/rtc.h
+++ b/include/uapi/linux/rtc.h
@@ -114,7 +114,9 @@ struct rtc_pll_info {
 #define RTC_FEATURE_ALARM		0
 #define RTC_FEATURE_ALARM_RES_MINUTE	1
 #define RTC_FEATURE_NEED_WEEK_DAY	2
-#define RTC_FEATURE_CNT			3
+#define RTC_FEATURE_ALARM_RES_2S	3
+#define RTC_FEATURE_UPDATE_INTERRUPT	4
+#define RTC_FEATURE_CNT			5
 
 #define RTC_MAX_FREQ	8192
 
-- 
2.31.1

