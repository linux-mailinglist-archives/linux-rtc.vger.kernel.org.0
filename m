Return-Path: <linux-rtc+bounces-1347-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF6B90C68F
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 12:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2DD1281AF7
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Jun 2024 10:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1CD13E3FF;
	Tue, 18 Jun 2024 07:56:22 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FC47BAE4;
	Tue, 18 Jun 2024 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718697382; cv=none; b=SSmAcPNmOZZvt6ZS7nCFW1AccD9urA1lEbxLWCXoLFFq4aP50r0elrRVoyY8zC5V/z+z70OgnX7Dr+XpeinnENuCFlUi4j3w1VadVqwzPgm5LtFReYHky52Id5OAVmYdL/vAujBj23rUZVDeY7ZjCOlekkR/lTec2BlfgCaf+ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718697382; c=relaxed/simple;
	bh=BRcrKoiu2O3rFFB4KXyeEXmisdIOdtTjk7nkWf0DIDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kg4UJhXbLuPwSbocIpMs2l9u8jtfMbpObnW/jGhLoxIaS8DNNegQWWM81w0lOqtVERXRnQWcwrHcuefKZXBtx9f/jn0GZgEP44lhofHOaHg4JPSmogmypIr2S8BhlV7SkoueMf/orWtpUHGdwcXRYkQABxAnpwn8vyUuq00X/3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-630640c1e14so61855787b3.1;
        Tue, 18 Jun 2024 00:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718697380; x=1719302180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rhbu4GSwZj/ZhrO4SBPn7XBcanVn/OfYvtYjulY4Vuk=;
        b=KRSjam/nekn0IXwMq/c0iySo2LoukIrRyyk6IR7bEdyYyH20povqckykwhBGTfWHbW
         3aKYZmjuNmkwYI9DvUuoCNsscdAGp5tFNMLfrsvv5rUdbEqObf+Pugq46Jby0N78S0Di
         YSui5HvmjpS6SyfyfjFsUW5J8dxWqiNGzDglI8oRyWYj2HWHf5BDvgnWg+IZ3/VfdnZt
         xZjexesYghHPrw3U55ZheQFsqNb6uhouaRWJpqweTqMgQoxN9+UvByYHI5OgSVssXCri
         8cWnHEvmFKI/xWClincUUw/xGBheONelnoi0xIVMomfTmpgsDSI3Sv2peWaAAdTLeUCW
         1A6A==
X-Forwarded-Encrypted: i=1; AJvYcCUJNIkHoFo2AgRW16PSrfLoyaqjgVoRfIf5xgw7ihyNT4H8CoW2zhReCCc1bFPUP7XYE1ej6D4AbGt5skjkDTvpEI95B3k0rlwa85PcsEgqCjJtuCocpHE3kYGAiR14qVj95xhT6NC9zUyJrqRSy08H+CzwOC8mzCfadcnvR0DZmiEG2PoXHz9d01QeCw0aVdJew/uvXtvSomDpEbyGLFZYBYrNNTjy68nCLzC0t0M18MrRmLyT6VXQd0xBHDiaEAx2
X-Gm-Message-State: AOJu0YzGEAeJ1MPrx2eaAtq2YSRGI3c1ga2TwEonrTz2zfpJmgdRTmoO
	AaFDURTqGO/y+uh+xe8vQ6mNsQq32RZbS2um2wICZi/AvHu/fUGcUPaqa+fO
X-Google-Smtp-Source: AGHT+IFHIimh6YkaojIEwgLPvTP4lp36Yj7PpWVHbZe9rU9zG2paJnIJyUiLeXM56vrhYGKT5G2fVw==
X-Received: by 2002:a81:8a07:0:b0:61b:1f0e:10 with SMTP id 00721157ae682-6322206fb0fmr107875247b3.4.1718697379617;
        Tue, 18 Jun 2024 00:56:19 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63118e99dd5sm16527117b3.69.2024.06.18.00.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 00:56:19 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-630640c1e14so61855627b3.1;
        Tue, 18 Jun 2024 00:56:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJDYNazC5t/By0MP6lZk+8Wbx+b+HkoVxnqFY8PZ+K97dMukhCxBsLhODbOgNpr8pPhgU4/QeoCkjxf9NSNEJQbID0YtxsBpBSybEnqqIL22MOy+6lPJosyEQ0lxg889p09MbRaBg2wBX8L44VY8lk9FZUMJAY01dNrCDL+UG3z7wvJUdg8Vcltd+MFWbqe6cKm70Y61Q6omWgvFZuTL06dYjUl6i9Uh2C0D56uX+66vgTA0uBePogHqcIBgGhZZ23
