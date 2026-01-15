Return-Path: <linux-rtc+bounces-5761-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AD5D22E50
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Jan 2026 08:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23BDC304A585
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Jan 2026 07:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1512C325709;
	Thu, 15 Jan 2026 07:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wnha1Hck"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30589313547
	for <linux-rtc@vger.kernel.org>; Thu, 15 Jan 2026 07:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462749; cv=none; b=pX1Aw5uQYPCrJyzohqM6ASv/jCykfm2O2T0Tgh8GO49fZ6wblUfQAZPmcAuRfeOxOD2kogERKMcgTgOmWghp4DmjUoUhE7lsuHH0y6GIH4AtZ0gxkvnPA6L/UPz1yhhe1S/mbpQDmM+bIl/899t66NTTIXnJSQgNw1LxSJmjxl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462749; c=relaxed/simple;
	bh=wahNfXhrWaOBKB3KgjZKVohw0NuT5yRlweOyGs+9Fak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QbEOsSAgvdp9Ec7ARilcQzBLsDFdmbXN1lPAsY+sq4gRvhEgyntdXjmJklPQrsK/OLzsOIE0OG/atSNFATyskbsjjU4hoG6AbA69sykGeaVIrbXpIhsozYtUW2Y5tni59QgWVUuZOIaaVviYOtpnu5hmm8u7BCsc7zaNTevW3Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wnha1Hck; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6505d3b84bcso828995a12.3
        for <linux-rtc@vger.kernel.org>; Wed, 14 Jan 2026 23:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768462745; x=1769067545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wahNfXhrWaOBKB3KgjZKVohw0NuT5yRlweOyGs+9Fak=;
        b=Wnha1HckFusqomgF8JJewGlgwxzHVAIRZKTXX9KOPfrXUqxp6AybzdjoqGKZZ6AuBO
         G8R+Pt32Bu3Scmufe6nG48f7a3lOTFm9Tzk027kAgmBcYtOzS9FFlMH/uxHzE8hMyoRS
         Hu6Ht0tOdhM6oigyQ5cb3Avg5plBLOE0P4iWdN5FT7rfUE+3dCaEIK6WV1Xm/GOuvEN4
         XdnEwMn/WHTdxjxcsvI6dLYW+SQhoX65sWfatPAgddAtQQOEh7T1NbKPckURU266ZXyf
         UGpy5yA4YEMdQyXnvDNRHuf8jPy9cjNcGfXVRpKzbizIEviLW+tNd8ovvy2PAo6z7Mxk
         lCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768462745; x=1769067545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wahNfXhrWaOBKB3KgjZKVohw0NuT5yRlweOyGs+9Fak=;
        b=MQTtt7WjGGRWU6YrUXNXOWXacAKvF8X5+fTwvFmnzsbqVj7DyP3h1j+DppPAOQpDM5
         ctm8LcqRb2/3Ae77sy8eC8PdfCdPg+W7cCt/mxkPQktPpoyhX1gA0sKz2xJCjC/bNZn2
         qu4Fqzgp6emTaBvhR8YjTvpA4nn6e3qPjA0r5L9Hpg7CjhYmSD1PLIDzc+0mc2nf3kN2
         eBmGJRE/NVUxR8ZNA/tM/AHIIZVPUrCoWOKEsA6EKSPPh9xSkG98Cmr5OluYs0yTDs2E
         64xiNXAsrYvCQXGl0dUtpMbHq0DETdAJOmFoLh7Q8m0RIGJtoobqxTE8NQDmVrBSwsg+
         QeLw==
X-Forwarded-Encrypted: i=1; AJvYcCX89FAqh4TyBVVMUgi9qsSRPoVewYTBtL9ovSTQSnbUKnCYdwTlYu4DWClqnN4RrMNTrhJ7kvkaKCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YynE1Jbm749kWSXknkNHwJDhtnpe+enQ5I9r07MrPm6B1e2SoI1
	lZFSqMhlyX/0dZUwSROA6C4v9iDdgVMukiddp919PoeyL7opZoD2PmbfbaSa6N/1QngmoTqv85q
	tD69+BeU0CQgGSKByCU7DS6NCJkxnHrs=
