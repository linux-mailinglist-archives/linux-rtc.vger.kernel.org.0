Return-Path: <linux-rtc+bounces-4999-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04420B8CAFD
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Sep 2025 17:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90BB456565F
	for <lists+linux-rtc@lfdr.de>; Sat, 20 Sep 2025 15:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941732F7AAF;
	Sat, 20 Sep 2025 15:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="k/rANuy4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F56D29E113
	for <linux-rtc@vger.kernel.org>; Sat, 20 Sep 2025 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758380578; cv=none; b=PXsbpc7+lWOHtig9Q15hv1iJKAC5cTT/MCdsgcQgFSXdcdCeIRyTwg6VsQ4VYTLEOat1uEqC8LWnCLJH/6y3gNaWIk5lqja3lWQmSC2oxf+OAFexOhPOCBJa9navROyi+5uT2iuCqKzD0FAhFsr/l2xqQFTH/K6Rn2b+vNjpNOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758380578; c=relaxed/simple;
	bh=xRwpN3TBh5t1zZhtQyEI8sk72e47kTvLYW1J/j3N8YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stN12ZhtbOKC3YmfHYr1umYbqRCsMT28hnwK4gPP3KaDHowJOdsbNJOY9DhDZIieSwIRZBu0LCviQZiqEQ0ByUCvBj/1xxHdpA0b6bSHevscYfMjGK1/MaOuFQLBpcgl4VArzXhhY2jU3uy2YlW7eYB/Y6W4pbCcGCJfyhG99iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=k/rANuy4; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 1B46B1080223
	for <linux-rtc@vger.kernel.org>; Sat, 20 Sep 2025 20:32:54 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 1B46B1080223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1758380574; bh=xRwpN3TBh5t1zZhtQyEI8sk72e47kTvLYW1J/j3N8YM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k/rANuy4qS0RAEbmIRE10fyC6WwQnbh1spfPUDNyj2c3ourK3QjjmLwFJGTlamWhK
	 jJbN9gg4f8/fCZ+plZYMjwK7IkKmldzpAcDM1OdwBQ1A+2+dmTCsEZ0L0vFPHqpiUv
	 efAN9ccvx/+1YuDB4QwM/EqPmzrlrb4WjK8krvx0=
Received: (qmail 10562 invoked by uid 510); 20 Sep 2025 20:32:54 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 2.422718 secs; 20 Sep 2025 20:32:54 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
  by ldns1.iitb.ac.in with SMTP; 20 Sep 2025 20:32:51 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns1.iitb.ac.in (Postfix) with ESMTP id 1379A360036;
	Sat, 20 Sep 2025 20:32:51 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id E1F6D1E814BD;
	Sat, 20 Sep 2025 20:32:50 +0530 (IST)
Date: Sat, 20 Sep 2025 20:32:46 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH v3 4/6] rtc: m41t93: Add alarm support
Message-ID: <1b272ff1a5392d5eb76e129a4785ac8424763356.1758379856.git.akhilesh@ee.iitb.ac.in>
References: <cover.1758379856.git.akhilesh@ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1758379856.git.akhilesh@ee.iitb.ac.in>

Implement alarm feature for rtc-m41t93 by adding necessary
callbacks - set_alarm, read_alarm and alarm_irq_enable.
Enable support to configure alarm 1 out of 2 alarms present in this rtc.
Support only alarm configuration in this commit. This commit does not
implement alarm irq handling.

Use selftests/rtc/rtctest for testing. Tested by observing IRQ pin
(pin 12 of SOX18 package) on logic analyzer going low after alarm
condition is met.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/rtc/rtc-m41t93.c | 105 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/rtc/rtc-m41t93.c b/drivers/rtc/rtc-m41t93.c
index ad862bf706b6..b86e7a12eba6 100644
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
+#define M41T93_BIT_ABE                  BIT(5)
+#define M41T93_FLAG_AF1                 BIT(6)
 
 
 #define M41T93_REG_ALM_HOUR_HT		0xc
@@ -153,10 +161,107 @@ static int m41t93_get_time(struct device *dev, struct rtc_time *tm)
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
+		/* Enable alarm IRQ generation */
+		alarm_vals[0] |= M41T93_BIT_A1IE | M41T93_BIT_ABE;
+	}
+
+	/* Preserve SQWE bit */
+	ret = regmap_read(m41t93->regmap, M41T93_REG_AL1_MONTH, &val);
+	if (ret)
+		return ret;
+
+	alarm_vals[0] |= val & 0x40;
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
+	val = enabled ? M41T93_BIT_A1IE | M41T93_BIT_ABE : 0;
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


