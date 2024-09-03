Return-Path: <linux-rtc+bounces-1841-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEE89695D0
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 09:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10B9CB211BA
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 07:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF84E1D6DDA;
	Tue,  3 Sep 2024 07:40:42 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF5C1A265F;
	Tue,  3 Sep 2024 07:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725349242; cv=none; b=ubHaFiRplqDP7d17WGG/3h55dnO639ZBa2yzOwKymPqu6mNiW0tiLiZL6lcx0yZ47Uk14vMIRFEtjtIB0qIghj72gdg4n3l1T+7e/vgrGycYmlCfHrhNejoQzj7N+0EhS+rNXOiH9G4WnTPuMl+Lq3WVYMokjz7Hm4/a3ObqoLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725349242; c=relaxed/simple;
	bh=m9xGNHVdxAPNgnny5vsu5oSFNPBG6hZtstIE34wqOj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=um7nGKEUYhIw2Et+co33MOm1Ff1siSf5YUKSptEUCyy+CNgzRLIVhFJ5tctE1b5yw7P+bOIWlE90YWV75Z0SGYz5oHPj8WZFHa8PvXMV10MZhLQZkav9r3Nia6hBOqHXLj2RQYgEuga5I4HivM2nkU2QQpLwr9pgtSywh4kb8Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6c130ffa0adso47528257b3.3;
        Tue, 03 Sep 2024 00:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725349238; x=1725954038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UhTtajfItCw3R64kqNjn0DPI/wHW8qFVgP/przD3ZM=;
        b=m+9xA1RQBfpDGFZyOXwUaHjRLCkX+uM8lr1GBQU+ePvU2yCCuQibD1Rp1MTTxsFKar
         JBmjRRNGyElagEf3EP5948clOE+lwyJFew40uZTfaq9js27PbF4ZZymtW9QL218uofIT
         6ag8EB7RwxNzxDz8ZlY93uY80nWJXjJDqn3HOwlcBRUjuk4gdXo9KsK81ucD4L1um2HT
         kRCTusluuDLTHzhQZR4DtPUIqDER9aQxPxtgXOA+MLBJyxGZEpmyWOzub4fp/5nKa5g8
         vH3omB0QMhq0rdAyWCdkA6mB1KdEwE4N4W+7C+hdlIp6A2me+ClISUf7O3yCGupiUDIK
         m81Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2fJhnzIrAmtc6EV2ucqlbxpKz2fWMzt9UI/e+5sPYuVxSETna2MNhsaVfz4LgZRpnlV85PHmJHPxcp3MkCG7xHGo=@vger.kernel.org, AJvYcCULS2Gy3xF9e+zsA/Fec69Tu2QC6l0JOIUEkXzSKaBQEsaV4a8MIJPr+TpdMwSHl5RmseBBKmNco/tJ@vger.kernel.org, AJvYcCVtIdcI5anmwOrjt0x/WLZmLerII298rlwL8LNP0xP0dmuQgtF6pyvtX/G60CPn8uSHYUdQZgUZWMVL254s@vger.kernel.org, AJvYcCXDdcE88HsDLHm8OVS/OfYoXvucc3gg9FyWYx5fmIxxSSbln2uz7nLjbIOmPC2hFIrD1u466pbJPu0A@vger.kernel.org, AJvYcCXiwECAbMEEhjL4aN8ZXnReYK67Brs+dLJbIrV1b7KdSq3yE9GTkDv8pCWDHl6yFtioRQBuJK892v/i@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Mkk7l208R8f9kjSf3Um/syznuLI93bnkFMlcH8SCYkcnrY8/
	Ctq1EO9UKeLNXWlcxE+OHrT2WXh9Ht7X/1HKfG3AWcis/U04hMdiLfX4YUsk
