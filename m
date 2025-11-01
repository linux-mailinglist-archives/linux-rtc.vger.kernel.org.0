Return-Path: <linux-rtc+bounces-5237-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70316C28133
	for <lists+linux-rtc@lfdr.de>; Sat, 01 Nov 2025 16:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 26AF54E20BA
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Nov 2025 15:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2AF1C5F13;
	Sat,  1 Nov 2025 15:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="h0B+Iq8E"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EC83B2A0
	for <linux-rtc@vger.kernel.org>; Sat,  1 Nov 2025 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762009236; cv=none; b=YnCx4jpYQg8pMjNsTyoDLs60ej8iZiB41SRZPElYeqXnkkS0Egbhcxhq/ZyLstb+b2/aCaUCmcX7PnFHC0bJdcO6+uj/HurNaDOCrfeF9Bc1rt/VkOW/Dx0LJni0RgRK7Ac8wkUOUG1MzlZAZ4d8DPVzR45x+IRt1FqmZ0tIdJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762009236; c=relaxed/simple;
	bh=K3/b3jr5SBSHHuWefiHTx21BlqOp5dw/wmKirB+uwkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mZoV8urfPntUW3Yzl7Hj0soYmvtWZlSJs2LwRnV47pimd2gcx6yxhoEv2jH8rRpkvrobHBDFgWfw1YRmAPzpWSVPgXeiXD/tFbW2eIzPRO0a3FpgeSP7Fer0uwABToaJ9G4QCHwVcb0hI7tOFxZu8SgC2Va6P6UD7sga4qq6/q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=h0B+Iq8E; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-429c2f6a580so1218626f8f.1
        for <linux-rtc@vger.kernel.org>; Sat, 01 Nov 2025 08:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762009232; x=1762614032; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6g7/oxMyVMxygIoIjYSwO2RhZz+LTOeAZEKc76K6rk=;
        b=h0B+Iq8EMiI/uM3RZAgX45is0ksIrBB3vVl2jGbikXyVBEBEbbMt8OTwIgXqiaqnE0
         ucs3LLV6JzdaTbnxiu/RMFrKA9kQuTPdIX6agE7JSwIxKk+qitDmLXBNKG0fNT/GNADx
         4bmOgFiKdPRcOi+PcPAlqputBur/EAoS542l14bbEgiEhhOojXo3/LgelpSc/Kz1UYuC
         LaBooIMxJyL7BRhmNS+KcrDwlmfarj5GY3GqTniR8XSAM45v7j3i6glrMDuTo9AwHh04
         Lou4BD/aS4+AikEEfujubsUCw7OJFlL0R4tYUh3baCO5Lr4MUnlyw0rgNKGBGvM9SBP9
         FOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762009232; x=1762614032;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6g7/oxMyVMxygIoIjYSwO2RhZz+LTOeAZEKc76K6rk=;
        b=wdTzg4xll3vVwYS4/02Q3szxVqZsIq/JUMujS0wUPWdY3Kn+foQwV4dXWZUrx9+kGG
         B+tqbhaEKJ5jHngWlHSJhyGky7ZCoa6bmGIfqs6ixL0cGGboEJz0xKcn/X7tIFZTn5qF
         A5t6NgiRLu6df5sMG/p6ccSoyVqycf6yRORpqoB+0A5dGDGJMEGgbeqyZrunJSGgbnpO
         /uEje8G6xogI3LfAUg/Tih+nZAlrgLBy2FKtktCgu0GwEvEo3EgGVQLbjh5TGuWiCTSh
         OYjj0u2ninqqCT0XYQrAm6VoFgMkFXLoRsMNnZ4UXO6Z6hZqF+AXlZiYqXRRW3JrVPx0
         /4wA==
X-Gm-Message-State: AOJu0YyIDuLFRylUphP9wN+b5eLtfYpSr5jyWKVzDFdoUyNl9QDV7b5v
	aKXpaFd01p1+y1ldZ1E6pGCJLxLqobepNfS2UfBwigNjT28Ta/NYfpM/D3ASOUexA9A=
X-Gm-Gg: ASbGncvDRAh9yt6M8NJWVJ2xks+pemXzWwZhMvfEUgZzGXv3UiVI4gLUVPeyyn20ZzK
	whSFImbpEtVpfPM71fx5BRruYyB9uUT1X2B0L4XIJ7gZjXKKVSTwXTWTlX6zA+rSAK6qGtjFI+1
	EsyGubMs74z8uEODvmpFs3eakMQkXeiq1RsvY0gaE901YLtz5XQGT7zI0I0q/wguwIqKt6froil
	LMoeWQ5OiXGWsvK8GlY+X0YVwsl93MCJmWrs5YxTnPfe7iOyONZWCbSiNrr8h17Ok+jlq/tzmu5
	bOB3YIt+itBnadLXzwe2o1Y/JljUU/DB8B7rXA2MoOQosKq6jFJLt1L7LAsMHQhP07EDiugoDKR
	zzeBq3H7JEEwjM/2bjqr3a3fn3Syy3X5kAAsgj0JvuXok549QSSDXYdyBI+V4NxWrtYpWHPUe0K
	Mkd9BIQwAl
X-Google-Smtp-Source: AGHT+IFIRiQVA75Sc+kE1CPWUk4PiMBnedhmmWdsH1gtnnIcarCQEzcyI5Zta9nGlQH0Yr7n0uCFuA==
X-Received: by 2002:a5d:5f87:0:b0:428:55f2:be4b with SMTP id ffacd0b85a97d-429bd6a4c29mr7851522f8f.38.1762009232556;
        Sat, 01 Nov 2025 08:00:32 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13f3278sm9347526f8f.42.2025.11.01.08.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Nov 2025 08:00:32 -0700 (PDT)
Message-ID: <12f2e17e-15ee-40d3-90c6-e8e210b7da2e@tuxon.dev>
Date: Sat, 1 Nov 2025 17:00:30 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] rtc: renesas-rtca3: stop setting max_user_freq
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Joshua Kinard <linux@kumba.dev>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20251101-max_user_freq-v1-0-c9a274fd6883@bootlin.com>
 <20251101-max_user_freq-v1-4-c9a274fd6883@bootlin.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251101-max_user_freq-v1-4-c9a274fd6883@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/1/25 02:45, Alexandre Belloni wrote:
> max_user_freq has not been related to the hardware RTC since commit
> 6610e0893b8b ("RTC: Rework RTC code to use timerqueue for events"). Stop
> setting it from individual driver to avoid confusing new contributors.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
>  drivers/rtc/rtc-renesas-rtca3.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
> index ab816bdf0d77..a238ead6cf1a 100644
> --- a/drivers/rtc/rtc-renesas-rtca3.c
> +++ b/drivers/rtc/rtc-renesas-rtca3.c
> @@ -772,7 +772,6 @@ static int rtca3_probe(struct platform_device *pdev)
>  		return PTR_ERR(priv->rtc_dev);
>  
>  	priv->rtc_dev->ops = &rtca3_ops;
> -	priv->rtc_dev->max_user_freq = 256;
>  	priv->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_2000;
>  	priv->rtc_dev->range_max = RTC_TIMESTAMP_END_2099;
>  
> 


