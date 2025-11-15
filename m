Return-Path: <linux-rtc+bounces-5387-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC89CC60390
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Nov 2025 12:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5239E4E1686
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Nov 2025 11:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF80C284B4F;
	Sat, 15 Nov 2025 11:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="G7jo12J8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A730F27E1A1
	for <linux-rtc@vger.kernel.org>; Sat, 15 Nov 2025 11:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763204730; cv=none; b=KupY8kNW6h6J+/Z9QJSaSJjk00ESdB2Ktvq71lk4McNfM8/96wOZR701cxWat2n0QAEipUsMWsLYB4RO5zeOiEAxFJN1WaKijWWoHb4A57wpeLVCYXvu4jMuAiWp1f7jzVTVJMhY0I7D+28QNYWxkDW53QDj/mIOhwjnBz0L4ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763204730; c=relaxed/simple;
	bh=WDU+ZG7399SWNbkE4AWchWtC5gezwwSUaoLvrW+8C+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QGhxJzGWIBoS0JXIvX/OwxFpqhGCW8rezS9jE+0AZojMZFWuIhHsm/kdxqTlzvK9j9MfYc3vMmr9JEqnCTDZ5uQspLKmFlPdSPgX/EHMOKwZCdSs2LKMCJ0FOsQU/rOgj38/IJwqmHM0fAkUi7s1HAfp4ZFgXGFR9WOkVdsjSPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=G7jo12J8; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 5E24D104C1DE
	for <linux-rtc@vger.kernel.org>; Sat, 15 Nov 2025 16:35:15 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 5E24D104C1DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1763204715; bh=WDU+ZG7399SWNbkE4AWchWtC5gezwwSUaoLvrW+8C+w=;
	h=Date:From:To:Cc:Subject:From;
	b=G7jo12J8tPdMd/oDn2lYVJlW3LVUxQCIkf8A8sOUl1TB3clGyds7gfGKv6J7DrEKl
	 fqF95h537Tay2OEwsGoMj/ZlGZSwcBRBv7u5KETDfCKAd362H+CgPxe3LJwUoppVEd
	 S6jPqlgaEVHVQo3F54NzNMVX2nOvlTjpieu5d0c8=
Received: (qmail 2314 invoked by uid 510); 15 Nov 2025 16:35:15 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 2.947567 secs; 15 Nov 2025 16:35:15 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
  by ldns1.iitb.ac.in with SMTP; 15 Nov 2025 16:35:12 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns1.iitb.ac.in (Postfix) with ESMTP id D47E536004D;
	Sat, 15 Nov 2025 16:35:11 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id AA6291E81626;
	Sat, 15 Nov 2025 16:35:11 +0530 (IST)
Date: Sat, 15 Nov 2025 16:35:06 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: alexandre.belloni@bootlin.com, andriy.shevchenko@intel.com,
	david.daney@cavium.com, ddaney@caviumnetworks.com,
	david.hunter.linux@gmail.com, skhan@linuxfoundation.org
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	akhileshpatilvnit@gmail.com
Subject: [PATCH] rtc: isl12026: Implement callbacks for alarm feature
Message-ID: <20251115-1156-3147571@bhairav-test.ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add alarm support for isl12026 RTC. Implement alarm function rtc
class callbacks - set_alarm, read_alarm and alarm_irq_enable.
isl12026 rtc has 2 alarms, this patch adds support to configure alarm0.
Note: isl12026 rtc chip share same pin(4) for alarm interrupt and square
wave frequency generator, hence forcefully disable SQW functionality
while writing to device registers in alarm functions.

Tested on TI am62x sk board on i2c-2 port using selftests/rtc/rtctest

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
Datasheet of RTC chip.
https://www.renesas.com/en/document/dst/isl12026-isl12026a-datasheet?srsltid=AfmBOopgN4vtn8XoN-8sOCfTW6yiLH-T7eeH_IWakqZ2VmENmWFqqh7w

 drivers/rtc/rtc-isl12026.c | 127 +++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/drivers/rtc/rtc-isl12026.c b/drivers/rtc/rtc-isl12026.c
index 2aabb9151d4c..7fa9ec7e4929 100644
--- a/drivers/rtc/rtc-isl12026.c
+++ b/drivers/rtc/rtc-isl12026.c
@@ -34,6 +34,11 @@
 #define ISL12026_PAGESIZE 16
 #define ISL12026_NVMEM_WRITE_TIME 20
 
+#define ISL12026_AL0_REG_SC	0x0
+#define ISL12026_REG_INT	0x11
+#define ISL12026_AL0E		BIT(5)
+#define ISL12026_SR_AL0         BIT(5)
+
 struct isl12026 {
 	struct rtc_device *rtc;
 	struct i2c_client *nvm_client;
@@ -269,9 +274,131 @@ static int isl12026_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	return ret;
 }
 
