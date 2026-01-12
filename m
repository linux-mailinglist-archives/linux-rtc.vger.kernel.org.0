Return-Path: <linux-rtc+bounces-5733-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDE0D10482
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Jan 2026 02:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CC27302017E
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Jan 2026 01:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AD622A7F9;
	Mon, 12 Jan 2026 01:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="YrJp7mjS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26171B672;
	Mon, 12 Jan 2026 01:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768182611; cv=none; b=bMMLd82mNSP6gCEoo2VEzKdKCOGM/ftwbilShmoaOY56VmypTSKorcF8HJwCiRAVt+ehwJLqrOSewoXH4THx+m7uiVs77SReEUUjMG7UBMSimC9IwcsWeyDwykBvok9TrMWOhtPwybbaKUWmR4wOurxKONih62+fE0HOcgWtK0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768182611; c=relaxed/simple;
	bh=ojSmuF3bZThAalVPD7IUaTZ+sCk8cbn5RsgGUwN9KTc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Ts+cvvf9x8T6WvK1+sHSnuNmlt4fU0hAlZ8zVTQ3hktbgJYDUp6mgiW9+rkRL9gaMQFbICcm6rrGm0AdSfhT2/X99voUHk0F0XdYKV1lVRtI5VbVV6eZbbsQOygZF9dxCXhFOtbJDyH68asH/oITWNrDduqZ33sokToiFBEpXWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=YrJp7mjS; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1768182605;
	bh=vXgizy4wIkS+ntIQMrsglm/OU4vxbvEgmvJk8CbngJo=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=YrJp7mjSG3l7A+WtVGyqQNSeYqWvXj2H0DQ27/Zax86UZfbTFF323xr9/l9sV1nLf
	 g8Fm6xKlEYfK2tOT14Sge036y798EgufpDYVzpz/1HL7x2eshjH8pufV7Gz1BU5xt+
	 YnXl5RHBTGIIZNybVHsr4gltSFLrWMI9guAKFdC4=
X-QQ-mid: zesmtpgz7t1768182601td230d057
X-QQ-Originating-IP: d/IJDIFXP7NV4/kPf6kV6P2D6IG5d8UiUn9KgZOiZR8=
Received: from = ( [183.48.247.110])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 12 Jan 2026 09:49:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 52625910496199400
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 09:49:59 +0800
Message-Id: <DFM8F4B9RK3A.1RG65AV3UCWC6@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Lee Jones"
 <lee@kernel.org>, "Yixun Lan" <dlan@gentoo.org>, "Andi Shyti"
 <andi.shyti@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-i2c@vger.kernel.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when
 MFD_SPACEMIT_P1 is enabled
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Alex Elder" <elder@riscstar.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
 <202512251653368b33c7e7@mail.local>
 <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
 <20251230005142d1bfc6f7@mail.local>
 <6ca28183-1687-4ddc-8b3c-5e5be4255561@riscstar.com>
 <20260109223627b566d2b0@mail.local>
 <a383dbc8-5d14-4654-933d-5dfa73a23b12@riscstar.com>
