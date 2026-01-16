Return-Path: <linux-rtc+bounces-5766-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9F1D298EF
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Jan 2026 02:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 349983027E16
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Jan 2026 01:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D5331196D;
	Fri, 16 Jan 2026 01:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGAdR3nK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B8832939A
	for <linux-rtc@vger.kernel.org>; Fri, 16 Jan 2026 01:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768526119; cv=none; b=cHqdBQflcN17qr4/tv8xYXbH+5H48NN38Jf4PErVDDf+CuLQVJIgeR28/t6ShmygmHlnB8f/iS9K/DP4OKEh2rRcNuRRngkku0H0L321rt8tdcA4bmaeLo77ktQ+03WdHSgOcKrEbd1UIJVfkt3dvqi0F9CldZiKmwNBZexk+Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768526119; c=relaxed/simple;
	bh=ROU4R67s950GbA7GHKQWHktozeFvbhpGduCMWOOF/Io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VjL6bpkN1IXj+GkF4PFPdPlVk0qW62fJRQUoQtj7dSIiepmAHPopT3nQg0lG6ejrBo7t5M03hKtT5vYWmOxL9cimbKxMaT/6eZOJFP8LkB1W2Q5+HxHuRWPLOadYWEIfIWt5Tq9D4+UnRl1wYoLRXV7jLJt8rutc37+dvKDRL4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGAdR3nK; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64bea6c5819so2591062a12.3
        for <linux-rtc@vger.kernel.org>; Thu, 15 Jan 2026 17:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768526105; x=1769130905; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KS5A6hdws9JgSg5NdQLN8SLz4AQmGLJR4UdFXen0ylY=;
        b=WGAdR3nKFmzxe9lIyP+fL2kMNvgUvbY6wKC8CqaQzX82a+RL56V18+r/CLd1LqW9Hb
         x/uiER+JeOClJ0qZ5qc4VoI8MkTyRRB2tC+8mcZTqlNG3UmszeTRYshboIw6Xb4HSSjj
         MHv/tizZeQGg7VKyEUZIdnC8xV/AWcOhjSZwuCd/c1EhEju/xP01UuqF5Se8yjfBsWWz
         Ovy2pth/gNaiUsVj/nYmxR7A72aWwI9fbT1cD5KLdvIDZe6J/DS1kM9dU5iW7rSFK9Yz
         KY2ZHf8MK8VWXesRwdMUpgbazedJKdA6rg3jAlR3M3WoQ51EWlIhCSAdmroHSvzU0JnD
         hUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526105; x=1769130905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KS5A6hdws9JgSg5NdQLN8SLz4AQmGLJR4UdFXen0ylY=;
        b=SpHZHP1fZqPfUjPxhMGB9rJcFeWAEpB1dXb8+2TwOuOVTqgh1dly1TC9yX8Y3u2szp
         tU8fqVpf1l78Suyo8FtcV7mUlVP3mEn7QWZU29gCkG61HjbciqQlb5qAmFmjVA49yCG3
         ZxMD/KUpy5vn0HRo8lPETn5slG1Sl7B4/Oh8cE3xPq+BSRn4Avu0FKjOPKuD/iN+nNdT
         BzCPvmaop2TuHED0w4TEXUdvDWSXA8jaMCTwXydNhYI1ToTQmOhu5BMFRNlxxJjtMYkB
         i8Azbs2BRcN0rU8AK/MAIhjYk6Y0dH5QQ21Tyl5Zta5RIOis8pB3YQPy+JNg1TNMcT9N
         b7hg==
X-Forwarded-Encrypted: i=1; AJvYcCV7pbV5YTjT3rE3tWwxzwqEMUUq6BBQDAiOTH6f0SYDxPpdKfp9CKurst+Q9uXRUPdHHiIaIvgdAE4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgwq5HmuNivysC2fHwY+IbDCe7J7VImWC6yHmgLsQ9v+Dp51DP
	67e1Fq7gXp/4ERF4ClKt2lTHl7auRLyQFI3R24NwdAE4CxhKMJOiZ2eKCMMak057GCW6FFr17Wc
	lISoYcQgeoWvxcK5GlXLOzVfDAhgxRRA=
X-Gm-Gg: AY/fxX48TyabHlKyhLs4qGZ/O5PtErxT2iLRBy6CpJuCH48H7OxQySle6IUOCKk7IC7
	Lvf/QOlQjBKgzxlkmetBCy95eKS1vQrf3CX5Oc3q8XhoXfva+WXwRzc1PKJEsPo4Bo75TNcBO+M
	Wtl1igJ9oERT62wxQ5oeOna4Yheuj2N5RXRBMLAy6NTK65/t3J4alov8WzA9i8bAzLcnqPknHUj
	vULiCui2ZooQUSO6TNWWEBw7Me3t1euAqQzd6Hwxy7w6pcSn+qPwN08/ZOtpLrunxcq+jSRAUp1
	1MPJu5k=