X-Google-Smtp-Source: AGHT+IGi1gBH09OEtdpG4GqwosE6GCzworJvK9XikDiSR84jpABPXQ2C99hPEyAGIxc9Uzv+TLJIhg==
X-Received: by 2002:a05:690c:893:b0:6af:8662:ff43 with SMTP id 00721157ae682-6d40fe1326cmr157228007b3.37.1725349237840;
        Tue, 03 Sep 2024 00:40:37 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d6c4eebe3fsm7799457b3.49.2024.09.03.00.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 00:40:37 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6c3f1939d12so41969117b3.2;
        Tue, 03 Sep 2024 00:40:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV87nYrO3QydeHOQxxWr5icY1maHf9LWM7zB9r/BnCp+GGHlUGqPLrSzBL/Wm2cxeqUAoSRTJvERmD5@vger.kernel.org, AJvYcCWEwNa5YpbUxp/xsqa6YCQWwP0AoPpPYCWpi21p02coTT4wjnnPfdwTrrOXO4elClgq/n0rG38Cf/Bg@vger.kernel.org, AJvYcCWZ4/pd15IOHwJwM4a3QpC3VFeFcmxne6GP6pKAIvpfgLc6B5d1HISz+PLbTJoizdSENyaOEAfTdlQ91jD5ImSAa6Q=@vger.kernel.org, AJvYcCXCAttgKNIcyd85sJXkLxGeaDQ75qEpgq0mcXpeXJ8JdLkTqvdEOf6EbObB8bUPwuxSOwk8zHxBlGm42QDu@vger.kernel.org, AJvYcCXq9dU0R0+vEu0vB0n6pySsU7FwhO5dr+loZtZ94wu4ZBL26bEXFBciwWeb3pM6bK+RfJGbhjQ8juC3@vger.kernel.org
X-Received: by 2002:a05:690c:4e0c:b0:632:12b:8315 with SMTP id
 00721157ae682-6d40e28ebadmr110800637b3.22.1725349236405; Tue, 03 Sep 2024
 00:40:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346D59E486D88611E8F254F86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <54d60105-ee5b-48da-92f4-2bcb3dff5c92@tuxon.dev> <TY3PR01MB11346F4625C5C7D321490306E86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346F4625C5C7D321490306E86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Sep 2024 09:40:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMV2uMEr4gkNc4rzAJQ1YfL5=j=mGVksEaQQABh8iGcQ@mail.gmail.com>
