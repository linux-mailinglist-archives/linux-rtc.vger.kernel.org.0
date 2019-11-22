Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3E81069E4
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2019 11:24:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfKVKYm (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Nov 2019 05:24:42 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:32875 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfKVKYm (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Nov 2019 05:24:42 -0500
X-Originating-IP: 92.184.97.94
Received: from localhost (unknown [92.184.97.94])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7143F1C0007;
        Fri, 22 Nov 2019 10:24:32 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 6/8] rtc: pm8xxx: update kerneldoc for struct pm8xxx_rtc
Date:   Fri, 22 Nov 2019 11:22:10 +0100
Message-Id: <20191122102212.400158-7-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191122102212.400158-1-alexandre.belloni@bootlin.com>
References: <20191122102212.400158-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The change from u8 ctrl_reg to const struct pm8xxx_rtc_regs *regs; did not
properly update the kerneldoc comment. Fixes:

drivers/rtc/rtc-pm8xxx.c:64: warning: Function parameter or member 'regs' not described in 'pm8xxx_rtc'

Fixes: c8d523a4b053 ("drivers/rtc/rtc-pm8xxx.c: rework to support pm8941 rtc")
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pm8xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index f5a30e0f16c2..07ea1be3abb9 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -49,7 +49,7 @@ struct pm8xxx_rtc_regs {
  * @regmap:		regmap used to access RTC registers
  * @allow_set_time:	indicates whether writing to the RTC is allowed
  * @rtc_alarm_irq:	rtc alarm irq number.
- * @ctrl_reg:		rtc control register.
+ * @regs:		rtc registers description.
  * @rtc_dev:		device structure.
  * @ctrl_reg_lock:	spinlock protecting access to ctrl_reg.
  */
-- 
2.23.0