X-Received: by 2002:a05:6402:51c9:b0:645:1078:22aa with SMTP id
 4fb4d7f45d1cf-65452acb341mr974597a12.19.1768526105360; Thu, 15 Jan 2026
 17:15:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767663073.git.zhoubinbin@loongson.cn> <8876bebaf08121bb5edd2500f5289284b75df011.1767663073.git.zhoubinbin@loongson.cn>
 <20260106191314.GA2568583-robh@kernel.org> <CAMpQs4LpKSLGKySmzHeysS3x78inUQy9DF4dShneNymDvAi4Ew@mail.gmail.com>
 <20260114205855.GA3190839-robh@kernel.org> <CAMpQs4+v=KhLW_Cru801p06vmpjJFotvyDfKBALg6mbwxFU5-A@mail.gmail.com>
 <CAL_JsqJVD3o41Zch6fMY6s-qmyd9cQg6CJ+iya+3kdtuqvNMoA@mail.gmail.com>
In-Reply-To: <CAL_JsqJVD3o41Zch6fMY6s-qmyd9cQg6CJ+iya+3kdtuqvNMoA@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 16 Jan 2026 09:14:52 +0800
X-Gm-Features: AZwV_QhUFfli37YKjCtOZoZJEFk_EN3-i1wZz_UWr78liB25i8-qldPEHYjcGIE
Message-ID: <CAMpQs4JuGXvNA+gbo3LHeqEw+JZ2JNnmgfLZZQNV+A62e+psdQ@mail.gmail.com>
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

On Fri, Jan 16, 2026 at 1:00=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Jan 15, 2026 at 1:39=E2=80=AFAM Binbin Zhou <zhoubb.aaron@gmail.c=
om> wrote:
> >
> > Hi Rob:
> >
> > Thanks for your reply.
> >
> > On Thu, Jan 15, 2026 at 4:58=E2=80=AFAM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Wed, Jan 07, 2026 at 09:22:41AM +0800, Binbin Zhou wrote:
> > > > Hi Rob:
> > > >
> > > > Thanks for your review.
> > > >
> > > > On Wed, Jan 7, 2026 at 3:13=E2=80=AFAM Rob Herring <robh@kernel.org=
> wrote:
> > > > >
> > > > > On Tue, Jan 06, 2026 at 09:33:32AM +0800, Binbin Zhou wrote:
> > > > > > Add "loongson,ls2k0300-rtc" dedicated compatible to represent t=
he RTC
> > > > > > interface of the Loongson-2K0300 chip.
> > > > > >
> > > > > > Its hardware design is similar to that of the Loongson-1B, but =
it does
> > > > > > not support the alarm feature.
> > > > >
> > > > > But you are requiring the interrupt property for it? Isn't it no =
alarm
> > > > > feature means no interrupt?
> > > >
> > > > Yes, the `interrupts` attribute is not required without the alarm f=
eature.
> > > >
> > > > But my judgment condition is `not contains` (added in patch-1[1]).
> > > > There are only a few SoCs on the Loongson platform that don't suppo=
rt
> > > > the RTC alarm feature, so I think `not contains` looks cleaner and
> > > > simpler.
> > >
> > > I should have said allowing rather than requiring.
> > >
> > > You are allowing (though not requiring) 'interrupts' for Loongson-1B =
and
> > > Loongson-2K0300. In patch 1, you made it required for other platforms
> > > which is an ABI change. That's fine if it was a mistake and is truly
> > > required.
> >
> > Emm, it's true that for the binding interface, Patch-1 is indeed an
> > ABI change, but it's more of a fixed patch.
> >
> > Throughout all existing Loongson DTS{i}, RTC nodes decide whether to
> > include the `interrupts` property or not based on the alarm feature.
> > Loongson-1c rtc nodes do not include the `interrupts` attribute [1],
> > while all other Loongson chip rtc nodes do [2].
> >
> > So, while this is an ABI change, I don't think it affects existing
> > Loongson DTS{i} rtc nodes. Also, it more accurately describes the
> > features of the corresponding RTC device.
> >
> > Therefore, I would like to clarify it in the Patch-1 commit message of
> > the next patch version and fix the error in the commit title:
> > dt-binding -> dt-bindings.
> >
> > How do you feel about that?
>
> That's fine, but you also need:
>
> else:
>   properties:
>     interrupts: false
>
> So that on the 2 platforms without an interrupt(alarm), 'interrupts'
> is not allowed.
>
> With that, you might as well just drop the 'not' and flip the 'then'
> and 'else' schemas around.

OK, I'll fall back to the writeup in the v1 patchset as follows:

if:
  properties:
    compatible:
      contains:
        enum:
          - loongson,ls1c-rtc
          - loongson,ls2k0300-rtc

then:
  properties:
    interrupts: false

>
> Rob

--=20
Thanks.
Binbin

