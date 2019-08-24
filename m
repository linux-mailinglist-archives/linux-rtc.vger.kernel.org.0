Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6759C085
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Aug 2019 23:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbfHXVgc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 24 Aug 2019 17:36:32 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55237 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727708AbfHXVgc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 24 Aug 2019 17:36:32 -0400
Received: by mail-wm1-f65.google.com with SMTP id p74so11966085wme.4;
        Sat, 24 Aug 2019 14:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TO0VXq9p9jk6JyqDRkPQMqRwi7hPTlHb4mG3H1wkzKo=;
        b=gq4JZhQ6lGZA3R4u07JRf0ucdDI3M1XYbiFCAgA7Q+SaGcCInKtRkbBgmPYbCLdHf/
         snWtIbJtXZl2r4xV6MkglSpO1dDzMalPDzIIbR+Ysv86o8KUFlA0NVC1/BeI75fr449c
         ktJcs6Z1bXPV7tjS2fBzZhcLBqbGJXShnZutrnM19Gvc2rDrUT9YHKw/Ryk4O0tphkgs
         2fMmduibQ0EXwt9cPGHvwAb8SJKE5TBDyT7g2DjfVW4Te54/vNvcJOIsN3xSdhnopqi/
         s18w8M5wRbcjXZKuGEhoFzJk1c7vMhPDjsQI8p8sz/84OJm4/KrUqpuQA6SnoXorqcrZ
         McyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TO0VXq9p9jk6JyqDRkPQMqRwi7hPTlHb4mG3H1wkzKo=;
        b=HnPSOjeMVkyN+n4ke4FgihsZ5XkxtfbGBx5gAxtWYf423gn0G2RIyGDhBGjbfRkf4h
         YYR2N0htneD5529yfwVivyyJpmzrqfUuccz42yb1OB0onbZGai9V9jHhRI1dJnfH66jI
         zUqMgqdYO4PLrchjg6tTlWhVOGv3hbe3HFegzkGX7Q0ZaUNMQMXaAERryOl2VsJEecb0
         v3dXOiFi1/AZOwgAgmShBIFImPGWPp+/GhVX0RQ7ugx9aKErPi3fTMRyrc7mQj+7P1fw
         2qSlIFdLBsEM8HAfEmpOlIOVtR1fo0gCz9dFJsLW1bl6Loakbf6CH5I3KANO2peRzxZG
         FhaQ==
X-Gm-Message-State: APjAAAXCdL4SvjukhfVXs+VgnpVlocRclaVFONY2VqNVOX2eCGms8jII
        qUf9BmSBCv18cPjYqqkZiUc=
X-Google-Smtp-Source: APXvYqzxcqv5xb7sIjkMyUOoUWDuMhBA+aSF+kFWJlAXsr7b1dzTNuRd8ckbPMO8r+VndOTvj2Lv7g==
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr12390462wmh.65.1566682589356;
        Sat, 24 Aug 2019 14:36:29 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net. [86.58.59.25])
        by smtp.gmail.com with ESMTPSA id a18sm8394239wrt.18.2019.08.24.14.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2019 14:36:28 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     linux-sunxi@googlegroups.com, megous@megous.com
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH v2 2/3] rtc: sun6i: Add support for H6 RTC
Date:   Sat, 24 Aug 2019 23:36:26 +0200
Message-ID: <7913281.jYEbquIlsS@jernej-laptop>
In-Reply-To: <20190824212746.a5pyilkrrvysjjbd@core.my.home>
References: <20190820151934.3860-1-megous@megous.com> <1690798.2HKiRSsjat@jernej-laptop> <20190824212746.a5pyilkrrvysjjbd@core.my.home>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Dne sobota, 24. avgust 2019 ob 23:27:46 CEST je Ond=C5=99ej Jirman napisal(=
a):
> Hello Jernej,
>=20
> On Sat, Aug 24, 2019 at 11:09:49PM +0200, Jernej =C5=A0krabec wrote:
> > > Visually?
> > >=20
> > > That would explain why it doesn't work for you. The mainline RTC driv=
er
> > > disables auto-switch feature, and if your board doesn't have a crystal
> > > for
> > > LOSC, RTC will not generate a clock for the RTC.
> > >=20
> > > H6's dtsi describes by default a situatiuon with external 32k crystal
> > > oscillator. See ext_osc32k node. That's incorrect for your board if it
> > > doesn't have the crystal. You need to fix this in the DTS for your bo=
ard
> > > instead of patching the driver.
> >=20
> > I see that reparenting is supported, but I'm not sure how to fix that in
> > DT. Any suggestion?
>=20
> You may try removing the clocks property from rtc node.

