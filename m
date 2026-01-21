Return-Path: <linux-rtc+bounces-5809-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDAOE1p4cGktYAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5809-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 07:55:22 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E2A526EB
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 07:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0E9A146808B
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 06:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68FFD42846F;
	Wed, 21 Jan 2026 06:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQv47LEj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC3B44A721
	for <linux-rtc@vger.kernel.org>; Wed, 21 Jan 2026 06:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768978342; cv=pass; b=JRBjndbInYMAh7MfIqA5aXViWWbALDnx6z8s4Awp/aHImwSuiDGJKyrSbeZoKysLiVLEC/yIOuMTYy5yqO6hOBYFChAMa7hy5dQHeb3vU9AaEPo09eSpSrU8bx5vuKifxwUJwInvJjtpwvZD3oq1GUo1Nc/+/vtlK7xeo+Bg4gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768978342; c=relaxed/simple;
	bh=WuLWKn+Ff/W1Lpsf/WGVvO+l9UCyZOc5iNVqRoQOt8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HX0lmzKa6+0zuT8vennTmqZP6kzJhZtMa8t99Zn5aBONXO6MrciJAOtQsll//BPIeEA1Nt0fSCerzN08AitonvxOwqEbmruyNu2k4Q2RlWRi/pti6YqmiA7PGtXjKhpGe0H3eBc0GMTS8O8E656iSGE6F74XhN/6iWnSB/bQrnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQv47LEj; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8707005183so1056112666b.0
        for <linux-rtc@vger.kernel.org>; Tue, 20 Jan 2026 22:52:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768978338; cv=none;
        d=google.com; s=arc-20240605;
        b=J6BKN+Bt9Q8MBODNS9+M7X3jOb2Wwwd9cDObFc8vDiAnLY2ocqKuui75aKMlsK3BkL
         EnP0hvHDcvvSHZCOEb2NKEgbkBKSqhaH8XS6zQztaz3OpW8Jf35Yd/twiymz+G28rHM5
         pO/t+BGcBB9tVr3xq3x9q8j4RH3RaMhVEW+DFo1QSfB77REuxUw9GCAIaQSsqNjLLasv
         fS0yLEBWo4viiKicLSfZgydzdwSi14hNYjZUnAt4CqgG6lthClChVXKipwRTAjGg5Luq
         eZWQoPSppavV0nnAoCU4qVu4lExUfYCLoVtPgHr2j1r+pC+3e7A5cWQckd4oQocGaJ5w
         y9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WuLWKn+Ff/W1Lpsf/WGVvO+l9UCyZOc5iNVqRoQOt8o=;
        fh=0lobI7+bEDMT/fDjDR6AbtvSqWFeepcN+lFOpbT4n+s=;
        b=G2gnmkqgWcBdH9V+znFH1AXSrKsmQqplIzpPUnYC4cMAnpJTXRnC8rjaYUOIpcQ0SP
         GavmOVVRYH9rh+23MVpsHA//5mOYppFc3tzBhYr9lbdhJy/dlp5htZNmVZ7rn4DV+Q7g
         arGQrw9blDTWfitAX3uUrYlQPEM+2w2DhcEXPOvBGnVdObfaaAXNE6idR15p1RZc4TnM
         fcFjKnfMzbxnYdmuBAepCpRwenRYO9YngN2bx4IV92wDgU5KJVFxHpwkrIKOqi/ZUvNH
         NQe2nzTMkkfLa3woqR4YsboEsjKfMxhGAZUxY18vJMOf3D06lXliOuxGudKqlMkOPXI3
         mfNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768978338; x=1769583138; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuLWKn+Ff/W1Lpsf/WGVvO+l9UCyZOc5iNVqRoQOt8o=;
        b=XQv47LEjDD1lkdImoejyGI5QSUuasobMBIELUSVVQD/Or+QUGKf1pkaSoiQHQjsdHZ
         DS8HVMZHL8MjXrThfqn/x2ZZC6aUgT10+Kyz8im66h4tYX9Hled0lFzsX9qNXSmQmU+5
         luzi0/C/pUPJmDR0I+TxOlLQG0ISKuC55sfEzXwkQ1e3nYG2gUSTL11Lyb8sz/FuVzes
         pisGdz6z2BwoJcIU9BsGuThX3Wrrrs61KxpVzzdASwgeRGURKVn/BsB8BJwoQ1gMtKs5
         Xz6+G3yY2QJlL8g4VPL8SHza7kQ+aQjSbiRosdYnxphM1P9fGHGCNtt4t+EURXslP7ne
         VoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768978338; x=1769583138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WuLWKn+Ff/W1Lpsf/WGVvO+l9UCyZOc5iNVqRoQOt8o=;
        b=vjS+Ce1MWqYxIivJDZYrtHB6tOz9Nm6uNIkQXIXrcznuBeYFa8f5jZLGKpJHu0plk4
         kTaafqm0lA2cy7lM8H237s/3O3JKwoCXHbDMw8gKEIpxXFmJbRzoPBBGSICTA9Do3KlL
         kKQhHTlkEcoiawOTdUzsAncECP6zLeG6csPeZk4u2maQeHo7GLeQaqq2XU7nPvVfinMW
         /wzhRvFHR7pDm10mJ4EhIIigGloDDwFDv5V0No97TQwWzS8sI9yM7UFf/HwGrIZs1jSJ
         joI+/tia1OU6A+0wODn/U8szR1/qBCbHYcWYrAylF1GFv6GJoxBCYea30BlYpNGMGKVZ
         D1dg==
