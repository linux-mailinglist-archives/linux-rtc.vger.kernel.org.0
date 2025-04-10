Return-Path: <linux-rtc+bounces-3913-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D27A847F6
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 17:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7041D9C1363
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 15:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EDB1E9904;
	Thu, 10 Apr 2025 15:29:57 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4164C1E7C07;
	Thu, 10 Apr 2025 15:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298997; cv=none; b=qfY8nMM1mIZDNyEC9kt1dur632egSYwI3kioZTJtV0ImBXOjs8QxfuOtK5TMZEyUxxukP8qcx1fD9vJPldapYfbn0TXgEt3uZ3l9k/W5rP7nuRRGfkxMaHd0iBc3OsqB8gPbkdKgmlxKPikn6gfGccVNXEEKXoG+v4S9P2RePew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298997; c=relaxed/simple;
	bh=t0Mif6/7jrARJAzTJd8cjsXPJPwf1vz0BxqcSCiAf+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDe50psX59fxsILAUBLaSjOv1jmXsKt+PB5uZptF+RSvPfpLSft2d/CkJ4QZS+x1L4fFxlbpaU7GdLH5y7vEbKpnQq+k/tkeDS673truYkC7iKcI5OxpMt7WV9kIMomJwFSr13oo3ZUNkmfi1eUP/Ju8cuElORk0Lp2blTk0/XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5240b014f47so446871e0c.1;
        Thu, 10 Apr 2025 08:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744298993; x=1744903793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5uoak4KgDwpySYhPUfBLmZgj6oRVvh6K3p/SpYWnHQ=;
        b=OYwyuU/lH4UZgAts+6L4KP3jWIG99Y+YnM3s1lYOOvzcERslPi7DLY/7MfgGXkUHOx
         jhevk1+xaXqSoTsBie+BzjGHwlCjd0hpW4Skf2rMUE3YAYBHYWrWlk0efryS0PnwKWw9
         T0rENs+++xxF8wBZSgFsjN82bl2mIqwJi5eaOGUOtVyYlvrwOYwxrpeG/AdMpSprtMLH
         Piw8cjICHZdCdZmmcp/6H3mKQAK2/1KfGlT/ntLt8P8iL9qmxqMhhDeKusEtLhu6ky8x
         hdO3lcWooTyGc5URMCo8SuiMaSCJng3/8UOQ+1b+oBGk15vBKZjXtpdx3MO9NH12X++O
         5frA==
X-Forwarded-Encrypted: i=1; AJvYcCXaBaUIIf9w8g8PfcBKw+gCqxOnM/4iWC8gXP7I65q+uM0mRA+Z0CSHZ1Jr24KyaZv2YvUviv3hyeI0@vger.kernel.org, AJvYcCXtn3Il6mBLxZKBY9oF5RIvUQFotFqvRvXUXezkoSMYx5+86iD2VWtpU3Pcr02yPLLSDDcr87GZQk/Q@vger.kernel.org
X-Gm-Message-State: AOJu0YykgJG5bZfZ2AaqFNryp495OVAa4IqdAHPG5SHqKOKukqzIZq87
	oidKnSStusFanN7ByZQr6FY4+Ag2gxPVxSo8PAbex4+XBHSx43iDsNm5a4hu/e0=
X-Gm-Gg: ASbGncv52BzbInwUCYp+EzRBPqlT+38nNQAqG/UOjtJDj3Du8/bBFHn4+DVNpYKZpDQ
	YoA80g3/makH9lhkU7e/wXYeeDrQO/JKffmya1Y5jHLOO9srELiRbC8wHGzCts9WD8tPdsd0fyO
	ZJjBViQuWoT/Z5Z2HpnAvQ6wSxSV8jZy/tuMnXYc6tidpTnzSTb1FSMCad++IfHKgAGQYK+M/S1
	UBOmFo7QO2KIO2QucD71sNEWrbTFb+z5n8deR+RKyc4Q4lK1rPAutMtAfRlkWEABoGgHHxR3HZa
	gTcW1xdx/3cfMSp55s7mpEDAVy42/Oi9temTeq/83tp6VASN8NSxe6joWiIKzzvFE5Ji8RoICO4
	RMBlfK8Y7+hiOag==
X-Google-Smtp-Source: AGHT+IGqHVeLlKvSbEcawa8ZI4Huv7iwoikfl2/AxJOadf4mUZ4n0ueYjuiRKFZg5bAOJyyzZeswMA==
X-Received: by 2002:a05:6122:3291:b0:50b:e9a5:cd7b with SMTP id 71dfb90a1353d-527b509a141mr2686692e0c.9.1744298993599;
        Thu, 10 Apr 2025 08:29:53 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd74563sm694062e0c.11.2025.04.10.08.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 08:29:53 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86feb84877aso378399241.3;
        Thu, 10 Apr 2025 08:29:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXS4yDOZrWa8ZdTCi7p/Y+YdWnvIoT6BbZ5+zcfDtmCTtLMjtUacAE/3TfBF7y6/qmdTybkI2wR+5v@vger.kernel.org, AJvYcCWGzrCzo9aUyEUmRWlZ3J4ZNtb3FWPU4U/yPSpHfdK7LhfpY0kINHHJsq2ReHCvn+X36IfyTzSB5Qda@vger.kernel.org
X-Received: by 2002:a05:6102:2913:b0:4b9:bd00:454b with SMTP id
 ada2fe7eead31-4c9d34ce554mr2984239137.13.1744298992996; Thu, 10 Apr 2025
 08:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319110305.19687-1-wsa+renesas@sang-engineering.com>
 <20250319110305.19687-2-wsa+renesas@sang-engineering.com> <CAMuHMdUiNYXVzK7hSmgqZ65gq0bJyGkfJU0=u+q5K=Sb8EY3ug@mail.gmail.com>
In-Reply-To: <CAMuHMdUiNYXVzK7hSmgqZ65gq0bJyGkfJU0=u+q5K=Sb8EY3ug@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 17:29:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXU7wYfzNmvBO4ibUPGUA6xV_4gQxe4DtuKcr-kqXGB1w@mail.gmail.com>
X-Gm-Features: ATxdqUE4NJthuLLAbt6CnnpzXhYm8WKTzrqhnE-HQDwytbUdF1U-6SU_drprnX8
Message-ID: <CAMuHMdXU7wYfzNmvBO4ibUPGUA6xV_4gQxe4DtuKcr-kqXGB1w@mail.gmail.com>
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

On Thu, 10 Apr 2025 at 17:08, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, 19 Mar 2025 at 12:03, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > The external crystal can be a second clock input. It is needed for the
> > SCMP counting method which allows using crystals different than 32768Hz.
> > It is also needed for an upcoming SoC which only supports the SCMP
> > method.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> > @@ -33,10 +33,14 @@ properties:
> >        - const: pps
> >
> >    clocks:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> >
> >    clock-names:
> > -    const: hclk
> > +    minItems: 1
> > +    items:
> > +      - const: hclk
> > +      - const: xtal
>
> Shouldn't the second clock become required? Or do you plan to make
> that change after all upstream DTS files have been updated?

Upon second thought: this xtal clock is documented to be the "rtc"
input to the RZ/N1 system controller[1], so it looks like the original
idea was to obtain it through the system controller.  Unfortunately
the clock driver[2] does not use the rtc input clock, nor provides it
to consumers.

So either we fix that, or we go with your solution...

[1] https://elixir.bootlin.com/linux/latest/source/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml#L32
[2] https://elixir.bootlin.com/linux/latest/source/drivers/clk/renesas/r9a06g032-clocks.c

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

