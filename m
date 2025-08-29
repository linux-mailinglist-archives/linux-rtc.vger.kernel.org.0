Return-Path: <linux-rtc+bounces-4787-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 740C0B3B9C4
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Aug 2025 13:11:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CEF51C81AAD
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Aug 2025 11:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8372311C1E;
	Fri, 29 Aug 2025 11:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQBplTPW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9D4CA52;
	Fri, 29 Aug 2025 11:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756465891; cv=none; b=nLgN6YhdjdeiMIuLx5t9NXPuip1nYQZk/Ot5MnZFGxo+PedqrCHk2rMB2GKkkCKxg2hkT2SjEJnQcL0TVRDjoeXXQ0jbw1KwxE9KHbaDcwLC/SB1/exU4usrSojhG/CavfddftYcudla3ZfMCaWTodR/sTYSvYN566S2qO4znzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756465891; c=relaxed/simple;
	bh=GrchNdWYzgpQWMdULTh27jCHo9UrMJz3lOa3PgY0Ixk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwQDdYLzfN7rsqS5itwvmuXy1bGzcTk8UYFDcqsOEeZDZUTAMskaKnNo6JdT7vp0o5GQprFM1pbcoCDUUYpSTCT/Mp3VXY8K8sqTUY99HAerHBWGFLoVIcfbfUc6QDZUhCIC4athFRwzpkI8J6MnfG65rEyACSj7d6zHOp5G7aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQBplTPW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so1173040f8f.3;
        Fri, 29 Aug 2025 04:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756465888; x=1757070688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9WLYDZuVT2T68gRNe6jq6AaWcsJa7DLlaSxR9N646BA=;
        b=GQBplTPWktloObVr19C61928nVAz2TpVUMT2i5+FpBbfNZMYScVCKp9EBejU89D9Cg
         1IJltBNXsV1VWRPC6lcqS4yV1fUI2zXtdFiBCqHKM4SDXGFVl9IPoxCPLwlBuUHkr9Bq
         Eagc8HZuea190zbiyNdFOUqMch1bJfFFBtzma9hgXK2BL914DC6MGKz/Wevju8I2a9Fx
         nSL+/ofuAFjyeM66P4m7V+dHQ3XSUi9EKgiWgRmGRSaQc6UTp61VzwkKZgiz2pRd+BUE
         MPa6g7aZYoJD4nTKIZr02mQZEFmO9TnZ31qvSjHhhWjtj9kB/CT6E8lkyVu8Y20TXYWw
         946w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756465888; x=1757070688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WLYDZuVT2T68gRNe6jq6AaWcsJa7DLlaSxR9N646BA=;
        b=Njy8lPUsk+KPgwSrFkNiZy7ot8O6FllFE0qOjmd/vXlo3PasfzoRvPcCPUEPcd0hP2
         v/54FKPFyHK1TwIGtxJfeXdaQEdfDgtgO3htJ3jUBT9jkbKFwdfIN3teGkfdPhCeSNiV
         a3P1rYv1dCEEMGnsMCzXwiXo6/a7W7+8EBG8qCGH8nqhp7AbpXENmOLEx8q9b1KOTGGD
         xxvIXTFu/o28ndgoiYPfZ/F8Pp9w44+m3A4t+fUxKf2dZnaW9A8CaGtQHiXyT1qOxdNY
         s9/2hk/m0zDhlEJBeJVLI+f5CqtOmoCtUX2n+lQ4nqJc6LNc43JYVXn/41RntMh/j2pb
         uHXw==
X-Forwarded-Encrypted: i=1; AJvYcCVC+4qdbODwoXvo3l/O8j22YfpBOIXKbHAzNGgOa3chCqZfecNivy1pbzJXzh0bQ3wmyUpf7BRSdJVAdOwx@vger.kernel.org, AJvYcCVVGsNSKxk5i4nl6FVyN0orFb/s2ohB8zkWMK9tWUpRb9xJ+mVRN4/6a9TVyVZz/BUkEzgtRY25k4e+3xM=@vger.kernel.org, AJvYcCVYnNcPYb8pkdZrqsC6u9USzqni4GW41GTF/YwAXSE3b6k6L5NmQBT22SslhAYiU8oNt2PvXpSMstQtjME=@vger.kernel.org, AJvYcCWQSlKqhr9gcuNxM5jIuR/m6zQ37hnv4CuQhiN1n8JfQ2BBFvTp6R/dOlVobw7rwK1Z3r64NmxWJGPG@vger.kernel.org, AJvYcCX+NhHhV94tux8ZcP1DvpROZvczus7lrv/dAX230qEXwA1TvKqrlZbKBIXe5dFDg71hCTdvhhnNvCpJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4NFYHEH6z/pS4TDm3EyDJuj8gLR19xDvAqh+VGu4yNhJmJ3dg
	3UkLYlNBgiQeEEL5/fMcL8Hvv+UrbjphQeZbUZOfedQlQP6Q1xUFTJ/t