Message-ID: <CAMuHMdXMV2uMEr4gkNc4rzAJQ1YfL5=j=mGVksEaQQABh8iGcQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, 
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Sep 3, 2024 at 9:36=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> > -----Original Message-----
> > From: claudiu beznea <claudiu.beznea@tuxon.dev>
> > Sent: Tuesday, September 3, 2024 8:28 AM
> > Subject: Re: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vba=
ttb: Document VBATTB
> >
> > On 03.09.2024 09:58, Biju Das wrote:
> > >> -----Original Message-----
> > >> From: Claudiu <claudiu.beznea@tuxon.dev>
> > >> Sent: Friday, August 30, 2024 2:02 PM
> > >> Subject: [PATCH v3 01/12] dt-bindings: clock:
> > >> renesas,r9a08g045-vbattb: Document VBATTB
> > >>
> > >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >>
> > >> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
> > >> the tamper detector and a small general usage memory of 128B. Add do=
cumentation for it.
> > >>
> > >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >> ---
> > >>
> > >> Changes in v3:
> > >> - moved the file to clock dt bindings directory as it is the
> > >>   only functionality supported at the moment; the other functionalit=
ies
> > >>   (tamper detector, SRAM) are offered though register spreaded
> > >>   though the address space of the VBATTB IP and not actually
> > >>   individual devices; the other functionalities are not
> > >>   planned to be supported soon and if they will be I think they
> > >>   fit better on auxiliary bus than MFD
> > >> - dropped interrupt names as requested in the review process
> > >> - dropped the inner node for clock controller
> > >> - added #clock-cells
> > >> - added rtx clock
> > >> - updated description for renesas,vbattb-load-nanofarads
> > >> - included dt-bindings/interrupt-controller/irq.h in examples sectio=
n
> > >>
> > >> Changes in v2:
> > >> - changed file name and compatible
> > >> - updated title, description sections
> > >> - added clock controller part documentation and drop dedicated file
> > >>   for it included in v1
> > >> - used items to describe interrupts, interrupt-names, clocks, clock-=
names,
> > >>   resets
> > >> - dropped node labels and status
> > >> - updated clock-names for clock controller to cope with the new
> > >>   logic on detecting the necessity to setup bypass
> > >>
> > >>  .../clock/renesas,r9a08g045-vbattb.yaml       | 81 ++++++++++++++++=
+++
> > >>  1 file changed, 81 insertions(+)
> > >>  create mode 100644
> > >> Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yam=
l
> > >>
> > >> diff --git
> > >> a/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.y=
a
> > >> ml
> > >> b/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.y=
a
> > >> ml
> > >> new file mode 100644
> > >> index 000000000000..29df0e01fae5
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbat=
t
> > >> +++ b.y
> > >> +++ aml
> > >> @@ -0,0 +1,81 @@
> > >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > >> +---
> > >> +$id:
> > >> +http://devicetree.org/schemas/clock/renesas,r9a08g045-vbattb.yaml#
> > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >> +
> > >> +title: Renesas Battery Backup Function (VBATTB)
> > >> +
> > >> +description:
> > >> +  Renesas VBATTB is an always on powered module (backed by battery)
> > >> +which
> > >> +  controls the RTC clock (VBATTCLK), tamper detection logic and a
> > >> +small
> > >> +  general usage memory (128B).
> > >> +
> > >> +maintainers:
> > >> +  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    const: renesas,r9a08g045-vbattb
> > >> +
> > >> +  reg:
> > >> +    maxItems: 1
> > >> +
> > >> +  interrupts:
> > >> +    items:
> > >> +      - description: tamper detector interrupt
> > >> +
> > >> +  clocks:
> > >> +    items:
> > >> +      - description: VBATTB module clock
> > >> +      - description: RTC input clock (crystal oscillator or externa=
l
> > >> + clock device)
> > >> +
> > >> +  clock-names:
> > >> +    items:
> > >> +      - const: bclk
> > >> +      - const: rtx
> > >> +
> > >> +  '#clock-cells':
> > >> +    const: 1
> > >> +
> > >> +  power-domains:
> > >> +    maxItems: 1
> > >
> > > Not sure, you need to document "PD_VBATT" power domain as per Table
> > > 41.2, this LSI supports 3 power domains(PD_ISOVCC, PD_VCC, PD_VBATT)
> > >
> > > Power Mode PD_ISOVCC PD_VCC PD_VBATT
> > > ALL_ON      ON          ON    ON
> > > AWO         OFF         ON    ON
> > > VBATT       OFF         OFF   ON
> > > ALL_OFF     OFF         OFF   OFF
> > >
> > > PD_VBATT domain is the area where the RTC/backup register is located,
> > > works on battery power when the power of PD_VCC and PD_ISOVCC domain =
are turned off.
> >
> > In Linux, the CPG is the power domain provider for all the IPs in RZ/G3=
S SoC (modeled though MSTOP CPG
> > support). This is how it is currently implemented.
> >
> > Then groups of IPs are part of power domains PD_ISOVCC, PD_VCC, PD_VBAT=
T.
> > These power domains are i2c controlled with the help of firmware (at le=
ast at the moment).
> >
> > From HW manual:
> > - PD_VCC domain always powered on area.
> >
> > - PD_ISOVCC domain is the area where the power can be turned off.
> >
> > - PD_VBATT domain is the area where the RTC/backup register is located,
> >   works on battery power when the power of .
> >
> > The power to these domains are controlled with the help of firmware. Li=
nux cannot do control itself as
> > the CPU is in the PD_ISOVCC. If you look at picture 41.3 Power mode tra=
nsition [1] it is mentioned the
> > relation b/w these power domains (controlled by PMIC though firmware) a=
nd the supported power saving
> > modes: ALL_ON, AWO, VBATT.
>
> DT describes hardware. So, the question was, from that perspective, do we=
 need to document PD_VBATT domain,
> as it can be controlled outside linux??

No, as it is controlled by an external entity, outside the system you
are describing.

DT also doesn't describe external power input, power switches, power cords,
low/medium/high voltage circuit breakers, nuclear power plants, the Sun, ..=
.

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

