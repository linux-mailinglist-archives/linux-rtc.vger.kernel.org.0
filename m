Return-Path: <linux-rtc+bounces-5211-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F130C1A6BD
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Oct 2025 13:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7E52E3591A9
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Oct 2025 12:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C3A3563E5;
	Wed, 29 Oct 2025 12:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTdj887y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7E085C4A
	for <linux-rtc@vger.kernel.org>; Wed, 29 Oct 2025 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761741012; cv=none; b=OZOiO0wKwIOx6wOO8s9+pbk428BtESWBDUBrK6P17iTrqqMlKq8w3Yuc0LTuVbMhGJjIL4ihC4Ot9mfVa2Ha+qVUb3cGGZaNMcLUoHZvZw/2CJtdDLUITT+1egeJJOQVnluJBiZ2XeKBs7Wz/ZUJMt2lc+qINgh40Xh2LfBCjAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761741012; c=relaxed/simple;
	bh=yfVwVTerZPk2NHZzlK1pqB6FPkQ/oXmjoq1IP210Xts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSqL77k+iuy0zsv0n3/VtRzwDM34k5z07HT6y7JogOcqfr+UcwJ8rCazairg48XZ0wJ4XWJu4k5IJHpbGcrXR57FqSc4i5WEcaWRtove1iUDQz5wW/F0VmgP24yilW967wusSVFSLLnHyhVNL6qa7jS4K3Rh/KzTQtnD43n3H9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTdj887y; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-591ea9ccfc2so1444880e87.1
        for <linux-rtc@vger.kernel.org>; Wed, 29 Oct 2025 05:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761741009; x=1762345809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ui8ftKpD8oJJMrnzjOA4xyfnszlxAAkwMFpTMiFGLGY=;
        b=MTdj887yxeCcg1+C9KOyxLpebLhYr4D3K4eae5EfsfBGLwZZaS7Uj2ic8cnzWCTU7c
         IzDZJTUda9Dvxy9J5Ui1yoEikVYbDqL39O+PKS1dezNKm61QNf1wZNBlcM+VNzQJtXnI
         5XNeIjnuk0QhhBptDvDRRgmbQJn8DvHYe/mdGW4jDNXPOtGvVQfUmBGu07Z6Zz+d06eN
         cxaQvO57e9cHFFKyixZfLrNOowWwpk+t9vnwkrlIffJV2SxKUUSMPK026sep3ZpeneqU
         Ea5iLQsvlqmiCfkltQzcYCnop2zDNCtCpJG0JV8WdaZZC9THxxsag1m5tnOCP2COdXTs
         Mxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761741009; x=1762345809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ui8ftKpD8oJJMrnzjOA4xyfnszlxAAkwMFpTMiFGLGY=;
        b=jvfoxWCp1ffSgy2y6Fy6wJZdELuw/x3fIkfmR5qnk4BqvP1Zatm9z8rRFg4NNPilnC
         MZ1wmm6QL6O2YO3H/bgMXbjOoxBa04Mt9hFPQF8xIqVhNDaN7M0PDCs8NkTHeNbmGNB3
         wDzM2KFifVNf/21G4wlZ0ClxgYvPbqk0kSJD2EDPk669YDSAARnTC3OsPoNBZGpl7Dcu
         vdq+ymlZhobtCsyZzgVCAQStu2xgQruvKBGMhLpHZOP8V1UbkIQlT3kzc6dCdnECH8SO
         U7V3+BmGyjRjT+mFKn9yi2e+7SqgSPGhvdPQ21tWl748AYUFdfv1c59Cg6RYRdcFUMRc
         fPKg==
X-Forwarded-Encrypted: i=1; AJvYcCVUO7krz5pZYT1Qt+Px6hGLNKIk7gws5YAO15XgqoxUFqmq6hxe2wWW/rvhr7TGLZVVF7zULiW8wc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu5xNfOxa8XjL+Oeh7lm+OMz8OTTHdg406YDGH94l4YG3tZ6Xm
	hDGRQnuCr4Z5LBkkMAOIxBmic5f6eTHBeeQOu5DyDhCS9jgsYX0wg1DD
