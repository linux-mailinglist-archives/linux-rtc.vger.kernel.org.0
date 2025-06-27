Return-Path: <linux-rtc+bounces-4384-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D067AEB914
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 15:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 217D93ACBC4
	for <lists+linux-rtc@lfdr.de>; Fri, 27 Jun 2025 13:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB162D97B6;
	Fri, 27 Jun 2025 13:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rboZDMuW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A022D97AE
	for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751031405; cv=none; b=B5SezmxGIHkSiJlwD3kNXHZHT4ov6r7TuuErWAzORFy8qNZdZw1LST/fydex03S2e3+jgdtERsX7jQeoDKXaXG2O3Eyq7Y2Q0mHNVuUyn6REiryZ4+8Ddc9rmvVDwmeu4rvlxI8fqTU9pm9DJIfxu89TA3yixyB/oOtOxLq9o38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751031405; c=relaxed/simple;
	bh=fk+HBAiRPVdgGsHsF5qNIsiflq+XoguW2NtWdyg8cgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sdvHEjuzgprmd+UEmb7VY8L+0vykMTC5o4U6TRfbYjTf07BFTGGbPdMcyVLPwA52JlkjuucI+yMq395sPq30J2i6JlLmx8iZzOU7kKztUj4RTX91LI0Nq/JbSNPI7lRItLWz74pR2tf8QVZt48IJ1rHsEhmFhVJrZaCmbVdVi5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rboZDMuW; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-875acfc133dso64681139f.1
        for <linux-rtc@vger.kernel.org>; Fri, 27 Jun 2025 06:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751031402; x=1751636202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XfiJnZdQRFrCAW+w9heCSHyeWa3Z+YlU9j/j6ABGxx8=;
        b=rboZDMuWGH1edkinpn1mbrXlNFB4mh1CE6QzDJ8PMsXs2KPxFKTkkmgi7HdVQPEArs
         EEZ3ekcWmdawzlOllhGppgtWfHyjsE5r3T6jthdHHO7hoGCVK/db6B+629tho8zUpTOK
         hT7949ZMamxuejP0P3OnjmWF/7gjOfDlzcONKP3hCzd+bn2l6qgAHOWxdxMlM+Rk4+gy
         xh6ZfWhqLxNIgntS4Kxy1SsBzBDGoUDzWnK39FIuxmLSsyPx1VdP8j/q0MutQQQA8Rmc
         Phsf5eUIyqQ8r8DiwE7Cm5WQ0e5o0V5k0Dm3WHZV3Wcp/jbZInux7yU3CLQ0JM19svoR
         2vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751031402; x=1751636202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XfiJnZdQRFrCAW+w9heCSHyeWa3Z+YlU9j/j6ABGxx8=;
        b=FSNb4VkzxoeH7hYNNUzkF6lp/lgpPtS3P1Rc1eUB4zPEyfBnldd81utbZhlkYgPngT
         sspa9oXEnX8dowBYzKY5muhHqz8C8is4Hrf8LHMEQNXA0dNwQvF4ril3FHZMYpYlg7Hz
         tqWzYeB4QyWa5EMn4O5B4NwenTUr+y7R/BPPheJf18k3jZ6hwfCu4WoFWsCPrrcSFO1r
         VP5Udp5XA7hRys/fAZ8H/nDS0lljbp053wMDt52Fu3X/qpVANj9qa5hNyEYPBQEKI0vq
         uBnH07dAEmRv/ZtBJ12YBUTpcNCdQkQPmP+HloGMQ4+SQxSmtF2uN6hIYk0NBorevLvz
         dPqw==
X-Forwarded-Encrypted: i=1; AJvYcCWEOZVosA/ysHuBW6Wg0FUaLEPCMiuvG42eNdF5q1U/fCiNhpvd7vci+N09A/d4IkNuiKqKDA6nuSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhloCj0vfgWGy2HV5/PY7/YGaY6NPvjpS+hJMspkKUnTpSQCLe
	3yemxneem6muQLVGO/OYGK4E0P1k+XOzHkWj9mk3gFqgO9WAVG2wRU9FHBCn9ujtKIHIWoMapHk
	lQoUR
X-Gm-Gg: ASbGncs8FoeWo+ezzxHzS1n+r8a9bi52AiuJr5W7IcVBi7AX8DfEsxwl8Pa7gF/rNtD
	PRmfHFdVXKsg6yQELwllZ+bbFRKuMtz98JH5WYfPS78natYn9O16RcGRmSXu/1DOEHpCJbuC3JX
	aMawS5Qaeea9/ctVOL+KoaHi2OiQirTwdqnaWcnxt5ZK3/7YXjnBWo2BhwlquAMH2IkeAmpxc1p
	DubEbaEC9D0nATU38HBBixdQVzTVXrq65hMQWBXFlPx4YQEvOPzFO7v1M3OyM2EcFFxrkgcdXWB
	Rh2HJ+ma6AL+r3heURU2kAoZB8i7AlbqtPa367pTbplgaqG71VhwBqUVuy1zk+d3Sno1+LjHJ0L
	h/YzadaFZDkJ6ZfSzQywc7RUBnQ==
X-Google-Smtp-Source: AGHT+IF1O8tzv2KWCzSl21OTyig59TTY0gf7CGovzXL+B16wQcpv5kKezeVDaVnpkiTgGZ9wCICGDQ==
X-Received: by 2002:a05:6602:2dcc:b0:873:3691:6fb8 with SMTP id ca18e2360f4ac-876882cb88dmr404639839f.8.1751031401882;
        Fri, 27 Jun 2025 06:36:41 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-876879f3584sm46791339f.9.2025.06.27.06.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 06:36:41 -0700 (PDT)
Message-ID: <0eda5bf4-ce63-43da-9c2f-7d4ec902758c@riscstar.com>
Date: Fri, 27 Jun 2025 08:36:39 -0500
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] mfd: simple-mfd-i2c: add SpacemiT P1 support
To: Lee Jones <lee@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mat.jonczyk@o2.pl,
 dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, troymitchell988@gmail.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250625164119.1068842-1-elder@riscstar.com>
 <20250625164119.1068842-3-elder@riscstar.com>
 <20250627125119.GF10134@google.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250627125119.GF10134@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/27/25 7:51 AM, Lee Jones wrote:
>> @@ -93,12 +93,30 @@ static const struct simple_mfd_data maxim_mon_max77705 = {
>>   	.mfd_cell_size = ARRAY_SIZE(max77705_sensor_cells),
>>   };
>>   
>> +static const struct regmap_config spacemit_p1_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +	.max_register = 0xaa,
>> +};
> Suggest making this more widely useful by adding the 'max_register'
> attribute to 'struct simple_mfd' and conditionally overriding
> regmap_config_8r_8v's value during probe.

So you're suggesting I make a general improvement to
"simple-mfd-i2c.c", because everybody else just uses
the generic fallback regmap config?

(I'm asking because at first I didn't understand your
statement, and the "more widely useful" comment).

I would be happy to do this, and it's not that hard.
Can I do it as a follow-on patch though?  It's adding
scope (again), beyond what I anticipated and honestly
I'm ready to be done with this...

Anyway, if you say "no" I'll send another version of
this series today.

					-Alex


> 
>> +static const struct mfd_cell spacemit_p1_cells[] = {
>> +	{ .name = "spacemit-p1-regulator", },
>> +	{ .name = "spacemit-p1-rtc", },
>> +};
>> +


