Return-Path: <linux-rtc+bounces-1835-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 216D9969538
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 09:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 957441F21F06
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Sep 2024 07:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714581D6C46;
	Tue,  3 Sep 2024 07:23:28 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7803A1D54F2;
	Tue,  3 Sep 2024 07:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725348208; cv=none; b=Ifk6f4IB3YB662U23idA18ATnmMn/R2jGH0LBLkn9n2x+HYFjd5r4olcqfnflewaDKXjG/x9LO5GTiL/RWdRezOSbYFgkSP5I0edHO6FYFdZiUBsPNe6c3jV2Rwa5cMWXGs7hw0YOkTvMo2zzJ9PBB2X1NL1k51viqUZg/3Odgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725348208; c=relaxed/simple;
	bh=Yp38T9fcL5mpM87ZwmJ7gzfDKgW7yOLL8hiI6QyZ5gM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDT40BhnLdntjOd3harVHKPSVY2KlyKHFjzOEollyp7FzKBDZTLlwY/5RmWsIdt0OysyTABU0T4Tqg8TO2qXrA5+vfrLTo1Ycpjcf2b8o+iSMA3MIKg02XrtACmadCtp9uxclsFj3N9Z58l+/G0Dl8DB1HE3t+JPXg73NVSihws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6b6b9867f81so38484777b3.1;
        Tue, 03 Sep 2024 00:23:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725348202; x=1725953002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOU2IbYMKzeMsEANROBq/PVgy6rMGgJl0btd+MgCP2Y=;
        b=h0QeWD7vbAydFPpknatzxEB4+UjBoJCcaYfRwy4HUM0mh9QRj77OQ+adNU6oPjFYxO
         YhH5UVu24P/fS895Hu4QkPxHlgsRyBtLuV+oyCVZwzk+uumvgDwn5io+wItpgdLsmso/
         r34HZf17FZ/Pevug2ya+7FQkZv4De5c/dlx4mAmLEbPDcf9w62RyY+o73LlHS9J8KsD6
         Xgtr8UM8hH2Qis3NTuNTzwKkB3JM2/SdVQSYPzczrt/ydYIDm5iUqJ49RrXQjmnvknyC
         Ca9u3hB4gpGm8AmJLUloUMRzOyV3pAakGKmw43luVyloPxQ5UuEVqNmqSjHUsF6wtRPR
         q+6w==
X-Forwarded-Encrypted: i=1; AJvYcCU/cUjcGCtcEX2uRKX71M1zCTuxn1oOlGRiB6oWvBUqtvISR+238EZ4mTk/uIzZL+MFlGxDSiLwQ/8e@vger.kernel.org, AJvYcCV4iZiTGbQ460IKAZS+CI8CwhEdh23VHef0awOXhzKl8T3TnB5j+HS1jsjMuGA8PAEQPhDa+W5TOC+HTEWQ@vger.kernel.org, AJvYcCVdKOpqJ9YwQRCJbFi9TnG4h+ofX/55lo9TXm4e3Sw7znZq6jh2dDgEnX8Q0W6+QyRO1EnC/1ho8Pl0@vger.kernel.org, AJvYcCWCjcrVOHYaT9K2y0WgrvTMC2yUAb+VCojkETjjWNYsRMxij7wTIbISo0SXlIe4x5HCy6xxmQbqV+VB@vger.kernel.org, AJvYcCWmPckGWcSGusFMTgqxiPAOpui4zXUpk+q3WQMncQJ9IFN4TtgbxhJl492/DJ/us/pye2doDVC3pcoyoi6r89gKE3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzcIkeaNKM+1xYMXZ79FXZwVswIVWf015n+R9vyeAcVMU4b0eZ
	hN/lRYenyE1Z0tW+nmqMeVXaF0LrXQGHKsjOj22/Wau9eHrXVWDlC/kdCN9f
X-Google-Smtp-Source: AGHT+IH6b56lf0fRG2IP3VNTEtt4w/YajNbPFiL2rwXO4ZujvaQt1Wjj0u7pVSs7GzSSZI84L9Z+zg==
X-Received: by 2002:a05:690c:4888:b0:6b0:f068:8274 with SMTP id 00721157ae682-6d40fc1b2dfmr93329657b3.41.1725348202303;
        Tue, 03 Sep 2024 00:23:22 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6da2f9f144asm4035907b3.118.2024.09.03.00.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 00:23:22 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-699ac6dbf24so41961927b3.3;
        Tue, 03 Sep 2024 00:23:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjAL/M1ucqX59a2qy1Q/DZ/ZuQIKuXoy0HUGFXSCUbJLqez6cCXfnWgD8xsrN0yBZsxszeMNRRMZanlm4MX30PM0Q=@vger.kernel.org, AJvYcCWEvBe5Q9ouE+IrAGPrdndCc1q53u0tMZSWo2Yg/2mppKjNjGknwh7gTswemd96gOvzpWDm6WzkZG7E@vger.kernel.org, AJvYcCWjM0SjDBohiLhOu/bbwvEgUYLNgENbFcod5yMtmGgQ5DOGaM8WBgc1twBmnBFfMekXiabBrLu8BYqH@vger.kernel.org, AJvYcCXWY5JcjsRqBFDwQz4krGD/+1X4K3cqVosT7DfDytvSTYnAgHj/vNx2ACyUrMiDfQW1gJpP6iXORZfM@vger.kernel.org, AJvYcCXgfPz5FHVkwcUefmvP5EtMreRIUvNk6HKajZQJvDozvG9sY+esWcnEqjkQASMznmcuMGQkG6vDdTeKrG2g@vger.kernel.org
X-Received: by 2002:a05:690c:b:b0:6ad:feb0:e6c9 with SMTP id
 00721157ae682-6d40e4856fbmr141494947b3.23.1725348201332; Tue, 03 Sep 2024
 00:23:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-2-claudiu.beznea.uj@bp.renesas.com> <TY3PR01MB11346D59E486D88611E8F254F86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346D59E486D88611E8F254F86932@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Sep 2024 09:23:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUW7a-i-K8WoN3FwGaam+17ngr4Hp6agBzAG+9SermOQ@mail.gmail.com>
Message-ID: <CAMuHMdVUW7a-i-K8WoN3FwGaam+17ngr4Hp6agBzAG+9SermOQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, 
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

On Tue, Sep 3, 2024 at 8:58=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> > -----Original Message-----
> > From: Claudiu <claudiu.beznea@tuxon.dev>
> > Sent: Friday, August 30, 2024 2:02 PM
> > Subject: [PATCH v3 01/12] dt-bindings: clock: renesas,r9a08g045-vbattb:=
 Document VBATTB
> >
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC, the=
 tamper detector and a small
> > general usage memory of 128B. Add documentation for it.
> >
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.=
yaml
> > +  power-domains:
> > +    maxItems: 1
>
> Not sure, you need to document "PD_VBATT" power domain
> as per Table 41.2, this LSI supports 3 power domains(PD_ISOVCC, PD_VCC, P=
D_VBATT)
>
> Power Mode PD_ISOVCC PD_VCC PD_VBATT
> ALL_ON      ON          ON    ON
> AWO         OFF         ON    ON
> VBATT       OFF         OFF   ON
> ALL_OFF     OFF         OFF   OFF
>
> PD_VBATT domain is the area where the RTC/backup register is located, wor=
ks on battery power when the power of
> PD_VCC and PD_ISOVCC domain are turned off.

AFAIU, PD_VBATT cannot be controlled by the user, and is just on
if main or battery power is supplied. So I don't think there is a need
to describe it in DT.

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

