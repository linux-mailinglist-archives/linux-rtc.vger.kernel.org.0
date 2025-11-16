Return-Path: <linux-rtc+bounces-5391-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 21454C61068
	for <lists+linux-rtc@lfdr.de>; Sun, 16 Nov 2025 06:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4EA20358F9B
	for <lists+linux-rtc@lfdr.de>; Sun, 16 Nov 2025 05:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F48D1E7C18;
	Sun, 16 Nov 2025 05:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="cBfLqFHs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C563B1B3
	for <linux-rtc@vger.kernel.org>; Sun, 16 Nov 2025 05:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763270255; cv=none; b=RoNwUgBxPdZwR+tzkdva6J7io6azW6BBqfS4JYMtmfL+zM4veQYkHHBPHCGx4coX8PfXDSw8j0Ztg0EuXJmgg2yPNE1Ijx8Vvo0NTqDxgjinkfUQCKIvZkHlMvD4E4kEfsqecbOKhbluiT4QtW+xvuhdagy7hxk6KOeyeKuwMYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763270255; c=relaxed/simple;
	bh=TjZ8HTtdzUtFErkWosk5zxCMX7rxx+R21cNF/6VuhvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXnfQpQPaNJZjoRwpDS/fG4lhvpNfGD1UJfOS4cgfHo19NLSowuw65xgcWzSEbJLEjQAVby9C3mK6Uux25BO0Wd69cQSKjcMkNcrlA1VuTflYDCV6IXs/PSb/qX7IU5kbQjgx+KLRUUlebV40C7/NWEFZfaUWi1/L1lKKek1glU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=cBfLqFHs; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 1E9A7104CBA2
	for <linux-rtc@vger.kernel.org>; Sun, 16 Nov 2025 10:47:25 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 1E9A7104CBA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1763270245; bh=TjZ8HTtdzUtFErkWosk5zxCMX7rxx+R21cNF/6VuhvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cBfLqFHskXx0afRe3kypPTN++TVzV3EmV6sjXmSBZ2c/t6EmVomFmtE42+ECjGmPe
	 49CJAIOgGseABYAv1Lcd24aSZ6Misu2s3kKX5H0G43jOOcSwnJfXYiMbwtg2z9gqyA
	 k95efUISGuvv63pI6CRHx/uqiLkZy3NnSmE/vCzg=
Received: (qmail 6929 invoked by uid 510); 16 Nov 2025 10:47:25 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 4.044444 secs; 16 Nov 2025 10:47:25 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 16 Nov 2025 10:47:20 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id 660693414F4;
	Sun, 16 Nov 2025 10:47:20 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 3DD4F1E81565;
	Sun, 16 Nov 2025 10:47:20 +0530 (IST)
Date: Sun, 16 Nov 2025 10:47:15 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: andriy.shevchenko@intel.com, david.daney@cavium.com,
	ddaney@caviumnetworks.com, david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com
Subject: Re: [PATCH] rtc: isl12026: Implement callbacks for alarm feature
Message-ID: <20251116-51715-3266073@bhairav-test.ee.iitb.ac.in>
References: <20251115-1156-3147571@bhairav-test.ee.iitb.ac.in>
 <20251115112421bdd368f5@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115112421bdd368f5@mail.local>

On Sat, Nov 15, 2025 at 12:24:21PM +0100, Alexandre Belloni wrote:
> On 15/11/2025 16:35:06+0530, Akhilesh Patil wrote:
> > Add alarm support for isl12026 RTC. Implement alarm function rtc
> > class callbacks - set_alarm, read_alarm and alarm_irq_enable.
> > isl12026 rtc has 2 alarms, this patch adds support to configure alarm0.
> > Note: isl12026 rtc chip share same pin(4) for alarm interrupt and square
> > wave frequency generator, hence forcefully disable SQW functionality
> > while writing to device registers in alarm functions.
> > 
> > Tested on TI am62x sk board on i2c-2 port using selftests/rtc/rtctest
> > 
> > Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> > ---
> > Datasheet of RTC chip.
> > https://www.renesas.com/en/document/dst/isl12026-isl12026a-datasheet?srsltid=AfmBOopgN4vtn8XoN-8sOCfTW6yiLH-T7eeH_IWakqZ2VmENmWFqqh7w
> > 
> >  drivers/rtc/rtc-isl12026.c | 127 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 127 insertions(+)
> > 
> > diff --git a/drivers/rtc/rtc-isl12026.c b/drivers/rtc/rtc-isl12026.c
> > index 2aabb9151d4c..7fa9ec7e4929 100644
> > --- a/drivers/rtc/rtc-isl12026.c
> > +++ b/drivers/rtc/rtc-isl12026.c
> > @@ -34,6 +34,11 @@
> >  #define ISL12026_PAGESIZE 16
> >  #define ISL12026_NVMEM_WRITE_TIME 20

