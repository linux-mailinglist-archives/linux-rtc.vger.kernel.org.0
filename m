Return-Path: <linux-rtc+bounces-2723-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F149EE3AD
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 11:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC85628704F
	for <lists+linux-rtc@lfdr.de>; Thu, 12 Dec 2024 10:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB1F20FA8A;
	Thu, 12 Dec 2024 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="kp1hQ2RF"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD3D210197
	for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 10:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733997947; cv=none; b=YjinHLJxKLJ+r8KG8F/tKxlsRDadwGocYK3pVjt0hcZlc7qzpHqNKlxxpKaKdxc4dJ3u2jaqnU5yXqG0ui6vMAETj2WeMureDD3NqxnKuAo0liXoEzQFXgHssvaHbYknOf/1Stciw5lplKr3b9T6kmUllgXz3dZPX4PI7SwUxW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733997947; c=relaxed/simple;
	bh=tJOmmqcFn7vVpU6ZCIg8eKKG9/4JaOsuHfpYEmqhDmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oLtFFlYJunhKvR5ISJ2MJ5UEpfNcJTDOry/U2lN4CD6gnzmhp80Dgahu8Lpdsy3KltBcUIYFMKaNm84957jEfWZTDDDQz7mUKy31cRLhjacTSvWqN0x8aNdwo5/XHjEbO7RD2I5a9MgxRLydqjDQ1IcpnaS+vp5bdETEuDmhars=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=kp1hQ2RF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cf3e36a76so3719575ad.0
        for <linux-rtc@vger.kernel.org>; Thu, 12 Dec 2024 02:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1733997945; x=1734602745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wGWNygS4yfZ+ygb/mU1BUG2O23ksq32j9bR+Acb0RzU=;
        b=kp1hQ2RF58LOJivKOEo2uaUY1kI+lLIPVuPt7C52W2oS7g1Zo1AGdO3WZK8NGmGR7L
         U9o4joBQjJNCzvmRDoTSlF+Zsx5klfiJrLbWFoRgKUtIJyKoAp33PopDJMKv7R/v7qlJ
         36lDOo1b7el7pqTIflOFQqr/JWbRVJeAnGBEzoNj34QFWGZc31y0o5wx+XwBU/TTpp3/
         DF6XHb5avQJQf+N323UCk6eI7Z60lme81MyWE66/ppcJCOWE63j+79zeEOV7xtr2Rs8V
         DK/pOuqLrdAS5GcNgNvDAu3B6VQR5zsblDp+RwTx1cdXu5vdSe79PPlyf80bNB3fBwDB
         ASZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733997945; x=1734602745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wGWNygS4yfZ+ygb/mU1BUG2O23ksq32j9bR+Acb0RzU=;
        b=uznZOEiyeqAQAAqWZHjt+n4uXrfbwJlIQHJp9lT6QIFWfZ+cWz6HbH//xGdq0DPzbg
         rV4wTX3rUhONmQZBYYHQ3Ui65iXGv4LiOt4Iy3fY2enFqccdM+vtl0U4v9dZmDHgLZnf
         ezk/3y2XagyZZ6eZcuAdU66u0FnE5TPpKLFAGtKMbyojPMjO1eb84fkFQrCUrExQrTx1
         AQIeLs++aHFulL3XEjiPx8YEDDiUSseyRbfhbKKWONuSft3C/t+e/T158YoNZpdB/Eqe
         pCQTQBTi/tPFVaWmqcBI9+slWnMXCbjbD7G6s8TrerbLwIudxUC0v8poOt5hAi1zaBNY
         zWFQ==
X-Gm-Message-State: AOJu0YyVU8lo5vZ/n2QnPBs7w11oP/UuUjC8xwB1o+OzpRCn5FnukK0x
	sSXRF7iWlmU/Tykm5lwiXhiPlQyvF+oJRYQpxdJb2B8ZI7cTmsGf7OQziJG9VF8=
X-Gm-Gg: ASbGncsNE0wkXXC5jLLZmKNwHrm0wOx81kKqYA+NdLiMmC9T6K/BAF6hsho6o6s5Qns
	ubrP5epBumknScbxNZE9PxGiY5G24f7RaAx73qZPAUTeObbrRAjLchex57NPGg753ztC42va/d3
	uLlxGC/CV2iOS6oKQ577sO68upKTN9e8kmOOLbuqnzs088f8iq/RdDiJg096Nq7N1dltHeFNn9m
	ydp6WH/wTUh4+rjW5E7zNMsguL6ODgslNJ4zcdtJCfw2yzG+8M5TS+HbigFkej0YWHoTs4EqkhM
	xkajx2vsJ/f57Su6lUrxhGs6TeebaxqO+DVq
X-Google-Smtp-Source: AGHT+IFA2IS6y8dKUZHxx7ZgCUTm675dttJS6HfsyMk2V0mqo7ryTAtdF0X1UbdCeyVM8eA5Ncnzsg==
X-Received: by 2002:a17:903:41d2:b0:216:34e5:6e49 with SMTP id d9443c01a7336-217786a2d59mr90991945ad.57.1733997945436;
        Thu, 12 Dec 2024 02:05:45 -0800 (PST)
Received: from ?IPV6:2001:f70:39c0:3a00:b741:6a01:f624:e219? ([2001:f70:39c0:3a00:b741:6a01:f624:e219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216203e2990sm97711375ad.56.2024.12.12.02.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 02:05:44 -0800 (PST)
Message-ID: <2d32bc87-9967-4f2b-9880-edc8b47540dc@pf.is.s.u-tokyo.ac.jp>
Date: Thu, 12 Dec 2024 19:05:42 +0900
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rtc: bd70528: disable wakeup in the error path of
 .probe()
To: mazziesaccount@gmail.com, alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org
References: <20241212100116.3797439-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <20241212100116.3797439-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, the commit message does not match the actual code change here. I 
just sent a V3 patch, so please take a look at it and disregard this 
version.

On 12/12/24 19:01, Joe Hattori wrote:
> Current code leaves the device's wakeup enabled in the error path of
> .probe(), which results in a memory leak. Call device_init_wakeup() as
> the last step in the .probe() to avoid this leak.
> 
> This bug was found by an experimental static analysis tool that I am
> developing.
> 
> Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---
> Changes in V2:
> - Call device_init_wakeup() as the last step of the .probe() for
>    simplicity.
> ---
>   drivers/rtc/rtc-bd70528.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
> index 954ac4ef53e8..d5cc4993f918 100644
> --- a/drivers/rtc/rtc-bd70528.c
> +++ b/drivers/rtc/rtc-bd70528.c
> @@ -312,9 +312,6 @@ static int bd70528_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	device_set_wakeup_capable(&pdev->dev, true);
> -	device_wakeup_enable(&pdev->dev);
> -
>   	rtc = devm_rtc_allocate_device(&pdev->dev);
>   	if (IS_ERR(rtc)) {
>   		dev_err(&pdev->dev, "RTC device creation failed\n");
> @@ -331,7 +328,12 @@ static int bd70528_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	return devm_rtc_register_device(rtc);
> +	ret = devm_rtc_register_device(rtc);
> +	if (ret)
> +		return ret;
> +
> +	device_init_wakeup(&pdev->dev, true);
> +	return 0;
>   }
>   
>   static const struct platform_device_id bd718x7_rtc_id[] = {