X-Forwarded-Encrypted: i=1; AJvYcCUPtBFP18qJkQLziuxZgBnBkpZdelPFEeHrQUuYldA7k5RhLH/+l/90/zzoiXN/SfLyxq45gWFVPQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeA8aanR1DNXu6uVJxuEGHbwWgf+QDclGqWe16DnLDFdM09Rzn
	7Kqg5YP+IBUFBa09FzjgKuuhs2FIiQoDYkY7G5MvxIvZUQCj+tirfazPOwbGmObx/YwETvqbqpS
	S8oH3144MDt8GCIppReySsMTId+4BnbM=
X-Gm-Gg: AZuq6aKY3g3XFS9wMd+s9xE0/ia3y0pbvGzik6xBMbJBFxD8n9iIFnWpyaGLbydCtiC
	f8CuzCGcb4x/vqCSoFIJk0TDdMdot82YhP1mu8fEc1EK0ZXtQywaU3Af3g7i0t4scUb7tiFP5qF
	YUICeFbsFqbODCBi8lWnEN7SIVhCbtkInD5hWhjqmRnq+J4jwugBVXaB/uupB3bXwj7V2x0pLNv
	an3N7CXLCeG6UmnfIPU/pfa/w2XJekVzdjDjTDRWQo4ISILYxvAHduDl3EkWJgDx9TaPvs=
X-Received: by 2002:a17:907:3d42:b0:b87:35fc:ae6e with SMTP id
 a640c23a62f3a-b879327dfb1mr1455742566b.46.1768978338185; Tue, 20 Jan 2026
 22:52:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1768616276.git.zhoubinbin@loongson.cn> <b6295c907410f6708115cba4df0959ee6629f8a5.1768616276.git.zhoubinbin@loongson.cn>
 <20260119-tricking-premiere-ada70700f804@spud> <20260120075045e7e864ba@mail.local>
 <20260120-cubical-harmonica-a7b7bbb26b08@spud> <20260120224920df0cf2ac@mail.local>
 <20260120-proposal-retry-d0a1f3de10ea@spud>
