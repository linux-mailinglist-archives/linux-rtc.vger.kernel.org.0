Return-Path: <linux-rtc+bounces-2156-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9555998BB5
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 17:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1FD328B6AA
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 15:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAC21CCB2D;
	Thu, 10 Oct 2024 15:31:26 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BB8282FB;
	Thu, 10 Oct 2024 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728574286; cv=none; b=EXw/Ib4dxJCd5U+Oanem0ROd6kOOVGt+uqLgkT4fXlhxnJXTAPftF5Mj8qfkkEV8XGKiqxCtRkS/uScWLrAcVeTYDHyInmonMytYtz1k220oXbKvoOZDTsT0ddwPseB4k1CT5FfFv80tCdhfJvBJxRptfmkuw8xb9zuFrkTIqvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728574286; c=relaxed/simple;
	bh=JLmEn3Y3Mup+MIsj1v4X+aQ/1zIlI6rtFcqdaNpOSHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYxEN3V888sk01vn0lWbvYrTE7s9Dmiuw4v4y8wIa9//gTO2cOOJ32wkmPOhbR8Vetw+gep+phd6jgPItNNwcOwx98UQWQ8/6Yhxsi1SxBDdTIwXoQsYhB7gzkaxqJ4JaF4fD3OxXqpFNrg44KeLaBvCzigCo5YlGYqhNg1BfRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e2e4244413so12652877b3.3;
        Thu, 10 Oct 2024 08:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728574283; x=1729179083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0mCUH7aNgtABnVVF5yxDimhVzJlZrl+fopZk7Shdng=;
        b=OBeTsDFHTfnjmDMgcbwpkxAHZ5QEybAABnSvtrBRAhE13zpuljL4Uayl2LrHqdW+ct
         /VqmKzWoqDpdpsB46yv4MRV9pcNy3adPnRByzAiCkIXQ1htZamYapnybYfigYUGWqrGF
         cuBbZA4QzkRFmrloJuSdtY63BMa9HfrGSSLnkIqFvPgXR/AU+rSHiewjLUdrNIxF9Rpr
         Oc5e3w9u/63M6NCxg3Z/MHggrs5XJuwvfgmpxGBs7WGwL97W419/yohUwIKNNlPvPHT8
         gq/zpWygg+JdZAFpQBX1gLreW5Iq47iFH29TBNFpuxpUB+OX0dLuELNhK88XNYuNkDia
         /eHA==
X-Forwarded-Encrypted: i=1; AJvYcCU2+Me++54MIEyQ/sa2E4nscqkiIhVGLNG+TPdmJVEPkCTuvlIjdA7S/xf5M8yvDeztX+cwiu5uPvSJ@vger.kernel.org, AJvYcCUpvY4XxD7I/9fVBCmWn0BDe2bG8GK6MdBh2aYze1vSS0S1nHeNH5wX2ZDQX7SnuwL7D3zFuOHDNb8U@vger.kernel.org, AJvYcCWqhejzMBeNeqigDarVT/7dxCVZyL3ssh1f2Ukm2EThmNSJshd4eTwJBRe4HBOZDcU1E7a4CXBWXfCv/pJy@vger.kernel.org, AJvYcCXe1wkwdyFkKJeBrFYIigc0qIUlhrLOj33tteMqA5X3GW1Qd9DVFOTLyFaXh6RmooGyruILOT/TYH4+pbiQMX8YBZI=@vger.kernel.org, AJvYcCXtxU6WqML4q+hFPDho8k7FG3XUS3ytPliBLnEurrXZGz+HUVRkxOpIGYfe5R7WAK4qtDHM0Hi9MkSO@vger.kernel.org
X-Gm-Message-State: AOJu0YyrmxorECorvk583O6Gjns5+zFyyRrnlI1mCH+lZYfFNRVRAaFz
	Duj4fFOqSbQWBCdzGG53+owjMJKZwxjCYuOo5xButBg5G2IX96gWjLWsI83w
