Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49A3B559EAF
	for <lists+linux-rtc@lfdr.de>; Fri, 24 Jun 2022 18:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbiFXQdq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 24 Jun 2022 12:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiFXQdp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 24 Jun 2022 12:33:45 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94BFA3EF0B
        for <linux-rtc@vger.kernel.org>; Fri, 24 Jun 2022 09:33:43 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 8F4AFC0003;
        Fri, 24 Jun 2022 16:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1656088422;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=l2Z+vjoI2G0lQ95xYSFzeLwhWUjbA9AWtY/N+5yRLRI=;
        b=ZYKOx3zmhYgFkw5Iv2PHBTEPbCbfoWllsx0qT1bfU4YeKFvxeGtqUUT4WUCEaRszuPPO34
        HCLHW5GV8vyXhSETF1fp1D1EgNptqzMhF0M6QdN6gf/CmXPmw4JGRme1s2IRU70+6Yr7nq
        qzPg7zl2ceCTHD2GeKxUd1xb/TIn9envxjqXok6OPKfgX4fO8heMKtFoVLzA0fp+4nrdDZ
        2ofDIp8KC8juoFHLW1UY6gn00mllnkN59rU0NqW/VDIxaMV0ZiO0PUgCDxPyrctrh4Qzsc
        GOZw+dDzQN7gjGPfb5qlUvrPSj8n9Qgv+DU8gOAJEEijRx9poTw3kXoNcAecUg==
Date:   Fri, 24 Jun 2022 18:33:38 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH 5/5] rtc: rv8803: invalidate date/time if alarm time is
 invalid
Message-ID: <YrXnYn85FBMQtGc9@mail.local>
References: <20220426071056.1187235-1-s.hauer@pengutronix.de>
 <20220426071056.1187235-6-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426071056.1187235-6-s.hauer@pengutronix.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Sascha,

Sorry for the very late review. I'm mostly fine with the whole series.

On 26/04/2022 09:10:56+0200, Sascha Hauer wrote:
> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
> 
> RTC core never calls rv8803_set_alarm with an invalid alarm time,
> so if an invalid alarm time > 0 is set, external factors must have
> corrupted the RTC's alarm time and possibly other registers.
> 
> Play it safe by marking the date/time invalid, so all registers are
> reinitialized on a ->set_time.
> 
> This may cause existing setups to lose time if they so far set only
> date/time, but ignored that the alarm registers had an invalid date
> value, e.g.:
> 
>   rtc rtc0: invalid alarm value: 2020-3-27 7:82:0
> 
> These systems will have their ->get_time return -EINVAL till
> ->set_time initializes the alarm value (and sets a new time).
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/rtc/rtc-rv8803.c | 46 +++++++++++++++++++++++++++++++---------
>  1 file changed, 36 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
> index fe1247e771b98..036c449cf1c20 100644
> --- a/drivers/rtc/rtc-rv8803.c
> +++ b/drivers/rtc/rtc-rv8803.c
> @@ -70,6 +70,7 @@ struct rv8803_data {
>  	struct mutex flags_lock;
>  	u8 ctrl;
>  	u8 backup;
> +	u8 alarm_invalid:1;
>  	enum rv8803_type type;
>  };
>  
> @@ -165,13 +166,13 @@ static int rv8803_regs_init(struct rv8803_data *rv8803)
>  
>  static int rv8803_regs_configure(struct rv8803_data *rv8803);
>  
> -static int rv8803_regs_reset(struct rv8803_data *rv8803)
> +static int rv8803_regs_reset(struct rv8803_data *rv8803, bool full)
>  {
>  	/*
>  	 * The RV-8803 resets all registers to POR defaults after voltage-loss,
>  	 * the Epson RTCs don't, so we manually reset the remainder here.
>  	 */
> -	if (rv8803->type == rx_8803 || rv8803->type == rx_8900) {
> +	if (full || rv8803->type == rx_8803 || rv8803->type == rx_8900) {
>  		int ret = rv8803_regs_init(rv8803);
>  		if (ret)
>  			return ret;
> @@ -238,6 +239,11 @@ static int rv8803_get_time(struct device *dev, struct rtc_time *tm)
>  	u8 *date = date1;
>  	int ret, flags;
>  
> +	if (rv8803->alarm_invalid) {
> +		dev_warn(dev, "Corruption detected, data may be invalid.\n");
> +		return -EINVAL;
> +	}
> +
>  	flags = rv8803_read_reg(rv8803->client, RV8803_FLAG);
>  	if (flags < 0)
>  		return flags;
> @@ -313,10 +319,16 @@ static int rv8803_set_time(struct device *dev, struct rtc_time *tm)
>  		return flags;
>  	}
>  
> -	if (flags & RV8803_FLAG_V2F) {
> -		ret = rv8803_regs_reset(rv8803);
> +	if ((flags & RV8803_FLAG_V2F) || rv8803->alarm_invalid) {
> +		/*
> +		 * If we sense corruption in the alarm registers, but see no
> +		 * voltage loss flag, we can't rely on other registers having
> +		 * sensible values. Reset them fully.
> +		 */
> +		ret = rv8803_regs_reset(rv8803, rv8803->alarm_invalid);
>  		if (ret)
>  			return ret;
> +		rv8803->alarm_invalid = false;
>  	}
>  
>  	ret = rv8803_write_reg(rv8803->client, RV8803_FLAG,
> @@ -342,13 +354,27 @@ static int rv8803_get_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  	if (flags < 0)
>  		return flags;
>  
> -	alrm->time.tm_sec  = 0;
> -	alrm->time.tm_min  = bcd2bin(alarmvals[0] & 0x7f);
> -	alrm->time.tm_hour = bcd2bin(alarmvals[1] & 0x3f);
> -	alrm->time.tm_mday = bcd2bin(alarmvals[2] & 0x3f);
> +	alarmvals[0] &= 0x7f;
> +	alarmvals[1] &= 0x3f;
> +	alarmvals[2] &= 0x3f;
> +
> +	if (bcd_is_valid(alarmvals[0]) && bcd_is_valid(alarmvals[1]) &&
> +	    bcd_is_valid(alarmvals[2])) {
> +		alrm->time.tm_sec  = 0;
> +		alrm->time.tm_min  = bcd2bin(alarmvals[0]);
> +		alrm->time.tm_hour = bcd2bin(alarmvals[1]);
> +		alrm->time.tm_mday = bcd2bin(alarmvals[2]);
>  
> -	alrm->enabled = !!(rv8803->ctrl & RV8803_CTRL_AIE);
> -	alrm->pending = (flags & RV8803_FLAG_AF) && alrm->enabled;
> +		alrm->enabled = !!(rv8803->ctrl & RV8803_CTRL_AIE);
> +		alrm->pending = (flags & RV8803_FLAG_AF) && alrm->enabled;
> +	}
> +
> +	if ((unsigned)alrm->time.tm_mday > 31 ||

You'd need to use (unsigned int) here, else I'll get follow up patches
doing the conversion. My only issue is actually this check as it would
be better to use rtc_valid_tm that checks tm_month but obviously, your
rtc_tm is missing information at this time and this would require to
replicate what is done in __rtc_read_alarm. I don't have a great
solution to that though

> +	    (unsigned)alrm->time.tm_hour >= 24 ||
> +	    (unsigned)alrm->time.tm_min >= 60) {
> +		rv8803->alarm_invalid = true;
> +		return -EINVAL;
> +	}


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
