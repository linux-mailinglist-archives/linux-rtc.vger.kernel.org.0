Return-Path: <linux-rtc+bounces-1934-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA77974E57
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 11:16:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26749289DBD
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 09:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4F016D9DF;
	Wed, 11 Sep 2024 09:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="QmwNSyt3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70414502B1
	for <linux-rtc@vger.kernel.org>; Wed, 11 Sep 2024 09:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726046120; cv=none; b=MqUcLGEaoNUnoVHEZ3hehxKNknbqaVyL7r3EAkN2xdbUFCunlBavpi7HsPw58jPeByQI+yF4PCx4SEND5OpXiSbO8mh2W9TagzLsBQYa3pcqplF9J+6VWWpuwzhEViDLJ7tegtlnOapz4SBRZH2SIIm0KLChCtTXmPYkvBMVEEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726046120; c=relaxed/simple;
	bh=lmLzw6o9RRo2iPo613a17M+FJFOCULb/8qq5p5p3B2E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OWIedTTF3VZDXcJVpGKtOsP4D/d2ac0GhmtcHcfysqTBsCBkJZTQqSvG2VUR/FsP2SkF6mDR04fvccsmlE95m9IBEQDnGrafN3vgqz4JZXZTJGtNZVIL4BpnbhLsxAdVl93bC9dmvwqdQLlSVnbDRJWHKc50L43CI2m0sba+7Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=QmwNSyt3; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5365c060f47so6177884e87.2
        for <linux-rtc@vger.kernel.org>; Wed, 11 Sep 2024 02:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1726046116; x=1726650916; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BBdZNz5KoZQnIOcuG+kUZiHTKYrmlyeZ18XGnoQJVLc=;
        b=QmwNSyt3Sfqvv9OqZZ0ZA3tL0Z+No2K6bBIUT9XNkNfA6xZRk+6dtduKfY5/Q8cZ58
         6igQ20uicv6Ofmcnmyq4aLVTgoC3wzO+tjgrjjVXmTg0Yc6KaTebkX9TtX2AhpVUJOIi
         Se3iFok0AbJSDUpemrDoRPbToiZ4PjUt7cJp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726046116; x=1726650916;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBdZNz5KoZQnIOcuG+kUZiHTKYrmlyeZ18XGnoQJVLc=;
        b=eKP4Kgpmugb583iYUuy5hIRXMffzSClkCM9/QhyApcUCrA7Dqk8l5b8yEF7bPPqpCC
         zLmvWYrQxI4qSmg45mcchb6pNQbf0k6rns27T5pkfdz7cvroSODl+3QwZzDJz7Y4bD0X
         rCUJnUJ7I/mwHfnLtPJ3SeYUge10QTI172WV93ww4PVKdpVlNz0MEILHURKb6wYGGRUs
         9b19adolo53gn9Ch0/2o2y4oJGQtvrHFKQWphTjNlOMK181KhaIdBgKMDNieR7+ADNQ7
         8N5LClX4IPld+ZtHYO+NC6phLj7Bz10B/HPFEsXDi3lqsbenLy2CIe8yXg3fWTlld0Lr
         dm7g==
X-Forwarded-Encrypted: i=1; AJvYcCWXN2JJHkktvs8UP9m1Pz/++5emJBTab9HqGl1yNTDJZ614pyseIEAcRZtJBL6iCAQ0fDMRZgVGGZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwktEHCOcVwSENNUOrPoPfAac3SYCY7b7OeGs2rnjzPSWdDPQEl
	7oFGmpuBdeXZV0IMjrxiFIUWM9Ez7e0SEEKKVRf6U4PoPXiKsCf1Z9X1men4ljw8lxVlHsdEJjE
	Qi8o=
X-Google-Smtp-Source: AGHT+IFadkaIZ08gEuHrmzd0cbOZaQ5r2GvQf+1IocGBvkFJr4vsXlwyqR6TZTzZy6uDAMjvyTNAGg==
X-Received: by 2002:a05:6512:114f:b0:535:45d2:abf0 with SMTP id 2adb3069b0e04-536587f594amr11894655e87.39.1726046115438;
        Wed, 11 Sep 2024 02:15:15 -0700 (PDT)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f90c306sm1498398e87.245.2024.09.11.02.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 02:15:15 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Esben Haabendal <esben@geanix.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
  linux-rtc@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: isl12022: Add alarm support
