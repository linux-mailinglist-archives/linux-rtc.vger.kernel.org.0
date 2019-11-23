Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 085F5107CEB
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Nov 2019 06:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfKWFQG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 Nov 2019 00:16:06 -0500
Received: from smtp.gentoo.org ([140.211.166.183]:36174 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726638AbfKWFQG (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 23 Nov 2019 00:16:06 -0500
Received: from [192.168.1.13] (c-76-114-240-162.hsd1.md.comcast.net [76.114.240.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kumba)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 8F77F34D24E;
        Sat, 23 Nov 2019 05:16:04 +0000 (UTC)
Subject: Re: [PATCH 3/8] rtc: ds1685: remove set but unused variables
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20191122102212.400158-1-alexandre.belloni@bootlin.com>
 <20191122102212.400158-4-alexandre.belloni@bootlin.com>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <031464cc-bb81-4f63-1a7d-7966b366f4da@gentoo.org>
Date:   Sat, 23 Nov 2019 00:16:00 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191122102212.400158-4-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/22/2019 05:22, Alexandre Belloni wrote:
> Fix the following warnings:
> drivers/rtc/rtc-ds1685.c: In function ‘ds1685_rtc_read_time’:
> drivers/rtc/rtc-ds1685.c:264:5: warning: variable ‘ctrlb’ set but not used [-Wunused-but-set-variable]
>   264 |  u8 ctrlb, century;
>       |     ^~~~~
> drivers/rtc/rtc-ds1685.c: In function ‘ds1685_rtc_proc’:
> drivers/rtc/rtc-ds1685.c:758:19: warning: variable ‘ctrlc’ set but not used [-Wunused-but-set-variable]
>   758 |  u8 ctrla, ctrlb, ctrlc, ctrld, ctrl4a, ctrl4b, ssn[8];
>       |                   ^~~~~
> Cc: Joshua Kinard <kumba@gentoo.org>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-ds1685.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
> index 98d06b3ee913..8419595e7da7 100644
> --- a/drivers/rtc/rtc-ds1685.c
> +++ b/drivers/rtc/rtc-ds1685.c
> @@ -261,7 +261,7 @@ static int
>  ds1685_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  {
>  	struct ds1685_priv *rtc = dev_get_drvdata(dev);
> -	u8 ctrlb, century;
> +	u8 century;
>  	u8 seconds, minutes, hours, wday, mday, month, years;
>  
>  	/* Fetch the time info from the RTC registers. */
> @@ -274,7 +274,6 @@ ds1685_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  	month   = rtc->read(rtc, RTC_MONTH);
>  	years   = rtc->read(rtc, RTC_YEAR);
>  	century = rtc->read(rtc, RTC_CENTURY);
> -	ctrlb   = rtc->read(rtc, RTC_CTRL_B);
>  	ds1685_rtc_end_data_access(rtc);
>  
>  	/* bcd2bin if needed, perform fixups, and store to rtc_time. */
> @@ -755,7 +754,7 @@ static int
>  ds1685_rtc_proc(struct device *dev, struct seq_file *seq)
>  {
>  	struct ds1685_priv *rtc = dev_get_drvdata(dev);
> -	u8 ctrla, ctrlb, ctrlc, ctrld, ctrl4a, ctrl4b, ssn[8];
> +	u8 ctrla, ctrlb, ctrld, ctrl4a, ctrl4b, ssn[8];
>  	char *model;
>  
>  	/* Read all the relevant data from the control registers. */
> @@ -763,7 +762,6 @@ ds1685_rtc_proc(struct device *dev, struct seq_file *seq)
>  	ds1685_rtc_get_ssn(rtc, ssn);
>  	ctrla = rtc->read(rtc, RTC_CTRL_A);
>  	ctrlb = rtc->read(rtc, RTC_CTRL_B);
> -	ctrlc = rtc->read(rtc, RTC_CTRL_C);
>  	ctrld = rtc->read(rtc, RTC_CTRL_D);
>  	ctrl4a = rtc->read(rtc, RTC_EXT_CTRL_4A);
>  	ctrl4b = rtc->read(rtc, RTC_EXT_CTRL_4B);
> 

Acked-By: Joshua Kinard <kumba@gentoo.org>