I don't think this would work:
https://elixir.bootlin.com/linux/latest/source/drivers/rtc/rtc-sun6i.c#L246

>=20
> > > The driver has parent clock selection logic in case the LOSC crystal =
is
> > > not
> > > used.
> > >=20
> > > Your patch enables automatic detection of LOSC failure and RTC changes
> > > clock to LOSC automatically, despite what's described in the DTS. That
> > > may fix the issue, but is not the correct solution.
> > >=20
> > > Registers on my board look like this (external 32k osc is used) for
> > > reference:
> > >=20
> > > LOSC_CTRL_REG[7000000]: 8011
> > >=20
> > > 	KEY_FIELD                      ???                  (0)
> > > 	LOSC_AUTO_SWT_BYPASS           EN                   (1)
> > > 	LOSC_AUTO_SWT_EN               DIS                  (0)
> > > 	EXT_LOSC_EN                    EN                   (1)
> > > 	EXT_LOSC_GSM                   LOW                  (0)
> > > 	BATTERY_DIR                    DISCHARGE            (0)
> > > 	LOSC_SRC_SEL                   EXT32k               (1)
> > >=20
> > > LOSC_AUTO_SWT_STA_REG[7000004]: 1
> > >=20
> > > 	EXT_LOSC_STA                   OK                   (0)
> > > 	LOSC_AUTO_SWT_PEND             NOEFF                (0)
> > > 	LOSC_SRC_SEL_STA               EXT32K               (1)
> >=20
> > In my case LOSC_CTRL_REG has value 0x4010 and LOSC_AUTO_SWT_STA_REG
> > has value 0x4, so there is issue with external crystal (it's missing) a=
nd
> > RTC switched to internal one.
> >=20
> > BTW, what's wrong with automatic switching? Why is it disabled?
>=20
> It always was disabled on mainline (bit 14 was set to 0 even before my
> patch). H6 just probably has another extra undocummented bit, that's need=
ed
> to disables it properly.
>=20
> You probably don't want a glitch to switch your RTC from high-precision
> clock to a low precision one possibly without any indication in the
> userspace or a kernel log.
>=20
> Regardless of all this, DTS needs to have a correct description of the HW,
> which means if RTC module is not connected to the 32.757kHz crystal/clock,
> clocks property should be empty.

If we are talking about correct HW description, then clock property should=
=20
actually have possibility that two clocks are defined - one for internal RC=
=20
(always present) and one external crystal (optional). In such case I could=
=20
really just omit external clock and be done with it. But I'm not sure if su=
ch=20
solution is acceptable at this point.

Best regards,
Jernej

>=20
> regards,
> 	o.
>=20
> > Best regards,
> > Jernej
> >=20
> > > regards,
> > >=20
> > > 	o.
> > > =09
> > > > > The real issue probably is that the mainline driver is missing th=
is:
> > > > >=20
> > > > > https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.c?h=3Dh6-=
4.9-b
> > > > > sp#n
> > > > > 650
> > > >=20
> > > > Not sure what you mean by that. ext vs. int source selection?
> > > >=20
> > > >=20
> > > >=20
> > > > Best regards,
> > > > Jernej
> > > >=20
> > > > > regards,
> > > > >=20
> > > > > 	o.