X-Received: by 2002:a05:690c:6a12:b0:620:31ca:599d with SMTP id
 00721157ae682-63222d4b77dmr134135247b3.29.1718697379204; Tue, 18 Jun 2024
 00:56:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
 <20240614071932.1014067-3-claudiu.beznea.uj@bp.renesas.com>
 <20240615-angler-occupier-6188a3187655@spud> <3d9ed0ec-ca9a-45b4-a633-8f7051d13cff@tuxon.dev>
 <20240617-subsoil-creed-04bf5f13d081@spud> <0a4ba0e5-3fb1-4ffc-b2d8-a4eb418707eb@tuxon.dev>
In-Reply-To: <0a4ba0e5-3fb1-4ffc-b2d8-a4eb418707eb@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jun 2024 09:56:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXOiuORjLo2nRAFxtXmn5rRm7U-CEHqfX2DoXHmQyfdRQ@mail.gmail.com>
Message-ID: <CAMuHMdXOiuORjLo2nRAFxtXmn5rRm7U-CEHqfX2DoXHmQyfdRQ@mail.gmail.com>
Subject: Re: [PATCH 02/12] dt-bindings: clock: renesas,rzg3s-vbattb-clk:
 Document the VBATTB clock driver
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Conor Dooley <conor@kernel.org>, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, 
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Tue, Jun 18, 2024 at 9:34=E2=80=AFAM claudiu beznea <claudiu.beznea@tuxo=
n.dev> wrote:
> On 17.06.2024 18:19, Conor Dooley wrote:
> > On Mon, Jun 17, 2024 at 10:02:47AM +0300, claudiu beznea wrote:
> >> On 15.06.2024 15:17, Conor Dooley wrote:
> >>> On Fri, Jun 14, 2024 at 10:19:22AM +0300, Claudiu wrote:
> >>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>
> >>>> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that feed=
s
> >>>> the RTC and the tamper detector. Add documentation for the VBATTB cl=
ock
> >>>> driver.
> >>>>
> >>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>> ---
> >>>>  .../clock/renesas,rzg3s-vbattb-clk.yaml       | 90 ++++++++++++++++=
+++
> >>>>  1 file changed, 90 insertions(+)
> >>>>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,=
rzg3s-vbattb-clk.yaml
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg3s-v=
battb-clk.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbat=
tb-clk.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..ef52a0c0f874
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/clock/renesas,rzg3s-vbattb-c=
lk.yaml
> >>>> +  renesas,vbattb-osc-bypass:
> >>>> +    description: set when external clock is connected to RTXOUT pin

FTR, this contradicts the explanation below, which states the external
clock oscillator is connected to RTXIN.

> >>>> +    type: boolean
> >>>
> >>> When you say "external clock", is that an input or an output?
> >>
> >> I took that statement from the HW manual. As of the HW manual [1], tab=
le
> >> 42.2, that would be an input.
> >
> > Forgive me for not wanting to open the zip etc and find the information
> > in the document, but why do you need an extra property? Is it not
> > something you can determine from the clocks/clock-names properties?
>
> It can't be determined from clocks/clock-names as of my understanding. It
> depends on the type of the input clock (crystal oscillator or external
> hardware device generating the clock).
>
> > It sounds like an additional clock from your description, is it actuall=
y
> > different way to provide the second clock you mention above?
>
> This is the block diagram (see [1], only picture this time) of the module
> controlling the clock. Please open it, it helps in understanding what I'l=
l
> explain above.
>
> The VBATTB blocks controlling the VBATTBCLK are:
> - 32KHz-clock oscillator
> - the mux controlled by BKSCCR.SOSEL
> - the gate who's input is the mux output and XOSCCR.OUTEN
>
> To the 32 KHz-clock oscillator block could be connected:
> 1/ either a crystal oscillator in which case it will be connected to both
> RTXIN and RTXOUT pins (the direction of RTXOUT is wrong in this picture f=
or
> this case)
> 2/ or a device (like [2]) generating a clock which has a single output an=
d,
> from my understanding and experience with devices like this, only RTXIN i=
s
> needed, RTXOUT is connected to the ground; for this case the 32KHz-clock
> oscillator block from [1] need to be bypassed in which case the newly
> introduced property will be used; this will select the XBYP on the mux.

Sounds similar to the RAA215300 PMIC, which includes an ISL1208-derived
RTC, where this was handled using two different clock names:
https://elixir.bootlin.com/linux/v6.10-rc1/source/Documentation/devicetree/=
bindings/regulator/renesas,raa215300.yaml#L49
https://elixir.bootlin.com/linux/v6.10-rc1/source/drivers/rtc/rtc-isl1208.c=
#L869

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