In-Reply-To: <a383dbc8-5d14-4654-933d-5dfa73a23b12@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NBsoDW1Dz+mVXTLVSRTXz+cuijNDe83AqRPyNLtU/enYf5UHoHx5fiOp
	54brKHolZKD+HT4isDj1jzRxdm5rqM8NqkVCYeLTcJadFIiEgvecSgpC4qo+wczkifAJd/9
	YVnQSVmFB5B+UYlG7m1J2KYWk0Godvxo+1DfEBYKZRsznbvEAoo6IoddTRSSI0d16oHIg5g
	KqHIZcZOcqVDiA/ExYljvJU+9cjLbgcyQ4QobHa49ETvCgZ2tZlU3nlUgk9O9bTM3s2B9Ep
	ZjpbaC+0ffyJ+rLQibTRauoElK3LnkutipybNh6wIl1uZAuCbKB8gOyOSC7TLrWni89T78Q
	W7lY0IW2+J6jGtvnB51CI2MVsD8l1VQNjFwLv6IxQu02p/Fdt6pqPmJ13gQlhArlzLDqstj
	jkWHQGXtWd75cd6hU2e+C3A4a3K/bgDH2b7TLyOWtMxpI59CsP/b8+0X5P/WimG/NC0jw78
	jOLLDfKDcyx/+B5OUfo2d/w5o3QvrE3q/ShzqfjvNBMkyIXj6MgbtgSg2AdN6v3gdavVHn6
	T7SX9uoVuRFNxkM8PCfMJzjeGV3TPy7l71sHy2itEo/Ks3GsMQe6iAD7PVZfxcg2mdZsp3e
	n+W7Cl30KIHYiXMBeORjSrvJ40CVTYorJYgGvqFni2+SBR2rKnYdFqJuLDlyhUFy1wTsjWF
	JDCpgWx9P+qvqgtAT5TvOBF67mAv3YAKonWK2P7SQM5P58/5PryiHU3ZkIBXVz15v0d3HQN
	qIxxYwy+Jt3Be0OPKHUXda2M+SHzkrf1kVHsSIYVYvHhSMfFCBiIAjo/CxI4DzzRyzL/3r4
	vxf+Yx4Y1DvK7bhAwyoAr2cvcBbGIgyvtwfSlHQ3H+U6taLjW3Fb0zxhJwTHMUS9DAqCzL6
	SuoMI5KoHfVpVyev5gZOb45KX9Z73csS9Hh4kdpmSEHuaAs3Fm/npM9MiDctZ4Otkbq9oQX
	N5nLI65PWef6WauEYKn3zGVaUQKL34RGl1bJ9cDCDzUIWYqCwaZIkzj0j9kGkyOlTIfBZNq
	rc1l+/DPqDMAI/3oiNDqV3FmmrVp1E93qI9FmjH2o4z/HT29t6vrXc6+8ooIk=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

On Mon Jan 12, 2026 at 3:55 AM CST, Alex Elder wrote:
> On 1/9/26 4:36 PM, Alexandre Belloni wrote:
>>> The purpose is to make the driver a module (not built-in)
>>> when "defconfig" is used (without the need for any Kconfig
>>> fragments to unselect things).
>>>
>>>
>>> In arch/riscv/configs/defconfig, we have this:
>>>      CONFIG_ARCH_SPACEMIT=3Dy
>>>
>>> In drivers/mfd/Kconfig b/drivers/mfd/Kconfig, we have this
>>> (added by patch 2 in this series):
>>>      config MFD_SPACEMIT_P1
>>> 	default m if ARCH_SPACEMIT
>>>
>>> So when using defconfig (alone), MFD_SPACEMIT_P1 is set to m,
>>> to benefit non-SpacemiT RISC-V platforms.
>>>
>>> This patch is trying to do the same thing for the RTC,
>>> i.e. having RTC_DRV_SPACEMIT_P1 be defined as a module
>>> by default.
>>>
>>> I think you understand.
>> I'm sorry, I must be dumb but I don't understand. The current behaviour
>
> I think I'm the dumb one.  I think I finally understand your
> point.
>
>> is that when MFD_SPACEMIT_P1 is m, then the default value for
>> RTC_DRV_SPACEMIT_P1 will be m. Since patch 2 makes it exactly that way
>> (MFD_SPACEMIT_P set to m), I don't get why it is necessary to mess with
>> the default of RTC_DRV_SPACEMIT_P1.
>
> Your point is that patch has no real effect, at least not
> on the scenario I was talking about.
>
> I.e., I was saying this mattered for using defconfig alone.
> But, as you point out, using defconfig alone gives us:
>
>    ARCH_SPACMIT=3Dy	(in defconfig)
>    MFD_SPACEMIT_P1=3Dm	(from patch 2)
>
> And then, *without* this patch:
>    RTC_DRV_SPACEMIT_P1=3DMFD_SPACEMIT_P1
> meaning
>    RTC_DRV_SPACEMIT_P1=3Dm
>
> And therefore there's no need for this patch to set the
> default to m rather than MFD_SPACEMIT_P1.
>
Thanks Alex and Alexandre for the clarification. You're absolutely right -=
=20
the patch is indeed redundant since RTC_DRV_SPACEMIT_P1 already inherits=20
the correct default value (m) through its dependency on MFD_SPACEMIT_P1.

I'll drop this patch in the next version and review the rest of the series
for similar unnecessary default overrides.

                                          - Troy
>
>
>> The current default behaviour of RTC_DRV_SPACEMIT_P1 seems to be the
>> correct one and the proper fix is then patch 2.
>
> Yes, now I understand.  I'm sorry about my confusion.
>
> 					-Alex


