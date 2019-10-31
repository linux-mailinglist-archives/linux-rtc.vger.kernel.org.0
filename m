Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92BFEEB91D
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2019 22:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729950AbfJaVir (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 31 Oct 2019 17:38:47 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:48570 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729000AbfJaVir (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 31 Oct 2019 17:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=MTH/rtGOZowYp/PPfx3AuvCkF0uVwZsmD23YnUBpLLw=; b=WvFtqDPjiRmD8DbIgFLrqdQxuD
        yqjrPUxdUZTrZn6jhcGDACKld14Oe7m7sv94UNoaL4vIFdzygro4JseCk7ByWGct/SsywkIPdk9xo
        cK4XE7PY0mMNP6FkhAaHdZcxFyzk1PyaVgVTumJmGLhmZ32fT3NytA1xAvQ6loGcfTyY=;
Received: from p200300ccff0b24001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:2400:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iQI9T-0005lh-Ue; Thu, 31 Oct 2019 22:38:44 +0100
Received: from andi by aktux with local (Exim 4.92)
        (envelope-from <andreas@kemnade.info>)
        id 1iQI9T-00030A-LK; Thu, 31 Oct 2019 22:38:43 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, phh@phh.me, b.galvani@gmail.com,
        stefan@agner.ch, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 3/5] mfd: rn5t618: add rtc related registers
Date:   Thu, 31 Oct 2019 22:38:33 +0100
Message-Id: <20191031213835.11390-4-andreas@kemnade.info>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191031213835.11390-1-andreas@kemnade.info>
References: <20191031213835.11390-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Defines for some rtc related registers were missing, also
they were not included in the volatile register list

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 drivers/mfd/rn5t618-core.c  |  2 ++
 include/linux/mfd/rn5t618.h | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/mfd/rn5t618-core.c b/drivers/mfd/rn5t618-core.c
index d4ed2865ed8b..0e3ec9dafb40 100644
--- a/drivers/mfd/rn5t618-core.c
+++ b/drivers/mfd/rn5t618-core.c
@@ -32,6 +32,8 @@ static bool rn5t618_volatile_reg(struct device *dev, unsigned int reg)
 	case RN5T618_IR_GPF:
 	case RN5T618_MON_IOIN:
 	case RN5T618_INTMON:
+	case RN5T618_RTC_CTRL1 ... RN5T618_RTC_CTRL2:
+	case RN5T618_RTC_SECONDS ... RN5T618_RTC_YEAR:
 		return true;
 	default:
 		return false;
diff --git a/include/linux/mfd/rn5t618.h b/include/linux/mfd/rn5t618.h
index edd2b6485e3b..26c36b58916c 100644
--- a/include/linux/mfd/rn5t618.h
+++ b/include/linux/mfd/rn5t618.h
@@ -139,6 +139,17 @@
 #define RN5T618_INTPOL			0x9c
 #define RN5T618_INTEN			0x9d
 #define RN5T618_INTMON			0x9e
+
+#define RN5T618_RTC_SECONDS     0xA0
+#define RN5T618_RTC_MDAY        0xA4
+#define RN5T618_RTC_MONTH       0xA5
+#define RN5T618_RTC_YEAR        0xA6
+#define RN5T618_RTC_ADJUST      0xA7
+#define RN5T618_RTC_ALARM_Y_SEC 0xA8
+#define RN5T618_RTC_DAL_MONTH   0xAC
+#define RN5T618_RTC_CTRL1       0xAE
+#define RN5T618_RTC_CTRL2       0xAF
+
 #define RN5T618_PREVINDAC		0xb0
 #define RN5T618_BATDAC			0xb1
 #define RN5T618_CHGCTL1			0xb3
-- 
2.20.1