In-Reply-To: <20260120-proposal-retry-d0a1f3de10ea@spud>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 21 Jan 2026 14:52:06 +0800
X-Gm-Features: AZwV_QgA6UvIfzq-IFvgjS9upO0HXk3JXVuJsZZ81j4MJRt35v5CeDrdmHWS9o0
Message-ID: <CAMpQs4Lm1Oq8L+dY8OnseV-NNUoD3+0QjnZATRkmR-sejCKAdA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: rtc: loongson: Correct Loongson-1C
 interrupts property
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5809-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[bootlin.com,loongson.cn,kernel.org,vger.kernel.org,xen0n.name,lists.linux.dev,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhoubbaaron@gmail.com,linux-rtc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: E2E2A526EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Conor & Alexandre:

Thanks for your reply.

On Wed, Jan 21, 2026 at 7:39=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Jan 20, 2026 at 11:49:20PM +0100, Alexandre Belloni wrote:
> > On 20/01/2026 19:24:09+0000, Conor Dooley wrote:
> > > On Tue, Jan 20, 2026 at 08:50:45AM +0100, Alexandre Belloni wrote:
> > > > On 19/01/2026 18:24:36+0000, Conor Dooley wrote:
> > > > > On Sat, Jan 17, 2026 at 10:26:48AM +0800, Binbin Zhou wrote:
> > > > > > The `interrupts` property indicates an RTC alarm interrupt, whi=
ch is
> > > > > > required for RTCs that support the alarm feature, which is not =
supported
> > > > > > by the Loongson-1C RTC. We exclude it for a more accurate descr=
iption.
> > > > > >
> > > > > > Changing the `allowed` property is ABI-breaking behavior, but
> > > > > > throughout the existing Loongson DTS{i}, the description of the=
 RTC
> > > > > > nodes conforms to the modified bingding rules.
> > > > >
> > > > > Right, changing properties is an ABI break, but when following th=
e ABI
> > > > > would've produced something non-functional, breaking it is not re=
ally
> > > > > relevant.
> > > >
> > > >
> > > > But the HW has the interrupt, the fact that is not functional doesn=
't
> > > > mean it isn't there. I thought we should describe the hardware?
> > >
> > > Does the hardware have it? My interpretation of the commit message wa=
s
> > > that it didn't have the alarm feature and thus no interrupt? Unless t=
he
> > > interrupt has some other purpose, in which case yeah we shouldn't acc=
ept
> > > this change and only the new device should permit there being no
> > > interrupt.
> >
> > The datasheet shows the interrupt coming out of the RTC and it has the
> > proper registers. Why it is not functional is not clear to me.
>
> Right.. Perhaps Binbin can explain that then? If the interrupt is
> actually there then the dts should get fixed instead IMO.

I carefully reviewed the manual again and believe this patch is still neces=
sary.

First, the Loongson-1C RTC does not define the timing interrupt
register (`TOY_MATCH0_REG`)[1], meaning it lacks hardware support for
alarms. Consequently, `interrupts` are also unnecessary.
The Loongson-2K0300 is different. It defines `TOY_MATCH0_REG`, but due
to a hardware design flaw, accessing this register causes system
crashes. Therefore, I must also classify it as lacking alarm support.

Additionally, in patch-3 [2], I rewrote the alarm logic to decouple
the `interrupts` property from the alarm feature: I defined
corresponding workaround bits in `loongson_rtc_config->flags`. This
should be considered a SoC-specific attribute.

Finally, two thoughts:
1. Retain this patch; it is correct for Loongson-1C.
2. For Patch-2, still add the `interrupts` property to the
Loongson-2K0300 RTC node (as it exists in hardware), combined with the
workaround bit setting in patch-3 to avoid the hardware flaw.

Would this approach be acceptable?

[1]: https://www.loongson.cn/uploads/images/2022051616223977135.%E9%BE%99%E=
8%8A%AF1C300%E5%A4%84%E7%90%86%E5%99%A8%E7%94%A8%E6%88%B7%E6%89%8B%E5%86%8C=
.pdf
(section 21.2.1)
[2]: https://lore.kernel.org/linux-rtc/abff68dda2fe6a6601a9e58b31e278d94129=
7fce.1768616276.git.zhoubinbin@loongson.cn/

--
Thanks.
Binbin

