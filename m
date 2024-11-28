Return-Path: <linux-rtc+bounces-2642-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D6E9DB2F7
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Nov 2024 08:02:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F21B216454A
	for <lists+linux-rtc@lfdr.de>; Thu, 28 Nov 2024 07:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD24145038;
	Thu, 28 Nov 2024 07:02:35 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B60317C7C;
	Thu, 28 Nov 2024 07:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732777355; cv=none; b=su/qDn9evslygnBj8pqIcDmEhctjobwa1xUmvBTZ3sWjSYrw1OLBEVvZ6tYBT8K8mxkBw/mPfEhlaYkbsC46lRQmPi+Qb4j8T1QUjNyFfeXcG0dsBSaPyeyZa8n4pbVsNzG6LCX6f7d03uvqwU7vOa2hJqiHJv9jm1HkGhi4gNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732777355; c=relaxed/simple;
	bh=c+z1muBowvgFRpY9lxKS29aSkjJfUGmDMjemLPjY60Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZW34YNNm8YtPv7okhZEEusJJ1BS9gQZuien+MXsKeSb9BOuCGpcDxPrSHfSnIATGA9grJslEDPMaop4ueSt5EAlRZ6YJ73XWxvTaOR74oUnz8glVFlyMFN6N4sFJFkjYbhNX9iztPx1iTXV0jkr/EmHhVJqlrMN5nWyNXXQKz5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.180.135.20])
	by gateway (Coremail) with SMTP id _____8AxQK2EFUhnaXdKAA--.40737S3;
	Thu, 28 Nov 2024 15:02:28 +0800 (CST)
Received: from ubuntu.. (unknown [10.180.135.20])
	by front1 (Coremail) with SMTP id qMiowMCxLEeDFUhnvxtrAA--.46285S2;
	Thu, 28 Nov 2024 15:02:27 +0800 (CST)
From: Ming Wang <wangming01@loongson.cn>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	WANG Xuerui <git@xen0n.name>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	lixuefeng@loongson.cn,
	gaojuxin@loongson.cn,
	wangming01@loongson.cn
Subject: [PATCH] rtc: loongson: clear TOY_MATCH0_REG in loongson_rtc_isr
Date: Thu, 28 Nov 2024 15:02:27 +0800
Message-ID: <20241128070227.1071352-1-wangming01@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxLEeDFUhnvxtrAA--.46285S2
X-CM-SenderInfo: 5zdqwzxlqjiio6or00hjvr0hdfq/1tbiAgEPEmdHp9IHDgABsD
X-Coremail-Antispam: 1Uk129KBj93XoW7uF43CFWDCry3Zr1DJFy5Awc_yoW8AF1Dpr
	W3Ca4DursYvr4UCas5Aay8WrWay3yfJr9xuFs7Kw4Y93Z8A34UXF4FgFyUtr4Dur95JFWY
	q3y8KFW5u3WqkwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52
	x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80
	ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcO6pDUUUU

The TOY_MATCH0_REG should be cleared to 0 in the RTC interrupt handler,
otherwise the interrupt cannot be cleared, which will cause the
loongson_rtc_isr to be triggered multiple times.

The previous code cleared TOY_MATCH0_REG in the loongson_rtc_handler,
which is an ACPI interrupt. This did not prevent loongson_rtc_isr
from being triggered multiple times.

This commit moves the clearing of TOY_MATCH0_REG to the loongson_rtc_isr
to ensure that the interrupt is properly cleared.

Fixes: 1b733a9ebc3d ("rtc: Add rtc driver for the Loongson family chips")
Signed-off-by: Ming Wang <wangming01@loongson.cn>
---
 drivers/rtc/rtc-loongson.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
index e8ffc1ab90b0..0aa30095978b 100644
--- a/drivers/rtc/rtc-loongson.c
+++ b/drivers/rtc/rtc-loongson.c
@@ -114,6 +114,12 @@ static irqreturn_t loongson_rtc_isr(int irq, void *id)
 	struct loongson_rtc_priv *priv = (struct loongson_rtc_priv *)id;
 
 	rtc_update_irq(priv->rtcdev, 1, RTC_AF | RTC_IRQF);
+
+	/*
+	 * The TOY_MATCH0_REG should be cleared 0 here,
+	 * otherwise the interrupt cannot be cleared.
+	 */
+	regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
 	return IRQ_HANDLED;
 }
 
@@ -131,11 +137,7 @@ static u32 loongson_rtc_handler(void *id)
 	writel(RTC_STS, priv->pm_base + PM1_STS_REG);
 	spin_unlock(&priv->lock);
 
-	/*
-	 * The TOY_MATCH0_REG should be cleared 0 here,
-	 * otherwise the interrupt cannot be cleared.
-	 */
-	return regmap_write(priv->regmap, TOY_MATCH0_REG, 0);
+	return ACPI_INTERRUPT_HANDLED;
 }
 
 static int loongson_rtc_set_enabled(struct device *dev)
-- 
2.43.0