X-Gm-Gg: ASbGncvq7WBRcKf6u8jRRaz1cZIzwySr6vW0x+ISc7FWubnJxGiCs4mJW9B0K1TF+hy
	8RLoIsPGOWhbywjdVyRuFAccqbq+zIwDKAS6SjdhohOTF6WY2eMB/j5tlBHRSxr/J/bFGRHc4bt
	ItnhucAK/TyApOismugjqcSE8ucnMjDCOzlPE5Btb63g9i/bB5KPor/CqU4pE/ko7buvtGRdYiS
	uMCzItCNJ2ILAR56A2iHZN0EinVxBVelcOtW0OSQ4Q4pTpuDqCQjI+xp27EALftZEE5b36Fpqtv
	pF2tGcXOy9Dvjwj97loNB9CMb7WHNJR4piwNWn5fS2VFeNxNEBAibHfs5XcMWmeekvBDSFqSsFy
	otthXsRvCtyrbh01zHfHzbXy0MaJt8UGG5oQ43rzL7lA76A==
X-Google-Smtp-Source: AGHT+IEhgsyB+xV4naRe7U+vGBG91GNLDzqLCMMGY7f5dp8nau5ERArTK4tcf5uChYU0pp1hjF9bJA==
X-Received: by 2002:a05:6000:2307:b0:3d0:ebf6:90d2 with SMTP id ffacd0b85a97d-3d0ebf69376mr1035051f8f.43.1756465887932;
        Fri, 29 Aug 2025 04:11:27 -0700 (PDT)
Received: from google.com (brn-rj-tbond06.sa.cz. [185.94.55.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf270fbe7dsm2929064f8f.9.2025.08.29.04.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 04:11:27 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:11:22 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 07/11] input: macsmc-hid: New driver to handle the
 Apple Mac SMC buttons/lid
Message-ID: <qffp7kadq3xojla5k6f5pr37irgytqfsqvabr6ydvulxnkcgnn@bv5mrraxrhhe>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250827-macsmc-subdevs-v2-7-ce5e99d54c28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-macsmc-subdevs-v2-7-ce5e99d54c28@gmail.com>

Hi James,

On Wed, Aug 27, 2025 at 09:22:41PM +1000, James Calligeros wrote:
> +static void macsmc_hid_event_button(struct macsmc_hid *smchid, unsigned long event)
> +{
> +	u8 button = (event >> 8) & 0xff;
> +	u8 state = !!(event & 0xff);
> +
> +	switch (button) {
> +	case BTN_POWER:
> +	case BTN_TOUCHID:
> +		if (smchid->wakeup_mode) {
> +			if (state)
> +				pm_wakeup_hard_event(smchid->dev);
> +		} else {
> +			input_report_key(smchid->input, KEY_POWER, state);
> +			input_sync(smchid->input);
> +		}

I believe you should be using pm_wakeup_event() in all cases so that
pressing power would interrupt suspend even if resume() handler has not
been run yet. Also I do not think suppressing KEY_POWER is needed.
Userspace should be smart and decide whether to shutdown the system or
not when receiving KEY_POWER depending on the overall system state.

...
> +
> +static int macsmc_hid_probe(struct platform_device *pdev)
> +{
> +	struct apple_smc *smc = dev_get_drvdata(pdev->dev.parent);
> +	struct macsmc_hid *smchid;
> +	bool have_lid, have_power;
> +	int ret;

	int error;

> +
> +	/* Bail early if this SMC neither supports power button nor lid events */
> +	have_lid = apple_smc_key_exists(smc, SMC_KEY(MSLD));
> +	have_power = apple_smc_key_exists(smc, SMC_KEY(bHLD));
> +	if (!have_lid && !have_power)
> +		return -ENODEV;
> +
> +	smchid = devm_kzalloc(&pdev->dev, sizeof(*smchid), GFP_KERNEL);
> +	if (!smchid)
> +		return -ENOMEM;
> +
> +	smchid->dev = &pdev->dev;
> +	smchid->smc = smc;
> +	platform_set_drvdata(pdev, smchid);
> +
> +	smchid->input = devm_input_allocate_device(&pdev->dev);
> +	if (!smchid->input)
> +		return -ENOMEM;
> +
> +	smchid->input->phys = "macsmc-hid (0)";
> +	smchid->input->name = "Apple SMC power/lid events";
> +
> +	if (have_lid)
> +		input_set_capability(smchid->input, EV_SW, SW_LID);
> +	if (have_power)
> +		input_set_capability(smchid->input, EV_KEY, KEY_POWER);
> +
> +	ret = input_register_device(smchid->input);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register input device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (have_lid) {
> +		u8 val;
> +
> +		ret = apple_smc_read_u8(smc, SMC_KEY(MSLD), &val);
> +		if (ret < 0)
> +			dev_warn(&pdev->dev, "Failed to read initial lid state\n");
> +		else
> +			input_report_switch(smchid->input, SW_LID, val);
> +	}
> +
> +	if (have_power) {
> +		u32 val;
> +
> +		ret = apple_smc_read_u32(smc, SMC_KEY(bHLD), &val);
> +		if (ret < 0)
> +			dev_warn(&pdev->dev, "Failed to read initial power button state\n");
> +		else
> +			input_report_key(smchid->input, KEY_POWER, val & 1);
> +	}

Since you are doing this to seed initial switch/button state I would do
this before registering input device (this is safe to do so).

Thanks.

-- 
Dmitry

