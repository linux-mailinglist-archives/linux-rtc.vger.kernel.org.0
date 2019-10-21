Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4144DF291
	for <lists+linux-rtc@lfdr.de>; Mon, 21 Oct 2019 18:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729814AbfJUQMo (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 21 Oct 2019 12:12:44 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33538 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfJUQMn (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 21 Oct 2019 12:12:43 -0400
Received: by mail-pg1-f193.google.com with SMTP id i76so8107024pgc.0;
        Mon, 21 Oct 2019 09:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=/dL9nLuK//vgQyX5Tc3It+b5p3m0IezAp1ZjZvVIvrg=;
        b=YBfXwwUKf7dakUvfxv+rUEpoRtKWbXyXzyTfWnn2/IDrjdpQpxROPAtJcJVSm/lSN7
         k88v4hiCNKo6qjaN+6IZOpjgnjWim+9rzYfBj5yCC9/Zw3qGOtYJ98cdzTi3csyY72yH
         TQ5lcRjFESz2VWnAluDd10rO0Z2Pgl4vtJ999C9UFXwfcItZJ0IGnWpKQepOr7GPIczF
         HgpxIo5i5b7NMtMHHB+tygqs+q9qqIGO2hx2sINxmrQTwRisSoAOOHYR9ho4TpH9ZauJ
         SPgfSmT1Sb3Ywp+5ZzbQhm3TaBrOIzW7rgd5OgBDuQrhplxqLZuVFr1o1CrdpFKpN1bi
         97Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=/dL9nLuK//vgQyX5Tc3It+b5p3m0IezAp1ZjZvVIvrg=;
        b=pYlrO1bf8oTxT8jiHV9ZYn71GM4K9k9Mwwg1TT52HpKaAbwt7ggDAUDRi1k5ud6WOr
         no1YIWv7tac3jKrWgjf2G5H/X7UwVLwTZYdrayaMB7z/gzvCdHPl/aJkm+qyDNCbesRH
         TK9Evh4+Ubbvqe/LZ0ziFaDOOxiM4emxoE+ctR+eArvH2usOm6wPWihQY7TzH/1D6hLZ
         OWhloDiZBGM353NsUyc85co2xaBfgssvyFnK0VuOcUAau6Uv/20+70M9Q47HrfK7Uh23
         cklHCf0QBo4SxTJrkcdoRpEiwsWwyEIVgIlHBK2HBAL81G0VEjiMDNqLdEPuRF7LcE6M
         RHQQ==
X-Gm-Message-State: APjAAAWWycfFwWSb0UIfNWGq3T70TY92i2rh3mr8UD9+PM40LD7GNnsC
        KXkUuZfoaMYNnpU5BJF6Cso=
X-Google-Smtp-Source: APXvYqwUvkny6Awzbacc3lubZcUHkXPgxlD3v+5dRnon48R2bTj1aPfiuUkBE4TVJkeyKRuVbDnSuQ==
X-Received: by 2002:a17:90a:1b28:: with SMTP id q37mr30079122pjq.91.1571674362763;
        Mon, 21 Oct 2019 09:12:42 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 62sm15795256pfg.164.2019.10.21.09.12.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 09:12:41 -0700 (PDT)
Date:   Mon, 21 Oct 2019 09:12:39 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Martin =?iso-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Bruno Thomsen <bruno.thomsen@gmail.com>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCHv3] rtc: pcf2127: handle boot-enabled watchdog feature
Message-ID: <20191021161239.GA17104@roeck-us.net>
References: <20191003133351.118538-1-martin@geanix.com>
 <20191021080838.2789-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191021080838.2789-1-martin@geanix.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Oct 21, 2019 at 10:08:38AM +0200, Martin Hundebøll wrote:
> Linux should handle when the pcf2127 watchdog feature is enabled by the
> bootloader. This is done by checking the watchdog timer value during
> init, and set the WDOG_HW_RUNNING flag if the value differs from zero.
> 
> Signed-off-by: Martin Hundebøll <martin@geanix.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Change since v2:
>  * remove logging in case of error
> 
> Change since v1:
>  * remove setting of WDOG_HW_RUNNING in pcf2127_wdt_start()
> 
>  drivers/rtc/rtc-pcf2127.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 02b069c..ba5baac 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -417,6 +417,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  			const char *name, bool has_nvmem)
>  {
>  	struct pcf2127 *pcf2127;
> +	u32 wdd_timeout;
>  	int ret = 0;
>  
>  	dev_dbg(dev, "%s\n", __func__);
> @@ -459,7 +460,6 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  	/*
>  	 * Watchdog timer enabled and reset pin /RST activated when timed out.
>  	 * Select 1Hz clock source for watchdog timer.
> -	 * Timer is not started until WD_VAL is loaded with a valid value.
>  	 * Note: Countdown timer disabled and not available.
>  	 */
>  	ret = regmap_update_bits(pcf2127->regmap, PCF2127_REG_WD_CTL,
> @@ -475,6 +475,14 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  		return ret;
>  	}
>  
> +	/* Test if watchdog timer is started by bootloader */
> +	ret = regmap_read(pcf2127->regmap, PCF2127_REG_WD_VAL, &wdd_timeout);
> +	if (ret)
> +		return ret;
> +
> +	if (wdd_timeout)
> +		set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
> +
>  #ifdef CONFIG_WATCHDOG
>  	ret = devm_watchdog_register_device(dev, &pcf2127->wdd);
>  	if (ret)
> -- 
> 2.7.4
> 
