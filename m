Return-Path: <linux-rtc+bounces-1935-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFF6975042
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 12:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A31AE1F2960A
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 10:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91008186E4F;
	Wed, 11 Sep 2024 10:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="FwmEbGLz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D0B186E38;
	Wed, 11 Sep 2024 10:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726052018; cv=none; b=vCPYqAdTvf2YLcsLRfw80i4uXkSG64MHiLybDxWF8LxlpHE1nR7GCnawhbn/AFeQEhrW4FWzqEv/Dw8SZBsb1ZWhD+EpyzG+h3UZbwHNrJMz+fCUQIA/EhFIiQYZwWq0H9385Iqgsg29E4qIFEzOGQ204RoKnF8veEqzPQskG5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726052018; c=relaxed/simple;
	bh=OMCTjgP1ZSlPNXFg8qAx/XVM1+F2DV6ErvHqNl6l6mg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CaQj98hs8SVR6TsBQzyGliUnspPNUfmHhwweKk5DGdJzFEgzMuSpxAc91SaJnQnQ2FmCHjvtPwSkZ0+apNgyO2bhFFYMCRvagWF/9jFPEXk5ZOCsijb1/Wjj2zhUh0Ft2GkGAtxL5IWN+zBNNeNM+r1RX7awMfm+O7momeJokq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=FwmEbGLz; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=fZpKRoIeK9cKExHPMi6rtWjLrIqgrVwqX+4mocIxmts=; b=FwmEbGLzn+ZJKN+zfsAfmkVxcD
	OukJS/v66oLJ0fvdXTmx6Ex5CEmeTVVAaC5GicgPg87fP+ZeyIEDlRyVfSHX0Gi74eGNpZq84g+23
	VcINcLAuWynuilPuAqoiGmOtv7G4X1TwmliTDnjCpj51LFTLfUU1Vp1wlFm/bi2whA9d5hBmON4mD
	QD1Uv4CblJLginBD2rvWkVwPjAJsW7Ro1NPswOWhZKdII2qbPUTKD4yY8Bocf/OiBvmk2t+b/FYa9
	nbUpJhSbmjrAy9FdZ8PsWDw1IS8eloDlTFwO/jKXOywfS9CgeLw02OYBMbAKZjeI0Hg5V7KZj2xxO
	C7JDRHKA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1soKya-000EdW-E4; Wed, 11 Sep 2024 12:53:32 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1soKya-000HE5-2f;
	Wed, 11 Sep 2024 12:53:32 +0200
From: Esben Haabendal <esben@geanix.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
  linux-rtc@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: isl12022: Add alarm support
In-Reply-To: <871q1qimah.fsf@prevas.dk> (Rasmus Villemoes's message of "Wed,
	11 Sep 2024 11:15:18 +0200")
References: <20240910-rtc-isl12022-alarm-irq-v1-0-d875cedc997f@geanix.com>
	<20240910-rtc-isl12022-alarm-irq-v1-2-d875cedc997f@geanix.com>
	<875xr3iape.fsf@prevas.dk> <87r09q7gpm.fsf@geanix.com>
	<871q1qimah.fsf@prevas.dk>
Date: Wed, 11 Sep 2024 12:53:31 +0200
Message-ID: <87h6am7978.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27395/Wed Sep 11 10:32:20 2024)

Rasmus Villemoes <linux@rasmusvillemoes.dk> writes:

> Esben Haabendal <esben@geanix.com> writes:
>
>> Rasmus Villemoes <linux@rasmusvillemoes.dk> writes:
>>
>>> Esben Haabendal <esben@geanix.com> writes:
>>>
>
>>>> +	struct isl12022 *isl12022 = dev_get_drvdata(dev);
>>>> +	struct regmap *regmap = isl12022->regmap;
>>>> +	uint8_t buf[ISL12022_ALARM_SECTION_LEN];
>>>
>>> The kernel normally says u8 (and you do as well in _set_alarm()).
>>
>> Another copy-paste issue. This time it was from _read_time() and
>> _set_time().
>>
>> To avoid inconsistent coding style, I guess I should add a commit
>> changing to u8 in _read_time() and _set_time() as well.
>>
>
> Ah, hadn't noticed that. Yes, please fix that up while in here.

Done.