In-Reply-To: <87r09q7gpm.fsf@geanix.com> (Esben Haabendal's message of "Wed,
	11 Sep 2024 10:11:17 +0200")
References: <20240910-rtc-isl12022-alarm-irq-v1-0-d875cedc997f@geanix.com>
	<20240910-rtc-isl12022-alarm-irq-v1-2-d875cedc997f@geanix.com>
	<875xr3iape.fsf@prevas.dk> <87r09q7gpm.fsf@geanix.com>
Date: Wed, 11 Sep 2024 11:15:18 +0200
Message-ID: <871q1qimah.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Esben Haabendal <esben@geanix.com> writes:

> Rasmus Villemoes <linux@rasmusvillemoes.dk> writes:
>
>> Esben Haabendal <esben@geanix.com> writes:
>>

>>> +	struct isl12022 *isl12022 = dev_get_drvdata(dev);
>>> +	struct regmap *regmap = isl12022->regmap;
>>> +	uint8_t buf[ISL12022_ALARM_SECTION_LEN];
>>
>> The kernel normally says u8 (and you do as well in _set_alarm()).
>
> Another copy-paste issue. This time it was from _read_time() and
> _set_time().
>
> To avoid inconsistent coding style, I guess I should add a commit
> changing to u8 in _read_time() and _set_time() as well.
>

Ah, hadn't noticed that. Yes, please fix that up while in here.

>>> +	int ret, yr, i;
>>> +
>>> +	ret = regmap_bulk_read(regmap, ISL12022_ALARM_SECTION,
>>> +			       buf, sizeof(buf));
>>> +	if (ret) {
>>> +		dev_err(dev, "%s: reading ALARM registers failed\n",
>>> +			__func__);
>>> +		return ret;
>>> +	}
>>> +
>>> +	dev_dbg(dev,
>>> +		"%s: sc=%02x, mn=%02x, hr=%02x, dt=%02x, mo=%02x, dw=%02x\n",
>>> +		__func__, buf[0], buf[1], buf[2], buf[3], buf[4], buf[5]);
>>> +
>>> +	tm->tm_sec = bcd2bin(buf[ISL12022_REG_SCA0 - ISL12022_ALARM_SECTION]
>>> +			     & 0x7F);
>>> +	tm->tm_min = bcd2bin(buf[ISL12022_REG_MNA0 - ISL12022_ALARM_SECTION]
>>> +			     & 0x7F);
>>> +	tm->tm_hour = bcd2bin(buf[ISL12022_REG_HRA0 - ISL12022_ALARM_SECTION]
>>> +			      & 0x3F);
>>> +	tm->tm_mday = bcd2bin(buf[ISL12022_REG_DTA0 - ISL12022_ALARM_SECTION]
>>> +			      & 0x3F);
>>> +	tm->tm_mon = bcd2bin(buf[ISL12022_REG_MOA0 - ISL12022_ALARM_SECTION]
>>> +			     & 0x1F) - 1;
>>> +	tm->tm_wday = buf[ISL12022_REG_DWA0 - ISL12022_ALARM_SECTION] & 0x07;
>>> +
>>
>> Here I'd also suggest keeping each assignment on one line, it's rather
>> hard to read this way.
>
> I agree, and I will change it here. But if the 80 columns rule is out,
> what kind of rule for line width is used instead?

See commit bdc48fa11e and the current wording in coding-style.rst. In
particular I think

+Statements longer than 80 columns should be broken into sensible chunks,
+unless exceeding 80 columns significantly increases readability and does
+not hide information.

applies here. I'd even say you could use spaces to align the = and &
operators (that is, make it '->tm_min  = ' and '->tm_hour = ').

So the 80 char limit is still there, just not as strongly enforced as it
used to, and once you hit 100, there has to be really strong reasons for
exceeding that. But 85 for avoiding putting '& 0x7F); on its own line?
Absolutely, do it.

>>> +
>>> +	/* Set non-matching tm_wday to safeguard against early false matching
>>> +	 * while setting all the alarm registers (this rtc lacks a general
>>> +	 * alarm/irq enable/disable bit).
>>> +	 */
>>
>> Nit: Don't use network comment style.
>
> Ok. I did not know this was network comment style only.
> So it should be with both '/*' and '*/' on separate lines?

Yes. I wanted to point you at the coding-style part which explains the
different preferred style for net/ and drivers/net, but then it turns
out I couldn't because 82b8000c28. Also, see
https://lore.kernel.org/lkml/CA+55aFyQYJerovMsSoSKS7PessZBr4vNp-3QUUwhqk4A4_jcbg@mail.gmail.com/ .

>>> +	/* write ALARM registers */
>>> +	ret = regmap_bulk_write(regmap, ISL12022_REG_SCA0,
>>> +				&regs, sizeof(regs));
>>
>> Nit: Fits in one line (I think), and you probably want to use the
>> ISL12022_ALARM_SECTION name here, even if they're of course the same.
>
> Using ISL12022_ALARM_SECTION makes the line 85 columns. I must admit I
> feel a bit uneasy about going over the 80 columns, as I have no idea
> when to wrap the lines then...

As for the name used, you should at least use the same in all the
regmap_bulk_*() calls. If you don't want to hardcode that SCA0 is the
first and thus have a name for the whole region, you could make that
name a little shorter (_ALARM_REGS maybe?).

I think vertical real estate is much more precious than horizontal, so
I'd prefer to have this be

  ret = regmap_bulk_write(regmap, ISL12022_ALARM_SECTION, &regs, sizeof(regs));

regardless of line length (as long as it's not crazy), because then I
can see more context.

>> I see why you do the ! and !! dances to canonicalize boolean values for
>> comparison, but it's not very pretty. But ->alarm_irq_enable has the
>> signature it has (that should probably get changed), so to be safe I
>> guess you do need them. That said, I don't think it's unreasonable to
>> assume that ->alarm_irq_enable is only ever invoked with the values 0
>> and 1 for the enabled argument, and e.g. rtc-cpcap.c gets away with that
>> assumption.
>
> The handling in rtc-cpcap.c looks a bit strange IMHO. The comparison is
> without using !, and then the assignment is done with !!. I think we
> should either rely on enabled always being either 0 or 1, or handle the
> cases where it might be something else.
>
> I prefer to play it safe for now.
>
> But if I explicitly do this first
>
>     /* Make sure enabled is 0 or 1 */
>     enabled = !!enabled;
>
> Then we can leave out the ! and !! below. The code should be more
> readable, and it will be much clearer for anyone that later on will want
> to get rid of this.

Yes, that's a good compromise.

Rasmus