X-Gm-Gg: ASbGncuUOIaP3i7FY5Rus05l7obteLxgKS8ph1nwp28+vCtqo6OlkQU7u/kWszCIIZb
	Grlpa//guT7GY1yGJe0MFwFXV5RALq9JidsSxfFZmuGou/9iUSqLDVFQ+0hanNl7ZBQM8mtpye6
	JN7Sykt1BaXLzF/fY4IM9LwOpYVn6hNNbt1M1dRQvz3SJSjdEyIKoh9nSZeIMNgllVVoicZQ7K/
	agkyZiqvHMlLGaFEYKcutsuWv3Uc8zEflH9DPsprDUclCHWa1ngrfmaxfOPH3l33o2MQ58Ypeq1
	iqgL3y+v/EwD49mOe2t+B6mQ8Qs+f4NywBS0VW4r5fNRWrhFxrTnQE7x25WkY1Tn6Gp4wvwSsh2
	nByaqc0PaPSJzgJDXA/YOq0Kkufgezq0OFovxEOvvl6yjE6iQjSdWs5OeFOsPnhpowAf8JkKenw
	jeUP+lHd+7Hw==
X-Google-Smtp-Source: AGHT+IGoOBmpR56r91eNxNa3niN5na4xSuldumEKqunNvTbGH3/QMdmFRTjv+fJgOEfNR9uGhYfhgA==
X-Received: by 2002:a05:6512:3a8e:b0:591:ec58:ec7c with SMTP id 2adb3069b0e04-5930ee07801mr2415382e87.25.1761741008581;
        Wed, 29 Oct 2025 05:30:08 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f50a7asm3782619e87.34.2025.10.29.05.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 05:30:07 -0700 (PDT)
Message-ID: <8b5dbbf6-bbde-4015-b0d1-12d6ec770ceb@gmail.com>
Date: Wed, 29 Oct 2025 14:30:06 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/15] dt-bindings: mfd: ROHM BD72720
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Andreas Kemnade <andreas@kemnade.info>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <cover.1761564043.git.mazziesaccount@gmail.com>
 <a5957c4f83724d4f32527fb892fc340af4eeddde.1761564043.git.mazziesaccount@gmail.com>
 <CACRpkdYEUdJRvNPKhxx7orYHH3OE6BXXjrG9JVJo5MDHGKE88A@mail.gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <CACRpkdYEUdJRvNPKhxx7orYHH3OE6BXXjrG9JVJo5MDHGKE88A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/10/2025 00:42, Linus Walleij wrote:
> Hi Matti,
> 
> thanks for your patch!
> 
> On Mon, Oct 27, 2025 at 12:45 PM Matti Vaittinen
> <mazziesaccount@gmail.com> wrote:
> 
>> +  rohm,clkout-open-drain:
>> +    description: clk32kout mode. Set to 1 for "open-drain" or 0 for "cmos".
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 1
> 
> I think CMOS is the same as "push-pull" ( I could be wrong, but I think I've
> seen that before) so I would probably try to use the pin config standard
> names as strings here but I'm not sure.
> 
> rohm,clkout-bias-open-drain;
> rohm,clkout-bias-push-pull;
> 
> Mutually exclusive.
> 
> Or maybe use the pattern from rohm,pin-dvs0
> with string enumerators?
> 
> rohm,clkout-bias = "open-drain";
> rohm,clkout-bias = "push-pull";
> 

Hmm. I kind of agree with you. Still, the way it was done in this patch 
is used by the other existing ROHM PMICs (bd71815, bd71828, bd71879). I 
am kind of reluctant to support another way in the same driver - and I 
am also reluctant to change the existing bindings as that sounds a bit 
like asking for a nose-bleed :) (I've in the past worked with some 
devices which didn't update the device-trees when kernel was updated...)

Do you think you could live with using this existing convention? :)

Yours,
	-- Matti

