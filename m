Return-Path: <linux-rtc+bounces-3922-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CCFA8540B
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 08:21:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68CEC9A0732
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 06:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5925D26FD98;
	Fri, 11 Apr 2025 06:21:05 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F072F367;
	Fri, 11 Apr 2025 06:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744352465; cv=none; b=l47tQFB3vu0yM649uKLM+bG7Bhjj7LzSX18DGH/8g/Sjm4WY2D5xNuVC5e4HEv91s+dUKFP6+Z0JESXRsMLtw4emm6e1MXuguQQWj7z26p0BuePSlxzLnQZ7hCwWnWF3ZJIjkAKipDs5vgneAnGsOlc2g54OGbbHJd+yO3gj1dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744352465; c=relaxed/simple;
	bh=FWhiu0xqA9OYifZoA/NPGAqtkja4BRU1eG8qYYNmh1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKpQcqQoPI05lUjm/EXrGEh2RJtF4ol12+OvjO404iGJUgH6FQvP5aQkaopxH+G0cg0ih7A6dx+2Hn0GHtkq/1YyQcdb+N3bvsvgwa5wAk3PjsfkzDPL0ORiN2mnv7Q5OieekMsL0RCUvZNZ93irvZXKXB3RYxDzq5g5ExT+Sgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2dfdf3c38so308976166b.3;
        Thu, 10 Apr 2025 23:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744352458; x=1744957258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09okPA/16lZG9/1yQlKv4fYdfrNELjKqXE2ran1r2PE=;
        b=BFRoJjvuW+zQJjv9L65UoOg+bC7EIFYJgRcdnHNmC2o47wknG5beiMdkqWMYHSFhDP
         +ZDfGOrfWPUHe8Bmo5VkFDleec1tCuVF5ouvoFtL/uBnmSt4nRFWTYqDt+mUMwHQ5Vva
         NVGJl/87Iq+k3RnQlIdPsLA+6ixInj50wIMxqe91cliEa1liuhs6bFTHT+jzfMnqlISB
         AaW4Er2qFP3yg81AbXB88SXmeJD9Iy7H9CKwaX3mpFqiYkZwZVcjifPCf4YkOiwVgjV+
         Xx1GxgvPnAMG4JRPyslbhXYX7LUkfgeFq04Q6iR5PYDncjRYLtzYu4LTAxngZgSdQX3O
         YH5g==
X-Forwarded-Encrypted: i=1; AJvYcCU+pBwIupNjxIOcpdRPQhtpgjmuCircAD26X3bnk36JAfPv3x5ZbTic8jpNpXgacgOgexl8ytK2ghV8@vger.kernel.org, AJvYcCVKdXrvA3DFnsDw8ds3u7V8GK8indEg8jibWyuN+gq9O4dCvLwdQ6sPv/ENmIfACLLWIJwsEq58c6Ns@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8/GX7VcsvuCpzcW43bShKLwYw1bczFVUYOHX1IlB4WXCsOjeA
	GopNJhaTGMtK4vH0lA3JdutZN2o0hTluvxqh8GjK3dR+rt+sJIRflDC2pExSr64=
X-Gm-Gg: ASbGncuZgxyVIn/YZlgDve/1LdKxLiPVYexb+Fu3rQCBWkeAIASNH3MoHWnfkdm2Dm8
	K9huuWmTq7fUskksgMJGHDEhWjBk0mtCNATkDvetFEWB4CO61hbvJ3Wb7qrrYNxIy+MB/+f09On
	QNphvgzgCNOkoEs0Geqzm5ynJJFMaWbVoD1SOvjclJClkzDzuyu5ob+LeypuRmdyFXj7E2Mx+i5
	g26sJZGflKxOFnIs/11pWcXyRCQodx7jsnkyid8LGCssCTaRR3DkhJ5BtJyi5lEktnhglcYj9NX
	RicQR5lcOY8FmYUr838h2FLbS8FL5Qa5Wrx7R/TRpFZo6+G8ejakxbSY2WcNLdrJBiFRTCI1VtV
	E+Lo=
X-Google-Smtp-Source: AGHT+IGMqBpKhwConu5gLcAO3nInccU//dN5OhEmg0xccDMoGpuZdgteyMO+JMSVf59QmQKAECMf6w==
X-Received: by 2002:a17:906:c14b:b0:ac7:c7cd:ac39 with SMTP id a640c23a62f3a-acad34a1aa8mr114691866b.24.1744352456270;
        Thu, 10 Apr 2025 23:20:56 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce711fsm384192066b.169.2025.04.10.23.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:20:55 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5eb5ecf3217so2951180a12.3;
        Thu, 10 Apr 2025 23:20:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5MdeZRviH9zPHDtmrYfpcLucwBuEnCs1Nw5+H5PH5yXWdWg3dsZsB4ue2MjOL4FoGQEbCO0QSdDMB@vger.kernel.org, AJvYcCXrTQgJ+LehT2O0IvD3mAWX6CCUpkc+MZWm28NXWSBVTKe36mGqERxKr/f4VSdbSlatNRPrmJZxttvO@vger.kernel.org
X-Received: by 2002:a17:907:70d:b0:aca:c7c6:b218 with SMTP id
 a640c23a62f3a-acad3456e8bmr132327866b.1.1744352455305; Thu, 10 Apr 2025
 23:20:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319110305.19687-1-wsa+renesas@sang-engineering.com>
 <20250319110305.19687-2-wsa+renesas@sang-engineering.com> <CAMuHMdUiNYXVzK7hSmgqZ65gq0bJyGkfJU0=u+q5K=Sb8EY3ug@mail.gmail.com>
 <CAMuHMdXU7wYfzNmvBO4ibUPGUA6xV_4gQxe4DtuKcr-kqXGB1w@mail.gmail.com> <Z_gozhmIeQiPScKK@shikoro>
In-Reply-To: <Z_gozhmIeQiPScKK@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 08:20:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURcyViCd8EhhAZQjgx3vfBWBAmhNahwA8qoa_G5tPm1Q@mail.gmail.com>
X-Gm-Features: ATxdqUG4WfCOX5hWwg7WsV5UZCkSdio1lHcVOLJ0PadEh7HSuKb-wznsWZD0RWU
Message-ID: <CAMuHMdURcyViCd8EhhAZQjgx3vfBWBAmhNahwA8qoa_G5tPm1Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: rtc: rzn1: add optional second clock
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 10 Apr 2025 at 22:23, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > >    clock-names:
> > > > -    const: hclk
> > > > +    minItems: 1
> > > > +    items:
> > > > +      - const: hclk
> > > > +      - const: xtal
> > >
> > > Shouldn't the second clock become required? Or do you plan to make
> > > that change after all upstream DTS files have been updated?
>
> True, we should make the second clock a requirement from now on.
>
> > Upon second thought: this xtal clock is documented to be the "rtc"
> > input to the RZ/N1 system controller[1], so it looks like the original
> > idea was to obtain it through the system controller.  Unfortunately
> > the clock driver[2] does not use the rtc input clock, nor provides it
> > to consumers.
>
> So, it would basically be a pass-through? I don't see any register in
> SYSCTRL handling the external RTC clock.

I assume you are right, I didn't study RZ/N1D in detail.

> > So either we fix that, or we go with your solution...
>
> If it is a pass-through, I wonder what it would gain us, but I can do
> that if there are reasons for it.

Let's go for your solution.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

