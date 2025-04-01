Return-Path: <linux-rtc+bounces-3711-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE34A7772A
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Apr 2025 11:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 476163A7D89
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Apr 2025 09:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DD61EB5CA;
	Tue,  1 Apr 2025 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IlQp4/q8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C981E378C;
	Tue,  1 Apr 2025 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498305; cv=none; b=C1gwEpSQPgeLB7wdwHAQU1ZrfrAmm5uBEJlfa10rFtSqgU4JTlPAU9u5GLFxADDLy1L3dVuQ3a1MEmrjGbvz85hm6iDbVZQt9gxAJGf9U7hgJ9BS4VSpI+8Kbr1cZYKjxz3dLVv+wCO6R6ggAZMV1jWZHXtWIwgca71I11YVuQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498305; c=relaxed/simple;
	bh=ozmt19GvbEEBobaOV8eXtfFF+gY55KKZwRmKk1gIpUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jydrkSfgqagDxU43hgb8+wk2PD4MUDUSEmO/VeqgA+/WkofMY3OHo8p5ZLVhdWBwxnmHzVznr7niQtowDbEGEhIM6yqZJ+ytaz3xoZ2NV6COrjmpAQs7g+yL09w42d2gXBdd+3aoj4t2eG3kpb2aaSQTW0RbefPv+TMSJ8OlYLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IlQp4/q8; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D80BC20486;
	Tue,  1 Apr 2025 09:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743498295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d9pmeIEW/9O7W8wmb+t+48ls33PS37BbHr+WoLvC2sc=;
	b=IlQp4/q8FMW2heV5Lrg35Gw7Qinca5/2aXgPmemfGuYOt5c//gVcTjPS+Yh4ZToHmWekY+
	qUge8KnuBtzIcMESBfwwl6parBYZQCalvJq1HfvB4dkjKHnvY3epgo5m8vG8HCyy2PmG/J
	7bnzgkd6puFzLtEgv//qkZHMPzYBAZiJNXKPWUHhFjWpA6+S6dCcNlN1nbWKHY/6pwosIE
	oGW0sZhB5KJZjGqp/CcPGZHP77FLf/BOiRP+/VQ4K5UT99pqsjsQKSj0kLyclOCiS+EaH8
	jY7BoX9tiSFLLWwMayTIjuH8D7qdwgvzbGyNpq1YvvKdtAlwvE0m871/Wk8lTQ==
Date: Tue, 1 Apr 2025 11:04:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: nmydeen@mvista.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	cminyard@mvista.com
Subject: Re: [PATCH] rtc-m41t62: kickstart ocillator upon failure
Message-ID: <20250401090454fb0ccf16@mail.local>
References: <20250116062641.366679-1-nmydeen@mvista.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116062641.366679-1-nmydeen@mvista.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefleehkeehvedvfedvudeigffhfffftdfhffdtlefhjeehvedtvedttefffedvffenucffohhmrghinhepshhtrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehnmhihuggvvghnsehmvhhishhtrgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrthgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvg
 hgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghmihhnhigrrhgusehmvhhishhtrgdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello,