+static int isl12026_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
+	u8 buf_alrm_vals[7];
+	struct i2c_msg msg;
+	int ir;
+
+	msg.addr = client->addr;
+	msg.flags = 0x0; /* Write operation */
+	msg.buf = buf_alrm_vals;
+	msg.len = sizeof(buf_alrm_vals);
+
+	if (!alrm->enabled) {
+		/* Disable alarm and return */
+		ir = isl12026_read_reg(client, ISL12026_REG_INT);
+		if (ir < 0)
+			return ir;
+		ir &= ~ISL12026_AL0E;
+		ret = isl12026_write_reg(client, ISL12026_REG_INT, ir);
+
+		return ret;
+	}
+
+	/* Prepare 5 bytes alarm data SC, MN, HR, DT, MO */
+	buf_alrm_vals[0] = 0x0;
+	buf_alrm_vals[1] = ISL12026_AL0_REG_SC;
+	buf_alrm_vals[2] = (bin2bcd(alrm->time.tm_sec) & 0x7f) | 0x80;
+	buf_alrm_vals[3] = (bin2bcd(alrm->time.tm_min) & 0x7f) | 0x80;
+	buf_alrm_vals[4] = (bin2bcd(alrm->time.tm_hour) & 0x3f) | 0x80;
+	buf_alrm_vals[5] = (bin2bcd(alrm->time.tm_mday) & 0x3f) | 0x80;
+	buf_alrm_vals[6] = (bin2bcd(alrm->time.tm_mon + 1) & 0x1f) | 0x80;
+
+	/* Non-volatile Page write to AL0 registers and enable INT */
+	ret = isl12026_arm_write(client);
+	if (ret < 0)
+		return ret;
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	msleep(ISL12026_NVMEM_WRITE_TIME);
+	if (ret != 1) {
+		dev_err(&client->dev, "Error writing to alarm registers\n");
+		return ret < 0 ? ret : -EIO;
+	}
+
+	/* Enable AL0 interrupt */
+	ret = isl12026_write_reg(client, ISL12026_REG_INT, ISL12026_AL0E);
+
+	return ret;
+}
+
+static int isl12026_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
+	int sr, ir;
+	u8 buf_alrm_vals[5];
+	u8 addr[2] = {0x0, ISL12026_AL0_REG_SC};
+	struct i2c_msg msgs[2] = { };
+
+	msgs[0].addr = client->addr;
+	msgs[0].flags = 0x0; /* Write register address */
+	msgs[0].buf = addr;
+	msgs[0].len = sizeof(addr);
+
+	msgs[1].addr = client->addr;
+	msgs[1].flags = I2C_M_RD; /* Alarm read operation */
+	msgs[1].buf = buf_alrm_vals;
+	msgs[1].len = sizeof(buf_alrm_vals);
+
+	/* Read alarm enable status */
+	ir = isl12026_read_reg(client, ISL12026_REG_INT);
+	if (ir < 0)
+		return ir;
+	alrm->enabled =  !!(ir & ISL12026_AL0E);
+
+	/* Read alarm pending status */
+	sr = isl12026_read_reg(client, ISL12026_REG_SR);
+	if (sr < 0)
+		return sr;
+	alrm->pending =  !!(sr & ISL12026_SR_AL0) && alrm->enabled;
+
+	/* Page read for alarm registers */
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (ret != ARRAY_SIZE(msgs)) {
+		dev_err(&client->dev, "Error reading alarm registers\n");
+		return ret < 0 ? ret : -EIO;
+	}
+
+	/* Populate values read */
+	alrm->time.tm_sec =  bcd2bin(buf_alrm_vals[0] & 0x7f);
+	alrm->time.tm_min =  bcd2bin(buf_alrm_vals[1] & 0x7f);
+	alrm->time.tm_hour = bcd2bin(buf_alrm_vals[2] & 0x3f);
+	alrm->time.tm_mday = bcd2bin(buf_alrm_vals[3] & 0x3f);
+	alrm->time.tm_mon =  bcd2bin(buf_alrm_vals[4] & 0x1f) - 1;
+
+	return 0;
+}
+
+static int isl12026_rtc_alarm_irq_en(struct device *dev, unsigned int enabled)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret;
+	int ir;
+
+	if (enabled) {
+		ret = isl12026_write_reg(client, ISL12026_REG_INT, ISL12026_AL0E);
+		return ret;
+	}
+
+	/* Disable alarm */
+	ir = isl12026_read_reg(client, ISL12026_REG_INT);
+	if (ir < 0)
+		return ir;
+	ir &= ~ISL12026_AL0E;
+	ret = isl12026_write_reg(client, ISL12026_REG_INT, ir);
+
+	return ret;
+}
+
 static const struct rtc_class_ops isl12026_rtc_ops = {
 	.read_time	= isl12026_rtc_read_time,
 	.set_time	= isl12026_rtc_set_time,
+	.set_alarm	= isl12026_rtc_set_alarm,
+	.read_alarm	= isl12026_rtc_read_alarm,
+	.alarm_irq_enable = isl12026_rtc_alarm_irq_en,
 };
 
 static int isl12026_nvm_read(void *p, unsigned int offset,
-- 
2.34.1