Hi Alexandre, Thanks for the review.
Please find my comments below.

[...]

> >  
> > +static int isl12026_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	int ret;
> > +	u8 buf_alrm_vals[7];
> > +	struct i2c_msg msg;
> > +	int ir;
> > +
> > +	msg.addr = client->addr;
> > +	msg.flags = 0x0; /* Write operation */
> > +	msg.buf = buf_alrm_vals;
> > +	msg.len = sizeof(buf_alrm_vals);
> > +
> > +	if (!alrm->enabled) {
> > +		/* Disable alarm and return */
> 
> You still need to set the alarm time and date properly, the application
> is allowed to first set the alarm and then enable it.

Sure. Understood.
Will fix this in v2.

> 
> > +		ir = isl12026_read_reg(client, ISL12026_REG_INT);
> > +		if (ir < 0)
> > +			return ir;
> > +		ir &= ~ISL12026_AL0E;

[...]

> > +
> > +	/* Non-volatile Page write to AL0 registers and enable INT */
> > +	ret = isl12026_arm_write(client);
> > +	if (ret < 0)
> > +		return ret;
> > +	ret = i2c_transfer(client->adapter, &msg, 1);
> > +	msleep(ISL12026_NVMEM_WRITE_TIME);
> > +	if (ret != 1) {
> > +		dev_err(&client->dev, "Error writing to alarm registers\n");
> 
> No need for an error message.

ACK.
Will remove error message and just return error.

> 
> > +		return ret < 0 ? ret : -EIO;
> > +	}
> > +
> > +	/* Enable AL0 interrupt */
> > +	ret = isl12026_write_reg(client, ISL12026_REG_INT, ISL12026_AL0E);
> > +
> > +	return ret;
> > +}
> > +
> > +static int isl12026_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	int ret;
> > +	int sr, ir;
> > +	u8 buf_alrm_vals[5];
> > +	u8 addr[2] = {0x0, ISL12026_AL0_REG_SC};
> > +	struct i2c_msg msgs[2] = { };
> > +

[...]

> > +	alrm->pending =  !!(sr & ISL12026_SR_AL0) && alrm->enabled;
> > +
> > +	/* Page read for alarm registers */
> > +	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> > +	if (ret != ARRAY_SIZE(msgs)) {
> > +		dev_err(&client->dev, "Error reading alarm registers\n");
> 
> Ditto

ACK. Will remove err message.

> 
> > +		return ret < 0 ? ret : -EIO;
> > +	}
> > +
> > +	/* Populate values read */
> > +	alrm->time.tm_sec =  bcd2bin(buf_alrm_vals[0] & 0x7f);
> > +	alrm->time.tm_min =  bcd2bin(buf_alrm_vals[1] & 0x7f);
> > +	alrm->time.tm_hour = bcd2bin(buf_alrm_vals[2] & 0x3f);
> > +	alrm->time.tm_mday = bcd2bin(buf_alrm_vals[3] & 0x3f);
> > +	alrm->time.tm_mon =  bcd2bin(buf_alrm_vals[4] & 0x1f) - 1;
> > +
> > +	return 0;
> > +}
> > +
> > +static int isl12026_rtc_alarm_irq_en(struct device *dev, unsigned int enabled)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	int ret;
> > +	int ir;
> > +
> > +	if (enabled) {
> > +		ret = isl12026_write_reg(client, ISL12026_REG_INT, ISL12026_AL0E);
> > +		return ret;
> > +	}
> > +
> > +	/* Disable alarm */
> > +	ir = isl12026_read_reg(client, ISL12026_REG_INT);
> > +	if (ir < 0)
> > +		return ir;
> > +	ir &= ~ISL12026_AL0E;
> > +	ret = isl12026_write_reg(client, ISL12026_REG_INT, ir);
> > +
> > +	return ret;
> > +}
> > +
> >  static const struct rtc_class_ops isl12026_rtc_ops = {
> >  	.read_time	= isl12026_rtc_read_time,
> >  	.set_time	= isl12026_rtc_set_time,
> > +	.set_alarm	= isl12026_rtc_set_alarm,
> > +	.read_alarm	= isl12026_rtc_read_alarm,
> > +	.alarm_irq_enable = isl12026_rtc_alarm_irq_en,
> >  };
> >  
> 
> This is missing an interrupt handler and proper handling in probe for
> the wakeup-source property as this seems to be how you use it.

Agree. However, I thought of first implementing alarm callbacks only and
test them independedntly using ioctls for alarm settings in this patch.
I will add interrupt handler and wakeup-source in v2 to complete this
functionality.

Regards,
Akhilesh

> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