X-Gm-Gg: AY/fxX6iB9vodiUWUPYbiHXOORk4IqwyO5IRaxzCDHzywaxvpQjjg2ZDrVXC6agi4Sh
	mj1ohOGpscoYMV21mrWPbDLnsPYO/rJmKebhswANVXy57OQYzTZZmu40xxlYhHFrs92p05zBFB2
	XwyxQUP2Ft+izTBlNHcwL6dHh6iV8HcKncnrfc5lghDLduYQqbFjwxHI9sSIf3oSERqtNBcxIhQ
	tFQbOW6bmxIwtRBLjfDZHeThDdkZFybnU9+9SJJtF14h3WQfilYbA/f0vm4yy6wXSHGxdXh
X-Received: by 2002:a17:907:5ce:b0:b83:9767:c8ba with SMTP id
 a640c23a62f3a-b876775c257mr364217166b.17.1768462745211; Wed, 14 Jan 2026
 23:39:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767663073.git.zhoubinbin@loongson.cn> <8876bebaf08121bb5edd2500f5289284b75df011.1767663073.git.zhoubinbin@loongson.cn>
 <20260106191314.GA2568583-robh@kernel.org> <CAMpQs4LpKSLGKySmzHeysS3x78inUQy9DF4dShneNymDvAi4Ew@mail.gmail.com>
 <20260114205855.GA3190839-robh@kernel.org>
In-Reply-To: <20260114205855.GA3190839-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 15 Jan 2026 15:38:52 +0800
X-Gm-Features: AZwV_QjRRxACkfvlwb4vl80In-Ga3y0YpHc3YfqsZdPdlGNLPswkM9BXr7n-Nnc
Message-ID: <CAMpQs4+v=KhLW_Cru801p06vmpjJFotvyDfKBALg6mbwxFU5-A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-binding: rtc: loongson: Document
 Loongson-2K0300 compatible
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

Thanks for your reply.

On Thu, Jan 15, 2026 at 4:58=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Jan 07, 2026 at 09:22:41AM +0800, Binbin Zhou wrote:
> > Hi Rob:
> >
> > Thanks for your review.
> >
> > On Wed, Jan 7, 2026 at 3:13=E2=80=AFAM Rob Herring <robh@kernel.org> wr=
ote:
> > >
> > > On Tue, Jan 06, 2026 at 09:33:32AM +0800, Binbin Zhou wrote:
> > > > Add "loongson,ls2k0300-rtc" dedicated compatible to represent the R=
TC
> > > > interface of the Loongson-2K0300 chip.
> > > >
> > > > Its hardware design is similar to that of the Loongson-1B, but it d=
oes
> > > > not support the alarm feature.
> > >
> > > But you are requiring the interrupt property for it? Isn't it no alar=
m
> > > feature means no interrupt?
> >
> > Yes, the `interrupts` attribute is not required without the alarm featu=
re.
> >
> > But my judgment condition is `not contains` (added in patch-1[1]).
> > There are only a few SoCs on the Loongson platform that don't support
> > the RTC alarm feature, so I think `not contains` looks cleaner and
> > simpler.
>
> I should have said allowing rather than requiring.
>
> You are allowing (though not requiring) 'interrupts' for Loongson-1B and
> Loongson-2K0300. In patch 1, you made it required for other platforms
> which is an ABI change. That's fine if it was a mistake and is truly
> required.

Emm, it's true that for the binding interface, Patch-1 is indeed an
ABI change, but it's more of a fixed patch.

Throughout all existing Loongson DTS{i}, RTC nodes decide whether to
include the `interrupts` property or not based on the alarm feature.
Loongson-1c rtc nodes do not include the `interrupts` attribute [1],
while all other Loongson chip rtc nodes do [2].

So, while this is an ABI change, I don't think it affects existing
Loongson DTS{i} rtc nodes. Also, it more accurately describes the
features of the corresponding RTC device.

Therefore, I would like to clarify it in the Patch-1 commit message of
the next patch version and fix the error in the commit title:
dt-binding -> dt-bindings.

How do you feel about that?

[1]: https://elixir.bootlin.com/linux/v6.18/source/arch/mips/boot/dts/loong=
son/loongson1c.dtsi#L98
[2]: https://elixir.bootlin.com/linux/v6.18/source/arch/loongarch/boot/dts/=
loongson-2k0500.dtsi#L486

>
> Rob

--=20
Thanks.
Binbin

