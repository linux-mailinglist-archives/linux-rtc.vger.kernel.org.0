Return-Path: <linux-rtc+bounces-4805-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1C5B4239C
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 16:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A0251BC087B
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Sep 2025 14:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3AF311C39;
	Wed,  3 Sep 2025 14:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="QK/IehQz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315B33126C8
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909633; cv=none; b=L2Ytu1hukk+I+BN3JP6cnRoAEm3jUrGFuU/mW7Cg/1/x8PbCJa4aWYZnf5vGQseiV/Yp+dHtwYXZJojZun9VuvEpw+d9x0Z/1eD3QnbTkGr5tH8331rSGLmQG1S2nssT9QG7ZZaU9AVjNKCwDwU2uGomaTKuxNb62JqKWP5+FZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909633; c=relaxed/simple;
	bh=e/zFJjbx73n1Dt/ZnqKEGTpmWUYSLV76MnVr+ILHEK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skGLHs/OvdVcSSkUCcu7cdPTJXXA6CRuyQ8FbbkhR7h6FhNjgZDA6f54rmoVCQHG4WKekfcOxB+oKkACckNNQKNfqrOjU1UiOCNP9ce41WfaK3PZ57xnnmHfPZdbsUAuR62gzA1ZQb9YvmIDsyffC5LOGgkU/3WY91QISIm4bB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=QK/IehQz; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 1AF061015C6D
	for <linux-rtc@vger.kernel.org>; Wed,  3 Sep 2025 19:57:04 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 1AF061015C6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1756909624; bh=e/zFJjbx73n1Dt/ZnqKEGTpmWUYSLV76MnVr+ILHEK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QK/IehQzak9088znJBfmWWaU5VoENSQubye6FUuwC412/nKERDgLZ/HkTd7AdygqD
	 adb8E3SITZQFJLc67STxkpUyJw6AD2Cg5LCvKVo3jzJX7nnJcOk2h5pIzEkYNj4aTu
	 T5gGnte0tkSQm9kqe/8pqzwJAJV9Cau0wixAGc+8=
Received: (qmail 32446 invoked by uid 510); 3 Sep 2025 19:57:04 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.464319 secs; 03 Sep 2025 19:57:04 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 3 Sep 2025 19:57:00 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id F221B3414E2;
	Wed,  3 Sep 2025 19:56:59 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 52A981E8143E;
	Wed,  3 Sep 2025 19:56:59 +0530 (IST)
Date: Wed, 3 Sep 2025 19:56:54 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH 4/7] rtc: m41t93: Add alarm support
Message-ID: <4f78f8fa113d4262e162972f5c15155410a64e8b.1756908788.git.akhilesh@ee.iitb.ac.in>
References: <cover.1756908788.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1756908788.git.akhilesh@ee.iitb.ac.in>

Implement alarm feature for rtc-m41t93 by adding necessary
callbacks - set_alarm, read_alarm and alarm_irq_enable.
Enable support to configure alarm 1 out of 2 alarms present in this rtc.

Tested by observing IRQ pin (pin 12 of SOX18 package) on logic analyzer
going low after alarm condition is met.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/rtc/rtc-m41t93.c | 101 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/rtc/rtc-m41t93.c b/drivers/rtc/rtc-m41t93.c
index ad862bf706b6..8cc179e08a4a 100644
--- a/drivers/rtc/rtc-m41t93.c
+++ b/drivers/rtc/rtc-m41t93.c
@@ -22,6 +22,14 @@
 #define M41T93_REG_DAY			5
 #define M41T93_REG_MON			6
 #define M41T93_REG_YEAR			7
+#define M41T93_REG_AL1_MONTH		0xa
+#define M41T93_REG_AL1_DATE		0xb
+#define M41T93_REG_AL1_HOUR		0xc
+#define M41T93_REG_AL1_MIN		0xd
+#define M41T93_REG_AL1_SEC		0xe
+#define M41T93_BIT_A1IE                 BIT(7)
+#define M41T93_BIT_ABE			BIT(5)
+#define M41T93_FLAG_AF1                 BIT(6)
 
 
 #define M41T93_REG_ALM_HOUR_HT		0xc