X-Google-Smtp-Source: AGHT+IHdQOYTFmbKtk9ycHJSV57flTpVebEOzQg2Y0AizXU7pFjOeG+FrxKCH3hrS15uimwesy2uKQ==
X-Received: by 2002:a05:690c:7690:b0:6e3:323f:d8fb with SMTP id 00721157ae682-6e3323fdcafmr16339837b3.14.1728574283115;
        Thu, 10 Oct 2024 08:31:23 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332cb3783sm2378867b3.141.2024.10.10.08.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 08:31:22 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e2d36343caso9121057b3.2;
        Thu, 10 Oct 2024 08:31:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTJ50cAZdC8x3LsO5OEcEoQRYzhdLN539QTwJM6w3ygmpznekg9u8WbCazyPLmHyyANCHXdueyZZGw@vger.kernel.org, AJvYcCVmY3rnoZyAFLiQJGxqbxRnTTOpq9zRdUc0nU/3yoipSo1UlJuF1abxE7oxeQxJFFltT15IKvBdoOqY5ggTTRysjeM=@vger.kernel.org, AJvYcCWQ5LAVNCKAnhdcbcDZoEInveR8RjVKULx6UZ9CuKIa8HtI53U3bIkOM7iOPTijuRH8U8sOBsUkyI/e@vger.kernel.org, AJvYcCX8nMzbJ/i01UvMOT07QgLsELXPg/ovRJMc8Ke5ckH4Wf/b7bJbvWqYOSqMDeUBJ64120hGMfxgUUWa/SH6@vger.kernel.org, AJvYcCXKdMHcA0bSiuj5V5FNNkH50IvikEXIhw+tsZhM/mR0FeIPYvNZnW1rjxEAX3WMGDXWQtMN13fy5R9V@vger.kernel.org
X-Received: by 2002:a05:690c:6606:b0:6e2:1742:590d with SMTP id
 00721157ae682-6e32212b7d6mr61109317b3.3.1728574282330; Thu, 10 Oct 2024
 08:31:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-6-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWeGC_N3-XF29+UUR43OGJKqVNNHs042J8HRuNpiD=vOg@mail.gmail.com> <1c733190-bd46-43d0-8f3d-62e0ed5fde42@tuxon.dev>
In-Reply-To: <1c733190-bd46-43d0-8f3d-62e0ed5fde42@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 17:31:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWhAoFQOHrDRFKX7bJFobC73qkHggFRdSCmhrsZmXWbA@mail.gmail.com>
Message-ID: <CAMuHMdVWhAoFQOHrDRFKX7bJFobC73qkHggFRdSCmhrsZmXWbA@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] dt-bindings: rtc: renesas,rzg3s-rtc: Document
 the Renesas RTCA-3 IP
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Thu, Oct 10, 2024 at 11:52=E2=80=AFAM claudiu beznea
<claudiu.beznea@tuxon.dev> wrote:
> On 10.10.2024 12:29, Geert Uytterhoeven wrote:
> > On Fri, Aug 30, 2024 at 3:02=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.d=
ev> wrote:
> >> Document the RTC IP (RTCA-3) available on the Renesas RZ/G3S SoC.
> >> The RTC IP available on Renesas RZ/V2H is almost identical with the
> >> one found on Renesas RZ/G3S (it misses the time capture functionality
> >> which is not yet implemented on proposed driver). For this, added also=
 a
> >> generic compatible that will be used at the moment as fallback for bot=
h
> >> RZ/G3S and RZ/V2H.

> > Sorry for chiming in late, but this RTCA-3 block seems to be a
> > derivative of the RTC blocks found on older SuperH SoCs, and on RZ/A1
> > and RZ/A2 ARM SoCs.  Differences are found in (lack of)
> > 100/1000-year-count parts and the Year Alarm Enable Register, and in
> > some control register bits.
>
> At a 1st look it seems so, yes. I was inclined at the beginning to just u=
se
> the rtc-sh but the RZ/G3S HW manual mentions a lot of restrictions that
> need to be followed when configuring the IP. Because of these restriction=
s
> I chose to have a different driver. Otherwise the rtc-sh would have becom=
e
> way too complication as far as I can tell.

[...]

Thank you, makes sense!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

