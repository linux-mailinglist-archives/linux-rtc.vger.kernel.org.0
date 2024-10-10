Return-Path: <linux-rtc+bounces-2149-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0DA998572
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 14:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80D7E1F249B1
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 12:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED64B1BE238;
	Thu, 10 Oct 2024 12:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHOkBTiG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D689F9CB;
	Thu, 10 Oct 2024 12:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728561677; cv=none; b=b+kYGaOQWfKfc5/PiDVoH9qX9jTzikUH8sgAYsu9NINIYulCj5J7LJg5FV3JBHL/+8FKYQjYXbTwRBjE4eqDOBGAG69hUQJZuW0sslZjz/AfDsw0a1HRFHJpzB0zxwufD/65BfyjdQosd2UgEouY7ph8cAA+kF9My50livi3rKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728561677; c=relaxed/simple;
	bh=6g9mOo19AYOMVRmXYgwpFhUUOKlGAvvrbbrhSF/VARU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jmd8laf0Zu2Q3SJP1pZSLJjAPqV8QOSkt7qU03A4xDYnXLPhz5rXxSivdCHx/Q/AEbA5xSsnr3BBCLR6EHIVv2S7ER7duANyawPO+pXxGdr2BShVryM0HwbkYo0ENpxdihvFc/8zRWf4SAXNFtW4nBwDj3kMP6k5xTUkr45R/T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHOkBTiG; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5398fb1a871so892730e87.3;
        Thu, 10 Oct 2024 05:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728561674; x=1729166474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eckU/GttqS7MJiCuGilLlaB6wPKcxsXpqOb1heDWKyU=;
        b=HHOkBTiGWgaSwKW4xZJleImvt1FDmCfW9WbQOw1cyli5d+QotNCURkZqfXhb1nmvwO
         VLPwWfK/hG7RrnWncE9uO/YVx+hZHOrGKamPPf+klDO/NnG42m+n9DrtGtrTqj/uImSm
         NzJ0jco0RLz3ys6vx6vplMQ5daqMp1TMvFX59JjjE9UB7rel4gXS4DhcdJyI9ts6uKMf
         rwH69/wXvF2KWFS+3GKKkl5M4e1i2hD/VdtRzMly5Evs/TulFcKQafOXC7CUov5v4YgZ
         7Lz+m6+Zqo0CYNyu7k0aZuh9L5HL266JPqaWcNiVF7LP1ic1kiqohu0R2A/gQeswEvIE
         Nt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728561674; x=1729166474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eckU/GttqS7MJiCuGilLlaB6wPKcxsXpqOb1heDWKyU=;
        b=xJdlP8nszdB3BbvtOIzJqDJzAv+oGc8tUFKOjTC7dwhD8h/08gPlvhR7gtHW7ueX8u
         v7IIb7Aw9mztBVU3l/AOCm3qZahEvaubrKEuVOL/xgUKTQ9GCTz417hxBGMMA3vbGVM4
         E/RgP6gLY29WhSQGkLcTocGhvem1jC1UKyN7eEUKMj6qHC/KCwM6CoLQEjOT+u6od/Ky
         4CzPJw7/pfW9CR/iODBwqjLU/Bd7XXdpsC6Ea/z67rqLtJqYP2Hea4dXo9vqMeHsEuYy
         ti0CuxX2qV13ug9p6SBXB25rQJlCf7EpocNsnNaicGweHtk1HhVl5kUO3AUgBaRNOmHj
         JdZg==
X-Forwarded-Encrypted: i=1; AJvYcCUyPCMB11DG8wZ1KvAfJaHylXAbJH5A7I+F69luiZN5xkW0OKk/1c89wJAyf5h+aU6uhgfVowh2JqRa@vger.kernel.org, AJvYcCXR1lTg0NtSFoQDUSgHgPSJ1CmXoWcSlsXLleLpBtEop/5Iiv2i9gdDeV/EIe80LT5nQjUjuhDmgjslQfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6eYGvvWudnVu4szq4ZVo4ADz0pf/xECJvZpnTZFrGX6thOuMZ
	npFeKrY/nHpwIw40hJROE2v/1IhBp6p32HaK+H+ajiK+w3zFRhkolPB3zw==
X-Google-Smtp-Source: AGHT+IGhn5nFZMTKO8hfNH5mc7dun49yImb/znbCuz/H9+1jIaT/8AsDkri0UxlW697/kp0hszUbKQ==
X-Received: by 2002:a05:6512:3b13:b0:539:94b7:d713 with SMTP id 2adb3069b0e04-539c495e9damr4165440e87.45.1728561673857;
        Thu, 10 Oct 2024 05:01:13 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c13e1sm229903e87.58.2024.10.10.05.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 05:01:11 -0700 (PDT)
Message-ID: <2d48be5a-a259-4ab8-89dd-e662110d4d68@gmail.com>
Date: Thu, 10 Oct 2024 15:01:08 +0300
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH] mfd: rtc: bd7xxxx Drop IC name from IRQ
To: Lee Jones <lee@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <ZvVNCfk10ih0YFLW@fedora>
 <172848415740.588729.14326036177340227520.b4-ty@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <172848415740.588729.14326036177340227520.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2024 17:29, Lee Jones wrote:
> On Thu, 26 Sep 2024 15:01:13 +0300, Matti Vaittinen wrote:
>> A few ROHM PMICs have an RTC block which can be controlled by the
>> rtc-bd70528 driver. The RTC driver needs the alarm interrupt information
>> from the parent MFD driver. The MFD driver provides the interrupt
>> information as a set of named interrupts, where the name is of form:
>> <PMIC model>-rtc-alm-<x>, where x is an alarm block number.
>>
>> >From the RTC driver point of view it is irrelevant what the PMIC name
>> is. It is sufficient to know this is alarm interrupt for a block X. The
>> PMIC model information is carried to RTC via the platform device ID.
>> Hence, having the PMIC model in the interrupt name is only making things
>> more complex because the RTC driver needs to request differently named
>> interrupts on different PMICs, making code unnecessary complicated.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] mfd: rtc: bd7xxxx Drop IC name from IRQ
>        commit: cd49b605779b4fea8224650eeba70b258c5cc8cc

Hello Lee, Alexandre,

Nothing pleases me more than having this quickly merged but...
... I don't think I saw ack from Alexandre yet. Furthermore, the 
(subset) makes me wonder because I sent RTC and MFD changes in a single 
patch - which might've been a mistake...

I tried finding the cd49b605779b4fea8224650eeba70b258c5cc8cc from MFD 
tree and failed. Hence I'm a bit unsure where we are going.

Yours,
	-- Matti

