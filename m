Return-Path: <linux-rtc+bounces-2719-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE5C9EE2C7
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 10:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61DBB2808BD
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 09:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C47420E71E;
	Thu, 12 Dec 2024 09:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hamAn7Vp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E58D20FAB5
	for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 09:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733995264; cv=none; b=otu01a9qrjKDzXTgAygEzPmk529b4r2vYZHihwl7OI8VD6IzEnco9nWHJJ9LNCquNFFNt1j04l0tqF2j4NRMe7BN6ySaANXgEKmPj6EJk3REG1PZKkXwjg13/mZDOS/F9x/jpczq2rtX7tGV7xgsWGS79sn6vBgkmSzk13MYVXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733995264; c=relaxed/simple;
	bh=oj2aaLYOHzCGD8CBRDOpwkmj+MVjcVHGfKQn9ONCA3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkWbxIMmkw9G+YJ2dVu8xeXiQfMqg5bnV7i43MFQQzCkSHQX4QQm3ZwwRkGaJi8gND7UuFwowulPzUD9m/aRMh3I2G2j6N59gXnaTdG0VxMGeMGZmWmq4iOlVuKK0l3T8jAYeZwFNoaBxyWGsUNhn3cWFqug5855ghsQCpJmTUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hamAn7Vp; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53f22fd6832so411218e87.1
        for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 01:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733995261; x=1734600061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e/J14StI5NaV2TKRdlHg/E4dfPPU4t+K5491bgm5G8s=;
        b=hamAn7VpIAozg6A55XqTNGuJCnpeFrX0mVQ2UsYQq3cp9AV7QUQmtBqjTwMNczxdyf
         GoJoQPBGWRXeDuaBbH35cfHRPD06/bf9Z0yjdc9iDheSyJ2nvJ0WkuZ8857ejnd8aMWy
         vjAvZP45GQbhanTOlbbcqE378guFSUvRPTS8P4F9wDviOT7xOQcRtpwhBuH4Boau0Vi/
         RA6jZhsIwO1xvHCbNqfiQTLGW5oQzEmyUfS2/S0w4R/cEe5/2oucEo5zvb94QYKAWyNg
         sMPVBAee168jV3/CGvxSLem6EZWLD9abo/Cle2Q5pqrin+rMmkfBNqYjQB2PVQ3jk8L4
         7H2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733995261; x=1734600061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e/J14StI5NaV2TKRdlHg/E4dfPPU4t+K5491bgm5G8s=;
        b=BmkwGJwJA1h9EZfQW07QrkzHNivLZtqCk4aFpD4O6/slgxn6DyzUfCZZ+W1rLOyHWI
         gns1crxm9/RzJ8HRvNRvnpVbe4BqyF5AIfRUkPm3SgUEMcxRbNCowjGCmkxHIqcyFGzi
         x15t6Y0+17UxnoGBvc0uqxz77499vjkGgN+EylvAI5R5jsONq2oJpEw7GXZXlyxHVitx
         gL1Xza90NmHnKn+Z1H2FzISbsAmAgNcQoW+YpKCr5tJGo6Ha4fSVWSoEcX7KQ1IiVicH
         7PX/oMrPWtbZBkfxBH11QcdmL5qZY9TxxqPb/IlX0Bl5iGrlDU4MAl7NqijWpVQMUmHl
         D6Ww==
X-Gm-Message-State: AOJu0Yy9E0m270uxQnh+AdLjMrxPif0/caiGGCI/DBSHukUf3Et9fxzS
	ijQPQqCUN3CeyzDP66JffgZMCZ+XCo2wuTWFCbghEPTcqjEoLjL+/4zmTw==
X-Gm-Gg: ASbGncsqyTtMPLoASyhYrbXg7T/EV5eXhGzDfaTty2aKGUOs+1jObLxQ8wLzv+Fdwie
	1qDBCU2hVMoWkNU4n22U6M+uQMjhO3lAxgaeFQpOLugVRJwqiC2LC4fhoqf3StrkdXkXSajaj7X
	vB3Y4CqwyygBSGDaVMX2YNCY/Y855+MPFdw3Sa/IvLAJy8tRb+7LyMxEQv4qn9NEVLSutYcYR9Q
	pp/jtnp5UWP+CbVJiJrRUBo9NRIwQUXrmA7aSYoxYyCluvWlBfaNpjlJSc38XiTCG1r/A==
X-Google-Smtp-Source: AGHT+IEYwShR/mlM2rS7UkSR3wpb46o9WyWQ8ooiw1fceFYi6upaKj3xg6eky5lxYCZGtoHREOgEPw==
X-Received: by 2002:a05:6512:3b1f:b0:540:20a9:9abd with SMTP id 2adb3069b0e04-54032c3a50amr277087e87.6.1733995260425;
        Thu, 12 Dec 2024 01:21:00 -0800 (PST)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401b558447sm1463623e87.104.2024.12.12.01.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 01:20:59 -0800 (PST)
Message-ID: <e716f993-b92b-4060-b0a0-3cec4d1c8169@gmail.com>
Date: Thu, 12 Dec 2024 11:20:57 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: bd70528: disable wakeup in the error path of
 .probe()
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org
References: <20241212015121.3410941-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20241212015121.3410941-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Joe,

Thanks for the patch :)

On 12/12/2024 03:51, Joe Hattori wrote:
> Current code leaves the device's wakeup enabled in the error path of
> .probe(), which results in a memory leak. Therefore, add the
> device_init_wakeup(&device->dev, false) calls before returning an error.
> 
> This bug was found by an experimental static analysis tool that I am
> developing.
> 
> Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
>   drivers/rtc/rtc-bd70528.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
> index 954ac4ef53e8..50059f7ba6d0 100644
> --- a/drivers/rtc/rtc-bd70528.c
> +++ b/drivers/rtc/rtc-bd70528.c
> @@ -312,12 +312,12 @@ static int bd70528_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	device_set_wakeup_capable(&pdev->dev, true);
> -	device_wakeup_enable(&pdev->dev);
> +	device_init_wakeup(&pdev->dev, true);

Is there a reason to do this prior rtc-device allocation/registration?
If not, then the flow would be cleaner if this was done as the last step 
in probe() because we could omit the clean-up.

>   
>   	rtc = devm_rtc_allocate_device(&pdev->dev);
>   	if (IS_ERR(rtc)) {
>   		dev_err(&pdev->dev, "RTC device creation failed\n");
> +		device_init_wakeup(&pdev->dev, false);
>   		return PTR_ERR(rtc);
>   	}
>   
> @@ -328,10 +328,15 @@ static int bd70528_probe(struct platform_device *pdev)
>   	/* Request alarm IRQ prior to registerig the RTC */
>   	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, &alm_hndlr,
>   					IRQF_ONESHOT, "bd70528-rtc", rtc);
> -	if (ret)
> +	if (ret) {
> +		device_init_wakeup(&pdev->dev, false);
>   		return ret;
> +	}
>   
> -	return devm_rtc_register_device(rtc);
> +	ret = devm_rtc_register_device(rtc);
> +	if (ret)
> +		device_init_wakeup(&pdev->dev, false);
> +	return ret;
>   }
>   
>   static const struct platform_device_id bd718x7_rtc_id[] = {

Yours,
	-- Matti


