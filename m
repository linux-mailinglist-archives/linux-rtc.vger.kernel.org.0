Return-Path: <linux-rtc+bounces-1363-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9150C90F064
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Jun 2024 16:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9783D1C2211A
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Jun 2024 14:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B012D17556;
	Wed, 19 Jun 2024 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYk5I+4S"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035141DDE9
	for <linux-rtc@vger.kernel.org>; Wed, 19 Jun 2024 14:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718807107; cv=none; b=qHKDo6kFes94ZSvJEKD7ntjbear4eEq9F3PjLTmo/BERBoKlr+iKEWs/XfS1dJE48lSLmKaeuCwyKoaVcdYSmwFHPMP0mLjJn3tl6tcIhU3ZsbyoR0AU4A+ZANyzIe5mmb7eUEeNpbP4oUgVRDKIn8SpfoHMNfK7HsJ82rfSesQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718807107; c=relaxed/simple;
	bh=n6TFWjr1qfcfdJNakWJPcORXpMu7m9+x3SeNRQxil+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcKjOQvjqjdjZlpoZKoN4ExYUhz2sE8XsOZtmb69DLoc2P6SI6Xa6Bp5PctQYseTS+ppvZ7Z61jPKc82sjy1Ah6yBses2kAh3Y4mvGHsWmAkH5GydFlvEqCT+ldipQTEaalkmbqf85Q/U4ogOzNtMIWuEJJwgZGAsLAXRXDMfGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYk5I+4S; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a63359aaacaso1060210266b.1
        for <linux-rtc@vger.kernel.org>; Wed, 19 Jun 2024 07:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718807104; x=1719411904; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jsbF2G9GPWGk98l963ty7sImfdp4otXJk0rZf4TrC6I=;
        b=IYk5I+4SRflz6G7uVQp8qGzbBaCLqDqlLj9y3GeIBpb99YbvZB1Jm7m0/i0vokWq6B
         1qYQzbyCJGS815X3zrg3y1mx1qPMN5MQhddOh3hKUVED30fnspTDEPwjIZ/4FILxO4Jw
         QvE/EJHZUTalS42FJ1T/ZSH/5SUyPE9M+gboybBTPSpektgSJYcmC2VSjP9HKL5ucOHq
         wauo4ergcALJJfUkNUxBaofdiwVMMzYcW++WYZSOBY1jDxO3E33zYG1jfmPJ+hmuLF+P
         5urTYq0t7+YH20L9Y877VWb83aHbjO3EKOTyAdbT1/E9uowaowYGpjpNij1Aps0tjLCT
         YoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718807104; x=1719411904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsbF2G9GPWGk98l963ty7sImfdp4otXJk0rZf4TrC6I=;
        b=gzgg1F6Zd/2yMvtQLiDr0k8j9NWtF44HhbLc6cfi7mwEC5pws1Ci1FZEjLMU3puUW3
         BkI02n+3at3wCuC4YdjKDCboqVXHx78fTD5FMkKvlYxzQ+NrFUixypq66oS22w0UgS/e
         Y3sg+qHP3mccBZ+948sCzupkb5mjst5MEEQAhqVV6/Bex6QMStDBDBzHRQpTnMoo8GXT
         rkT4TnnRwcOoqCWlEPq2bviCWkA+7HMmMxxfBRXZI7Py1HcToqoRYGe+OJQ+CusVKO3S
         +OWMC4Dpj2aiqN9VzJmoEU1eyprVEMThuOtJl6KQNpuIVlk/dnZbmLDucPqwb8TVpEyU
         6wuA==
X-Gm-Message-State: AOJu0YyNHsN0x8rR9zJHqhxW1m4nELA/7PkG+z5GsCcFY0SIGeJpa9/r
	ZHBxAowAly5e3Eh/N8qHdOA52iycT6biggLlAagTksCpulN1V/3IN/Kv2T9M
X-Google-Smtp-Source: AGHT+IETZNIKSxXLN1CFS1XgUE2QKxnVJ+9sgjT6YOKNLbCTEIvwA0FNu2MrILJS4umzMy3AkDqotw==
X-Received: by 2002:a17:906:a28a:b0:a6f:1ad7:6875 with SMTP id a640c23a62f3a-a6fab7d0479mr131580066b.69.1718807103746;
        Wed, 19 Jun 2024 07:25:03 -0700 (PDT)
