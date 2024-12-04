Return-Path: <linux-rtc+bounces-2663-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C42A9E3231
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Dec 2024 04:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52B872811DB
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Dec 2024 03:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F78B130A54;
	Wed,  4 Dec 2024 03:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eMzldv+w"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A966817BA1
	for <linux-rtc@vger.kernel.org>; Wed,  4 Dec 2024 03:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733283444; cv=none; b=j+R+c9DtamMpkbAdnkPOg/niRohKGy/nO09bd6iMy7tLUw55NH82cvtZOOTX+EK9vBuUx1Ymo3Rdg7Wy5pIjseH0HFqQtWsE2g6TCAXng6nYBPOni8mYTb7EFKg3ZLyUTGtgwp4+PjdeJdSlKzytXu7LmBpj2V5UkGrAlJlieWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733283444; c=relaxed/simple;
	bh=y0KcVWzxf8k+OW8KP5/u4isksBDyAWvSuLdRgKfIlM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lb09z3VFxKNtm062bHvKuRStGFFmjM783Pr8oCtq8l0VMqzneExrr6ChfeEz0NEXySm4YEgLPMF2ISJ6pTK5Qw6gnvXfcNvir5UoPaX6f2fDFTOdAz7I3zKzONSkFy0utMzwTi9lDxselAcy+zjkyFUHx6hePfjMSNPWXgVzp3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eMzldv+w; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21145812538so50109275ad.0
        for <linux-rtc@vger.kernel.org>; Tue, 03 Dec 2024 19:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733283441; x=1733888241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e1EbTaJONCC4UxWr9Do6ym6s17dMBNgiZQqtVLBSMas=;
        b=eMzldv+wkzqjo0s6PHzWH5ZlJ7X7sxH7/i77nlEsFPO/85eELM1SreWu3OdhLHI3Sp
         UcnQt9lOYvrDvGKZ4LjUOqEdjGQ6laLY9G3Ihl8I2+fPC16giSlaLO+8c0b85vxcHBl+
         aFCWnNAcYWrRgw4fUCT7Po6GuzVwNVtbO/IviFRg7uiwGJ22Q+jFqU4UaS0ayfZz75ly
         rXVydoQoussCzQRdrJl6LsMe9OXjCsLxbeFhO/y/pGmYx0+0ZVcvq3MpnTS6Wau8u0JQ
         1Hu4FMg9oodYjht/JUGT9Ag4V80hzOiwJHjHH4w3mHO7zrNgo/CsntHppGuoW8TkZENG
         kGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733283441; x=1733888241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1EbTaJONCC4UxWr9Do6ym6s17dMBNgiZQqtVLBSMas=;
        b=v5mDYCZKc9ahBMBKDfl5tZp+L696p7V7gVP2EwwKcrixPNiRte0vGPg9MAiAgcdkhp
         NDcKIWgu88GGKUTNdDT/HNot5I0csUzjs6tGtIdecWqBsgw+Qu+Hk74kReHsTeuN0rpc
         24tZGr1xrxscZXUeZ8B/cx+hmhu149qq5T9TvA3xyeQX+3GAHqlFF06v3+BESotcpHT3
         2OAZ/qAXdbb4GQbR2aZnYzRTxZDPv+oMbxSFamrOaC0s5TKpBoB8XaH/0E4afViFn/oX
         5pQNAZYDIy+IOEqGuomJ6ZbJjgzo2Zjqz+XEjwgkNSnKyJX6RfFZdBG5gkw9rR/Z2Eyz
         34hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYqqWykWZrrZSxexLR4EHEN8/NW4dRqnDnHRVzrxdQiM90sfCLjnO5L1dHrTcLgDOOjWJSIfXeDXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKLzhO7dQEGueHi1YE1vWc8ZpDzCuniSr0TxP2+pvTDeClzQC0
	s74gsr+a5uiTAmz9jo9AamE1wfC9NQSOFuUAl4DvrgEeVk+qkLyFs6Egr39uTDE=
X-Gm-Gg: ASbGncvAlAcm4Lv+xZReEUzWvGwxPJ+lUFDr+HFCoSjgO0bapcyVaUqLIf4KQPPfIzY
	0IS+RPjNcgGOHPPVo2vVW0lrQw2ilMRaJ/+ciWSFwGYgR2X8fkWm/V2m1e1pVErjQSMeLy0i5BT
	O50xDbIxxxSR9FWYuIREY4ycMT9Dw6KlRz/1X48wNkyuk0tSbnMkL4RNFQYL05inoT7OU6qZ7fc
	987Fw1KIJtg9s2EbsCXJEvSTJ8QCZDcvNu7OsAaPJOUO4WB6yqV
X-Google-Smtp-Source: AGHT+IFXmIlXRzom3LjevUtmLAA7oE7u/5XJYi4THo7kTNIKMaiJhELqE4B6Y4ifEaHbF1jFv2F1Bw==
X-Received: by 2002:a17:902:ec87:b0:212:63db:bb15 with SMTP id d9443c01a7336-215bd16f521mr78217995ad.38.1733283440999;
        Tue, 03 Dec 2024 19:37:20 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521904caasm102256815ad.60.2024.12.03.19.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 19:37:20 -0800 (PST)
Date: Wed, 4 Dec 2024 09:07:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: RTC_DRV_SPEAR should not default to y when
 compile-testing
Message-ID: <20241204033715.xzojqni2byocnt5m@vireshk-i7>
References: <7b8eefe3b0150101ba01c3ea55e45aa3134059ba.1733243007.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b8eefe3b0150101ba01c3ea55e45aa3134059ba.1733243007.git.geert+renesas@glider.be>

On 03-12-24, 17:25, Geert Uytterhoeven wrote:
> Merely enabling compile-testing should not enable additional
> functionality.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/rtc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index a60bcc791a4803b7..0bbbf778ecfa3e4c 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1316,7 +1316,7 @@ config RTC_DRV_SC27XX
>  config RTC_DRV_SPEAR
>  	tristate "SPEAR ST RTC"
>  	depends on PLAT_SPEAR || COMPILE_TEST
> -	default y
> +	default PLAT_SPEAR
>  	help
>  	 If you say Y here you will get support for the RTC found on
>  	 spear

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