On 16/01/2025 11:56:41+0530, nmydeen@mvista.com wrote:
> From: "A. Niyas Ahamed Mydeen" <nmydeen@mvista.com>
> 
> The ocillator on the m41t62 (and other chips of this type) needs
> a kickstart upon a failure; the RTC read routine will notice the
> oscillator failure and fail reads.  This is added in the RTC write
> routine; this allows the system to know that the time in the RTC
> is accurate.  This is following the procedure described in section
> 3.11 of  "https://www.st.com/resource/en/datasheet/m41t62.pdf"
> 
> Signed-off-by: A. Niyas Ahamed Mydeen <nmydeen@mvista.com>
> Reviewed-by: Corey Minyard <cminyard@mvista.com>
> ---
>  drivers/rtc/rtc-m41t80.c | 70 ++++++++++++++++++++++++++++------------
>  1 file changed, 49 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> index 1f58ae8b151e..77c21c91bae3 100644
> --- a/drivers/rtc/rtc-m41t80.c
> +++ b/drivers/rtc/rtc-m41t80.c
> @@ -22,6 +22,7 @@
>  #include <linux/slab.h>
>  #include <linux/mutex.h>
>  #include <linux/string.h>
> +#include <linux/delay.h>
>  #ifdef CONFIG_RTC_DRV_M41T80_WDT
>  #include <linux/fs.h>
>  #include <linux/ioctl.h>
> @@ -204,7 +205,7 @@ static int m41t80_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  		return flags;
>  
>  	if (flags & M41T80_FLAGS_OF) {
> -		dev_err(&client->dev, "Oscillator failure, data is invalid.\n");
> +		dev_err(&client->dev, "Oscillator failure, time may not be accurate, write time to RTC to fix it.\n");
>  		return -EINVAL;
>  	}
>  
> @@ -227,21 +228,60 @@ static int m41t80_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  	return 0;
>  }
>  
> -static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *tm)
> +static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *in_tm)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct m41t80_data *clientdata = i2c_get_clientdata(client);
> +	struct rtc_time tm = *in_tm;
>  	unsigned char buf[8];
>  	int err, flags;
> +	time64_t time = 0;
>  
> +	flags = i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
> +	if (flags < 0)
> +		return flags;
> +	if (flags & M41T80_FLAGS_OF) {
> +		/* OF cannot be immediately reset: oscillator has to be restarted. */
> +		dev_warn(&client->dev, "OF bit is still set, kickstarting clock.\n");
> +		err = i2c_smbus_write_byte_data(client, M41T80_REG_SEC, M41T80_SEC_ST);
> +		if (err < 0) {
> +			dev_err(&client->dev, "Can't set ST bit\n");

This is super verbose, please use dev_dbg or drop the dev_errs. The only
user action after a failure would be to restart the operation anyway.

> +			return err;
> +		}
> +		err = i2c_smbus_write_byte_data(client, M41T80_REG_SEC,
> +						    flags & ~M41T80_SEC_ST);
> +		if (err < 0) {
> +			dev_err(&client->dev, "Can't clear ST bit\n");
> +			return err;
> +		}
> +		/* oscillator must run for 4sec before we attempt to reset OF bit */
> +		msleep(4000);
> +		/* Clear the OF bit of Flags Register */
> +		err = i2c_smbus_write_byte_data(client, M41T80_REG_FLAGS,
> +					flags & ~M41T80_FLAGS_OF);

checkpatch --strict complains about some style issues, please fix those.

> +		if (err < 0) {
> +			dev_err(&client->dev, "Unable to write flags register\n");
> +			return err;
> +		}
> +		flags = i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
> +		if (flags < 0)
> +			return flags;
> +		else if (flags & M41T80_FLAGS_OF) {
> +			dev_err(&client->dev, "Can't clear the OF bit check battery\n");
> +			return err;
> +		}
> +		/* add 4sec of oscillator stablize time otherwise we are behind 4sec */
> +		time = rtc_tm_to_time64(&tm);
> +		rtc_time64_to_tm(time+4, &tm);
> +	}

The main issue is that now, you have cleared OF so if any read/write to
the RTC fails, you would return from the function without having set the
time. So when OF is set, you should first add the 4s, then set the time,
then kickstart the RTC.

>  	buf[M41T80_REG_SSEC] = 0;
> -	buf[M41T80_REG_SEC] = bin2bcd(tm->tm_sec);
> -	buf[M41T80_REG_MIN] = bin2bcd(tm->tm_min);
> -	buf[M41T80_REG_HOUR] = bin2bcd(tm->tm_hour);
> -	buf[M41T80_REG_DAY] = bin2bcd(tm->tm_mday);
> -	buf[M41T80_REG_MON] = bin2bcd(tm->tm_mon + 1);
> -	buf[M41T80_REG_YEAR] = bin2bcd(tm->tm_year - 100);
> -	buf[M41T80_REG_WDAY] = tm->tm_wday;
> +	buf[M41T80_REG_SEC] = bin2bcd(tm.tm_sec);
> +	buf[M41T80_REG_MIN] = bin2bcd(tm.tm_min);
> +	buf[M41T80_REG_HOUR] = bin2bcd(tm.tm_hour);
> +	buf[M41T80_REG_DAY] = bin2bcd(tm.tm_mday);
> +	buf[M41T80_REG_MON] = bin2bcd(tm.tm_mon + 1);
> +	buf[M41T80_REG_YEAR] = bin2bcd(tm.tm_year - 100);
> +	buf[M41T80_REG_WDAY] = tm.tm_wday;
>  
>  	/* If the square wave output is controlled in the weekday register */
>  	if (clientdata->features & M41T80_FEATURE_SQ_ALT) {
> @@ -261,18 +301,6 @@ static int m41t80_rtc_set_time(struct device *dev, struct rtc_time *tm)
>  		return err;
>  	}
>  
> -	/* Clear the OF bit of Flags Register */
> -	flags = i2c_smbus_read_byte_data(client, M41T80_REG_FLAGS);
> -	if (flags < 0)
> -		return flags;
> -
> -	err = i2c_smbus_write_byte_data(client, M41T80_REG_FLAGS,
> -					flags & ~M41T80_FLAGS_OF);
> -	if (err < 0) {
> -		dev_err(&client->dev, "Unable to write flags register\n");
> -		return err;
> -	}
> -
>  	return err;
>  }
>  
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

