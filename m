Return-Path: <linux-rtc+bounces-5628-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED172CE8912
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Dec 2025 03:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB720301397C
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Dec 2025 02:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F5D2DCBFC;
	Tue, 30 Dec 2025 02:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aa/MPRuU"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA30293B5F
	for <linux-rtc@vger.kernel.org>; Tue, 30 Dec 2025 02:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061935; cv=none; b=mMPCrm9hHWMQ8Cue5jxuGeWgIe13CGwYjUp+f2fShzeCT5eLyQty8RZJNpKi+xMeRJoGUdBbMOAxyC4SREJjzzDdXxFuv1we5YeK9vo74NAWOarVvT4jbFW2iGHIHWTZQ0kRpcbmYUHGbMkXM/6rxYcV91BqRIJzNKKGXIayWKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061935; c=relaxed/simple;
	bh=UMHU9FmII2BurntGYXoChYkmEDJXCqDMzuY736PKDTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CWUDiwvUtglTydx3AnaaMy7K1nWjWP3/gxUo3Eb0TSS1HkRuj7dgP7wsEt5P1jKJz1UjsNu5Z5Vk7mPbyYZgoCIUhyWexT5WXbuhGU/ebXT6MvioSXtwQaLRKpv1XUqM+FkT0UNBpTcLDargS5hTKMsGZAyMrkyr1wupq43ko8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aa/MPRuU; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso16062627a12.0
        for <linux-rtc@vger.kernel.org>; Mon, 29 Dec 2025 18:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767061931; x=1767666731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBMHX2/QGEuOryuyCmbWYYHbFM4ebeYaX/cSO55xE1E=;
        b=aa/MPRuUJLzNlEreB9jp7yNhisTEKlfOvhN4FJJ4MpMeVa6LXh4CgXZP9qbWQm+ojJ
         g02fM+Q3UPod7hLykjFrY8J/OXSW90U20zh145SjWEJ/fFt7ueh/rWtQAbuxnIIG49pl
         pVY4FtCzwbXJIOtX0DfgSCswAx2k2nfdtgCr5I20Q/9L8AJJfUvr73Op5+RstGgAOo/5
         iWTwOYhTRK3bhoLO9dkzf1h+LtwqG5S0f/5FoodH7Xa7WfRY3qgWM6aIHL+I1KNPnkh1
         HrjmJssPcbZx+Jr33ZLkdlieNXF7PU1UJXz44oiNShro02qriAUdpBhr5+FFl3cXo5Ut
         p9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767061931; x=1767666731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sBMHX2/QGEuOryuyCmbWYYHbFM4ebeYaX/cSO55xE1E=;
        b=bGE954K9pWyccK+7GdcylR/wtu8t1UJkWcoTd80ZW0wf4kbbdkP3jphTooSmj0o+9m
         jRYxSnCEEL65x9GuZqhq9dIcbU96sxLDE9diJPdT6mhayJzCc3kALfV/G0GucKvblCU7
         DI/g0YX6koC7hzU81nVdKJAkKtfe5S7dmfpLQBck/7U0gHt9cNSil1e9QmqRSc4Zxydp
         wXAEQS3deUXHlXDWKi9cFV9svnkuv0Hw4DFMo2irEKpVISCVXSmKX45DEuHSn+8a0eFy
         gYGVtDEzOV7p4Jn5N5TYK76qztYHnxcBoAst4+UNNhbrbj6JWzHhG3plLIuDrDgKpjHr
         egjA==
X-Forwarded-Encrypted: i=1; AJvYcCXWg96LmoWUCSVbp8QhRF6yyHzjCDT1sOXr8EJeJF22VwJJ9gEl0tLNUPBqwrllYmylf47nBZAEPMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZV4GkRKt4ozvZdqa0g/BuCSMfi13Y8rd1Qb9oCRLKbLxdWHEQ
	c23J/RdVTm9n+1MlCiMGewanhFkfk37JtwSxDy4gqRIeROATnuTq+RZpFK8v1lTh8PGVxkejYs2
	P99cvpfWWj8o81JA1EJDY8v/A1XYpLlU=
X-Gm-Gg: AY/fxX6We2URcfRSB2C0NicOFMIdtX4cQu815V02KgI+i7MCRuy54hN83IXK7WTP3s2
	A0rK1mtcGsWkGqclzmykdWM8ubM/ixiFVya0x89+QqPMP58nqgs2xHUFrAUMF7ULdYIhgq5q4Dj
	69RgquFJlLkuI61TOd6ZFQqnexjkmesim8JNmAo4MtLdldis4Tg5lb84U1ETooxGXcJxbLURY2u
	1JyT1IjaqhRnZygGhpHPHhiQEaFfS76q/fjErAqoGq2yBmNNEkF4ttDQOaglsPOR9H8F6ut
X-Google-Smtp-Source: AGHT+IHRI/1hilnmEBrcFgJMUaKhYNaI/HUlJK981gxPRBIjFC1foGTgVsgO3/XCEuH6fbfjUrJWTnDdqb3jBT/2yYw=
X-Received: by 2002:a17:907:5cb:b0:b83:972c:77fb with SMTP id
 a640c23a62f3a-b83972c7894mr49876366b.46.1767061931091; Mon, 29 Dec 2025
 18:32:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1766471839.git.zhoubinbin@loongson.cn> <36544ba0d847bca639632ea0c74907de90975f80.1766471839.git.zhoubinbin@loongson.cn>
 <20251230021517.GA3156793-robh@kernel.org>
In-Reply-To: <20251230021517.GA3156793-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 30 Dec 2025 10:31:58 +0800
X-Gm-Features: AQt7F2pMi81j0FMjvtCowEi-qdK1ZAjfhHDDJAMxPmxQUDHeMO8p72a4qVr-54E
Message-ID: <CAMpQs4JbqK2zD-s8Erzj0SPue=97hk7tYBanFiQiefzkof+QiQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-binding: rtc: loongson: Document
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

Thanks for your review.

On Tue, Dec 30, 2025 at 10:15=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, Dec 23, 2025 at 02:42:12PM +0800, Binbin Zhou wrote:
> > Add "loongson,ls2k0300-rtc" dedicated compatible to represent the RTC
> > interface of the Loongson-2K0300 chip.
> >
> > Its hardware design is similar to that of the Loongson-1B, but it does
> > not support the alarm feature.
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > ---
> >  .../devicetree/bindings/rtc/loongson,rtc.yaml       | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml b/=
Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > index f89c1f660aee..aac91c79ffdb 100644
> > --- a/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
> > @@ -23,6 +23,7 @@ properties:
> >            - loongson,ls1b-rtc
> >            - loongson,ls1c-rtc
> >            - loongson,ls7a-rtc
> > +          - loongson,ls2k0300-rtc
> >            - loongson,ls2k1000-rtc
> >        - items:
> >            - enum:
> > @@ -42,6 +43,18 @@ required:
> >
> >  unevaluatedProperties: false
> >
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - loongson,ls1c-rtc
>
> This seems unrelated?

Loongson-1C does not support the alarm feature, so the `interrupts`
property is not needed.

Technically, this is my fault and should have been described in the
binding before, just correcting it now.
Perhaps I should have mentioned this in the commit message.
>
> > +          - loongson,ls2k0300-rtc
> > +
> > +then:
> > +  properties:
> > +    interrupts: false
> > +
> >  examples:
> >    - |
> >      #include <dt-bindings/interrupt-controller/irq.h>
> > --
> > 2.47.3
> >

--=20
Thanks.
Binbin