>>>> +	int ret, yr, i;
>>>> +
>>>> +	ret = regmap_bulk_read(regmap, ISL12022_ALARM_SECTION,
>>>> +			       buf, sizeof(buf));
>>>> +	if (ret) {
>>>> +		dev_err(dev, "%s: reading ALARM registers failed\n",
>>>> +			__func__);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	dev_dbg(dev,
>>>> +		"%s: sc=%02x, mn=%02x, hr=%02x, dt=%02x, mo=%02x, dw=%02x\n",
>>>> +		__func__, buf[0], buf[1], buf[2], buf[3], buf[4], buf[5]);
>>>> +
>>>> +	tm->tm_sec = bcd2bin(buf[ISL12022_REG_SCA0 - ISL12022_ALARM_SECTION]
>>>> +			     & 0x7F);
>>>> +	tm->tm_min = bcd2bin(buf[ISL12022_REG_MNA0 - ISL12022_ALARM_SECTION]
>>>> +			     & 0x7F);
>>>> +	tm->tm_hour = bcd2bin(buf[ISL12022_REG_HRA0 - ISL12022_ALARM_SECTION]
>>>> +			      & 0x3F);
>>>> +	tm->tm_mday = bcd2bin(buf[ISL12022_REG_DTA0 - ISL12022_ALARM_SECTION]
>>>> +			      & 0x3F);
>>>> +	tm->tm_mon = bcd2bin(buf[ISL12022_REG_MOA0 - ISL12022_ALARM_SECTION]
>>>> +			     & 0x1F) - 1;
>>>> +	tm->tm_wday = buf[ISL12022_REG_DWA0 - ISL12022_ALARM_SECTION] & 0x07;
>>>> +
>>>
>>> Here I'd also suggest keeping each assignment on one line, it's rather
>>> hard to read this way.
>>
>> I agree, and I will change it here. But if the 80 columns rule is out,
>> what kind of rule for line width is used instead?
>
> See commit bdc48fa11e and the current wording in coding-style.rst. In
> particular I think
>
> +Statements longer than 80 columns should be broken into sensible chunks,
> +unless exceeding 80 columns significantly increases readability and does
> +not hide information.
>
> applies here. I'd even say you could use spaces to align the = and &
> operators (that is, make it '->tm_min  = ' and '->tm_hour = ').
>
> So the 80 char limit is still there, just not as strongly enforced as it
> used to, and once you hit 100, there has to be really strong reasons for
> exceeding that. But 85 for avoiding putting '& 0x7F); on its own line?
> Absolutely, do it.

Got it.

>>>> +
>>>> +	/* Set non-matching tm_wday to safeguard against early false matching
>>>> +	 * while setting all the alarm registers (this rtc lacks a general
>>>> +	 * alarm/irq enable/disable bit).
>>>> +	 */
>>>
>>> Nit: Don't use network comment style.
>>
>> Ok. I did not know this was network comment style only.
>> So it should be with both '/*' and '*/' on separate lines?
>
> Yes. I wanted to point you at the coding-style part which explains the
> different preferred style for net/ and drivers/net, but then it turns
> out I couldn't because 82b8000c28. Also, see
> https://lore.kernel.org/lkml/CA+55aFyQYJerovMsSoSKS7PessZBr4vNp-3QUUwhqk4A4_jcbg@mail.gmail.com/ .

Haha. You are so out of touch :D

I have changed to the normal kernel style.

>>>> +	/* write ALARM registers */
>>>> +	ret = regmap_bulk_write(regmap, ISL12022_REG_SCA0,
>>>> +				&regs, sizeof(regs));
>>>
>>> Nit: Fits in one line (I think), and you probably want to use the
>>> ISL12022_ALARM_SECTION name here, even if they're of course the same.
>>
>> Using ISL12022_ALARM_SECTION makes the line 85 columns. I must admit I
>> feel a bit uneasy about going over the 80 columns, as I have no idea
>> when to wrap the lines then...
>
> As for the name used, you should at least use the same in all the
> regmap_bulk_*() calls. If you don't want to hardcode that SCA0 is the
> first and thus have a name for the whole region, you could make that
> name a little shorter (_ALARM_REGS maybe?).

I am changing it to _ALARM and _ALARM_LEN. It definitely makes the code
more readable IMHO.

> I think vertical real estate is much more precious than horizontal, so
> I'd prefer to have this be
>
>   ret = regmap_bulk_write(regmap, ISL12022_ALARM_SECTION, &regs, sizeof(regs));
>
> regardless of line length (as long as it's not crazy), because then I
> can see more context.

With _ALARM, it even fits within 80 columns.

>>> I see why you do the ! and !! dances to canonicalize boolean values for
>>> comparison, but it's not very pretty. But ->alarm_irq_enable has the
>>> signature it has (that should probably get changed), so to be safe I
>>> guess you do need them. That said, I don't think it's unreasonable to
>>> assume that ->alarm_irq_enable is only ever invoked with the values 0
>>> and 1 for the enabled argument, and e.g. rtc-cpcap.c gets away with that
>>> assumption.
>>
>> The handling in rtc-cpcap.c looks a bit strange IMHO. The comparison is
>> without using !, and then the assignment is done with !!. I think we
>> should either rely on enabled always being either 0 or 1, or handle the
>> cases where it might be something else.
>>
>> I prefer to play it safe for now.
>>
>> But if I explicitly do this first
>>
>>     /* Make sure enabled is 0 or 1 */
>>     enabled = !!enabled;
>>
>> Then we can leave out the ! and !! below. The code should be more
>> readable, and it will be much clearer for anyone that later on will want
>> to get rid of this.
>
> Yes, that's a good compromise.

Ok, then I am waiting for clarification from Alexandre on how to change
_setup_irq() before sending out v2.

/Esben