Received: from ubuntu2204 (fgw-godollo.uni-mate.hu. [192.188.242.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f41721sm670572866b.154.2024.06.19.07.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:25:03 -0700 (PDT)
Date: Wed, 19 Jun 2024 16:25:01 +0200
From: =?utf-8?B?VMOzdGggSsOhbm9z?= <gomba007@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: csokas.bence@prolan.hu
Subject: Re: [PATCH v2] drivers: rtc: Add driver for SD2405AL.
Message-ID: <txopbpwj7pwrwzdal272hosxkd7r7swxhjqgybyizyml4ekalo@wlu24zso3csk>
Reply-To: linux-rtc@vger.kernel.org
References: <20240619-rtc-sd2405al-v2-1-39bea29bd2a5@gmail.com>
 <cb7bbf45-033e-41dd-88cb-9937e19989e6@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb7bbf45-033e-41dd-88cb-9937e19989e6@prolan.hu>

Hi!

> > +	/* enable write, order is important */
> > +	reg = SD2405AL_REG_CTR_BASE + SD2405AL_REG_CTR2;
> > +	val = SD2405AL_BIT_WRTC1;
> 
> Here I wouldn't do CTR_BASE + REG_CTRx, just leave it as in v1. I only
> suggested the base+offset for the alarm registers, because their layout is
> the same as the time registers, i.e. REG_ALARM_SEC = ALARM_BASE + REG_SEC.

Sure, I'll change it.

> > +	/*
> > +	 * CTR2.IM = 0, single event alarm
> > +	 * CTR2.S{1,0} = 0, disable INT pin
> > +	 * CTR2.FOBAT = 0, interrupt enabled during battery backup mode
> > +	 * CTR2.INTDE = 0, countdown interrupt disabled
> > +	 * CTR2.INTAE = 0, alarm interrupt disabled
> > +	 * CTR2.INTFE = 0, frequency interrupt disabled
> > +	 */
> > +	ret = regmap_write(sd2405al->regmap, reg, val);
> 
> Maybe you could #define all these? Just a suggestion though. And even `reg`
> and `val` are not really needed, you could just as easily use:

I did not want to define to many things I do not use
(like alarm registers in v1).

> + regmap_write(sd2405al->regmap, SD2405AL_REG_CTR2,
> + 	SD2405AL_BIT_WRTC1);

Yes, if I go back to the v1 registers, these calls will be simplified.

> > +	w32 = data[SD2405AL_REG_CTR1];
> > +	w32 &= (SD2405AL_BIT_WRTC2 | SD2405AL_BIT_WRTC3);
> > +
> > +	w1 = data[SD2405AL_REG_CTR2];
> > +	w1 &= SD2405AL_BIT_WRTC1;
> > +
> > +	return (w32 != 0) && (w1 != 0);
> 
> Here you could also do away with `w1` and `w32`.

They are there to keep the lines short.

> > +static int sd2405al_read_time(struct device *dev, struct rtc_time *time)
> > +{
> > +	u8 hour;
> > +	u8 data[SD2405AL_NUM_T_REGS] = { 0 };
> > +	struct sd2405al *sd2405al = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	/* check if the device is powered on/working */
> > +	ret = sd2405al_check_writable(sd2405al);
> > +	if (ret == 0) {
> > +		dev_err(sd2405al->dev, "invalid device status\n");
> 
> Do you really need the RTC to be writable for read_time()?

This is just a check to verify if the device is functioning correctly.
I tried to use CTR1.RTCF for this, as you suggested, but it only works if
the device is battery-powered. Since the device is configured to be writable
in `setup()`, this check must pass.

> > +static int sd2405al_set_time(struct device *dev, struct rtc_time *time)
> > +{
> > +	u8 data[SD2405AL_NUM_T_REGS];
> > +	struct sd2405al *sd2405al = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = sd2405al_check_writable(sd2405al);
> > +	if (ret == 0) {
> > +		dev_err(sd2405al->dev, "device is not writable\n");
> 
> Couldn't you set it writable here? Instead of doing it in probe()?

I use the writable state as an indicator to see if the device is working
as expected.

> Also, you could rename sd2405al_setup() to sd2405al_set_writable() so it is
> clear that that's what it does.

It is setting the initial state of the registers as well.

János