@@ -153,10 +161,103 @@ static int m41t93_get_time(struct device *dev, struct rtc_time *tm)
 	return ret;
 }
 
+static int m41t93_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct m41t93_data *m41t93 = dev_get_drvdata(dev);
+	int ret;
+	unsigned int val;
+	u8 alarm_vals[5] = {0};
+
+	ret = regmap_bulk_write(m41t93->regmap, M41T93_REG_AL1_DATE, alarm_vals, 4);
+	if (ret)
+		return ret;
+
+	/* Set alarm values */
+	alarm_vals[0] = bin2bcd(alrm->time.tm_mon + 1) & 0x1f;
+	alarm_vals[1] = bin2bcd(alrm->time.tm_mday) & 0x3f;
+	alarm_vals[2] = bin2bcd(alrm->time.tm_hour) & 0x3f;
+	alarm_vals[3] = bin2bcd(alrm->time.tm_min) & 0x7f;
+	alarm_vals[4] = bin2bcd(alrm->time.tm_sec) & 0x7f;
+
+	if (alrm->enabled) {
+		/* Enable alarm IRQ generation
+		 * Note: SQWE is forced disabled while setting alarm
+		 */
+		alarm_vals[0] |= M41T93_BIT_A1IE | M41T93_BIT_ABE;
+	}
+
+	ret = regmap_bulk_write(m41t93->regmap, M41T93_REG_AL1_MONTH,
+				alarm_vals, sizeof(alarm_vals));
+	if (ret)
+		return ret;
+
+	/* Device address pointer is now at FLAG register, move it to other location
+	 * to finish setting alarm, as recommended by the datasheet.
+	 * We do read of AL1_MONTH register to achieve this.
+	 */
+	ret = regmap_read(m41t93->regmap, M41T93_REG_AL1_MONTH, &val);
+	if (ret)
+		return ret;
+
+	if (bcd2bin(val & 0x1f) == (alrm->time.tm_mon & 0x1f))
+		dev_notice(dev, "Alarm set successfully\n");
+
+	return 0;
+}
+
+static int m41t93_get_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct m41t93_data *m41t93 = dev_get_drvdata(dev);
+	int ret;
+	unsigned int val;
+	u8 alarm_vals[5] = {0};
+
+	ret = regmap_bulk_read(m41t93->regmap, M41T93_REG_AL1_MONTH,
+			       alarm_vals, sizeof(alarm_vals));
+	if (ret)
+		return ret;
+
+	alrm->time.tm_mon = bcd2bin(alarm_vals[0] & 0x1f) - 1;
+	alrm->time.tm_mday = bcd2bin(alarm_vals[1] & 0x3f);
+	alrm->time.tm_hour = bcd2bin(alarm_vals[2] & 0x3f);
+	alrm->time.tm_min = bcd2bin(alarm_vals[3] & 0x7f);
+	alrm->time.tm_sec = bcd2bin(alarm_vals[4] & 0x7f);
+
+	alrm->enabled =  !!(alarm_vals[0] & M41T93_BIT_A1IE);
+
+	ret = regmap_read(m41t93->regmap, M41T93_REG_FLAGS, &val);
+	if (ret)
+		return ret;
+
+	alrm->pending = (val & M41T93_FLAG_AF1) && alrm->enabled;
+
+	return 0;
+}
+
+static int m41t93_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct m41t93_data *m41t93 = dev_get_drvdata(dev);
+	unsigned int val;
+	int ret;
+
+	val = enabled ? M41T93_BIT_A1IE | M41T93_BIT_ABE :
+		~(M41T93_BIT_A1IE | M41T93_BIT_ABE);
+
+	ret = regmap_update_bits(m41t93->regmap, M41T93_REG_AL1_MONTH,
+				 M41T93_BIT_A1IE | M41T93_BIT_ABE, val);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 
 static const struct rtc_class_ops m41t93_rtc_ops = {
 	.read_time	= m41t93_get_time,
 	.set_time	= m41t93_set_time,
+	.set_alarm	= m41t93_set_alarm,
+	.read_alarm	= m41t93_get_alarm,
+	.alarm_irq_enable = m41t93_alarm_irq_enable,
 };
 
 static struct spi_driver m41t93_driver;
-- 
2.34.1


