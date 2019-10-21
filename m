Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A17ADE3F3
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 07:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfJUFlo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 01:41:44 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:39232 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbfJUFlo (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 21 Oct 2019 01:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=References:In-Reply-To:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=k74XBMQhZo+R8uuiXR5Y1ZY5y1k978WldpTVhlXoirk=; b=PdLQQrDwoljP1wHeL5jrEEAKT
        doqs8TOrDds2qI6QvwcpVTiy2HEbNdQAYjxl7toZkKVFu6n+idnoZoPuZCxdCm8E3BRjUvqTP3Xzf
        5j4Aw4D7yFLFs5S0s0SI+yVWxLqSL7Y2T+WYPTaO9OlT+S0cHBP6yMuuOburtPSNXQFUI=;
Received: from [77.247.85.102] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iMQRo-0002hK-9I; Mon, 21 Oct 2019 07:41:40 +0200
Received: from andi by localhost with local (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iMQRn-0006on-4z; Mon, 21 Oct 2019 07:41:39 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     lee.jones@linaro.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, phh@phh.me, b.galvani@gmail.com,
        stefan@agner.ch, letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 3/5] mfd: rn5t618: add rtc related registers
Date:   Mon, 21 Oct 2019 07:41:02 +0200
Message-Id: <20191021054104.26155-4-andreas@kemnade.info>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191021054104.26155-1-andreas@kemnade.info>
References: <20191021054104.26155-1-andreas@kemnade.info>
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
index 4d680f34ad2f..eb2ee7a776ab 100644
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
2.11.0

