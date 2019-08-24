Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20F5B9C047
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Aug 2019 23:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbfHXVJ4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 24 Aug 2019 17:09:56 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45007 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727777AbfHXVJz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 24 Aug 2019 17:09:55 -0400
Received: by mail-wr1-f66.google.com with SMTP id p17so11710393wrf.11;
        Sat, 24 Aug 2019 14:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FkjZ8qKkvQYfR6BJQNr4e3eCJhy1+hJifOeV8qI4Omk=;
        b=bNLaqR9BU6YywOvEbCfVpFN+ePqx7BbInNyyp9KWkOTiFaaY/MmvbBJ4/WN4xDUUcZ
         Hdx9bb11XqrPiRMJYyOcejyUun6YZHoSkUntjpEXCZ/c+797/XQDS+l+AzJm0EXmSp2R
         WMZXGYFBufUkLGhvaPb2+T0NAmpQL17B3P5XWFb1JcY3YQkrD8dGRoij2QNYNMLl6VtI
         2s0hYcpJK9FIgtOfnjpmJJkt9rz8mxG2E9GkWxjrCqvqFa2RpONws3u4lU2x0d+514vR
         OFL699Oz0+zRC83sXiDxPB6SxzLAND0Kvoe3qi8tefzUK0mnSeuurNCJp6hG6m4c5vuC
         xgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FkjZ8qKkvQYfR6BJQNr4e3eCJhy1+hJifOeV8qI4Omk=;
        b=VSs0qLBhg1M0fBvb65kJYMvuQoMCABncPNM/Bmlj0xymP31czmklNF5PKYK+rnZKk/
         lYMJwr+TXZl9Ym8cv4IHYSgleykdKDhQRlMUiPDaf4Tc0LIBwdZ+pAP7QIFttLeWW5i/
         BbGuiUgixP/BJhXlNlWxxxvs84qTUC0f1FQmdHiM1koAbs4jOkAfHNOSYP63Kkby0KMH
         +FnLGTDKAivkQUb+xV7X9diDY2SCujm4IpKIH2CbRmrujA+5tQZayHb9FGLQpgZAtkeE
         lpc/DDtb6UH8YQhYwwQRqotghKDdHJKBYuaJdYquxJKxCwKyyJBc4YveRU+vDRwOVu3c
         aluQ==
X-Gm-Message-State: APjAAAWzDnCy0eKLnZRFVpWcSEnqynqhZfYndi3uVpZh4dZs7PrHvDWe
        wrTzhqvsrAMEE4Ik7r8DPALzN/o8ssk=
X-Google-Smtp-Source: APXvYqw4hzk4xWwD1PLfs9EWba/vUMqttL5IbCDTVE8WFS6LCiHKJMEhZTrBfhSt2l4H6+LR4cjIZg==
X-Received: by 2002:a5d:4cc5:: with SMTP id c5mr12185978wrt.278.1566680992387;
        Sat, 24 Aug 2019 14:09:52 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net. [86.58.59.25])
        by smtp.gmail.com with ESMTPSA id 12sm6865462wmi.34.2019.08.24.14.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2019 14:09:51 -0700 (PDT)
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
Date:   Sat, 24 Aug 2019 23:09:49 +0200
Message-ID: <1690798.2HKiRSsjat@jernej-laptop>
In-Reply-To: <20190824133057.rhpj3xuzr3vymdiy@core.my.home>
References: <20190820151934.3860-1-megous@megous.com> <10880274.nteIY8W56H@jernej-laptop> <20190824133057.rhpj3xuzr3vymdiy@core.my.home>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Dne sobota, 24. avgust 2019 ob 15:30:57 CEST je Ond=C5=99ej Jirman napisal(=
a):
> On Sat, Aug 24, 2019 at 03:16:41PM +0200, Jernej =C5=A0krabec wrote:
> > Dne sobota, 24. avgust 2019 ob 15:05:44 CEST je Ond=C5=99ej Jirman napi=
sal(a):
> > > On Sat, Aug 24, 2019 at 02:51:54PM +0200, Jernej =C5=A0krabec wrote:
> > > > Dne sobota, 24. avgust 2019 ob 14:46:54 CEST je Ond=C5=99ej Jirman=
=20
napisal(a):
> > > > > Hi,
> > > > >=20
> > > > > On Sat, Aug 24, 2019 at 02:32:32PM +0200, Jernej =C5=A0krabec wro=
te:
> > > > > > Hi!
> > > > > >=20
> > > > > > Dne torek, 20. avgust 2019 ob 17:19:33 CEST je megous@megous.com
> > > >=20
> > > > napisal(a):
> > > > > > > From: Ondrej Jirman <megous@megous.com>
> > > > > > >=20
> > > > > > > RTC on H6 is mostly the same as on H5 and H3. It has slight
> > > > > > > differences
> > > > > > > mostly in features that are not yet supported by this driver.
> > > > > > >=20
> > > > > > > Some differences are already stated in the comments in existi=
ng
> > > > > > > code.
> > > > > > > One other difference is that H6 has extra bit in LOSC_CTRL_RE=
G,
> > > > > > > called
> > > > > > > EXT_LOSC_EN to enable/disable external low speed crystal
> > > > > > > oscillator.
> > > > > > >=20
> > > > > > > It also has bit EXT_LOSC_STA in LOSC_AUTO_SWT_STA_REG, to che=
ck
> > > > > > > whether
> > > > > > > external low speed oscillator is working correctly.
> > > > > > >=20
> > > > > > > This patch adds support for enabling LOSC when necessary:
> > > > > > >=20
> > > > > > > - during reparenting
> > > > > > > - when probing the clock
> > > > > > >=20
> > > > > > > H6 also has capacbility to automatically reparent RTC clock f=
rom
> > > > > > > external crystal oscillator, to internal RC oscillator, if
> > > > > > > external
> > > > > > > oscillator fails. This is enabled by default. Disable it duri=
ng
> > > > > > > probe.
> > > > > > >=20
> > > > > > > Signed-off-by: Ondrej Jirman <megous@megous.com>
> > > > > > > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > > > > > > ---
> > > > > > >=20
> > > > > > >  drivers/rtc/rtc-sun6i.c | 40
> > > > > > >  ++++++++++++++++++++++++++++++++++++++--
> > > > > > >  1 file changed, 38 insertions(+), 2 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> > > > > > > index d50ee023b559..b0c3752bed3f 100644
> > > > > > > --- a/drivers/rtc/rtc-sun6i.c
> > > > > > > +++ b/drivers/rtc/rtc-sun6i.c
> > > > > > > @@ -32,9 +32,11 @@
> > > > > > >=20
> > > > > > >  /* Control register */
> > > > > > >  #define SUN6I_LOSC_CTRL			=09
0x0000
> > > > > > >  #define SUN6I_LOSC_CTRL_KEY			(0x16aa
> >=20
> > << 16)
> >=20
> > > > > > > +#define SUN6I_LOSC_CTRL_AUTO_SWT_BYPASS		BIT(15)
> > > > > >=20
> > > > > > User manual says that above field is bit 14.
> > > > >=20
> > > > > See the previous discussion, this is from BSP.
> > > >=20
> > > > I have two versions of BSP (don't ask me which) which have this set=
 as
> > > > bit
> > > > 14 and changing this to 14 actually solves all my problems with LOSC
> > > > (no
> > > > more issues with setting RTC and HDMI-CEC works now - it uses LOSC =
as
> > > > parent) on Tanix TX6 box.
> > >=20
> > > Interesting. Is LOSC fed externally generated clock, or is it setup a=
s a
> > > crystal oscillator on your board?
> >=20
> > I really don't know, but here is DT: http://ix.io/1ThI
> >=20
> > > Anyway, see here:
> > >=20
> > > https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.h?h=3Dh6-4.9-=
bsp#n
> > > 649
> > > https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.c?h=3Dh6-4.9-=
bsp#n
> > > 652
> >=20
> > Interesting, 4.9 BSP has additional bit definition, which is not
> > documented in manual and 3.10 BSP to which I refer.
> >=20
> > I was referring to 3.10 BSP, which uses only bit 14. I thought that you
> > named it differently.
> >=20
> > > It would be nice to know what's really happening.
> > >=20
> > > My output is:
> > >=20
> > > [    0.832252] sun6i-rtc 7000000.rtc: registered as rtc0
> > > [    0.832257] sun6i-rtc 7000000.rtc: RTC enabled
> > > [    1.728968] sun6i-rtc 7000000.rtc: setting system clock to
> > > 1970-01-01T00:00:07 UTC (7)
> >=20
> > With change, I get same output.
> >=20
> > > I think, you may have just enabled the auto switch feature, and runni=
ng
> > > the
> > > clock from low precision RC oscillator with your patch.
> >=20
> > True, now I think there is no external crystal, but I'm still not sure =
how
> > to confirm that.
>=20
> Visually?
>=20
> That would explain why it doesn't work for you. The mainline RTC driver
> disables auto-switch feature, and if your board doesn't have a crystal for
> LOSC, RTC will not generate a clock for the RTC.
>=20
> H6's dtsi describes by default a situatiuon with external 32k crystal
> oscillator. See ext_osc32k node. That's incorrect for your board if it
> doesn't have the crystal. You need to fix this in the DTS for your board
> instead of patching the driver.

I see that reparenting is supported, but I'm not sure how to fix that in DT=
=2E=20
Any suggestion?

>=20
> The driver has parent clock selection logic in case the LOSC crystal is n=
ot
> used.
>=20
> Your patch enables automatic detection of LOSC failure and RTC changes cl=
ock
> to LOSC automatically, despite what's described in the DTS. That may fix
> the issue, but is not the correct solution.
>=20
> Registers on my board look like this (external 32k osc is used) for
> reference:
>=20
> LOSC_CTRL_REG[7000000]: 8011
> 	KEY_FIELD                      ???                  (0)
> 	LOSC_AUTO_SWT_BYPASS           EN                   (1)
> 	LOSC_AUTO_SWT_EN               DIS                  (0)
> 	EXT_LOSC_EN                    EN                   (1)
> 	EXT_LOSC_GSM                   LOW                  (0)
> 	BATTERY_DIR                    DISCHARGE            (0)
> 	LOSC_SRC_SEL                   EXT32k               (1)
>=20
> LOSC_AUTO_SWT_STA_REG[7000004]: 1
> 	EXT_LOSC_STA                   OK                   (0)
> 	LOSC_AUTO_SWT_PEND             NOEFF                (0)
> 	LOSC_SRC_SEL_STA               EXT32K               (1)
>=20

In my case LOSC_CTRL_REG has value 0x4010 and LOSC_AUTO_SWT_STA_REG
has value 0x4, so there is issue with external crystal (it's missing) and R=
TC=20
switched to internal one.

BTW, what's wrong with automatic switching? Why is it disabled?

Best regards,
Jernej

> regards,
> 	o.
>=20
> > > The real issue probably is that the mainline driver is missing this:
> > >=20
> > > https://megous.com/git/linux/tree/drivers/rtc/rtc-sunxi.c?h=3Dh6-4.9-=
bsp#n
> > > 650
> >=20
> > Not sure what you mean by that. ext vs. int source selection?
> >=20
> >=20
> >=20
> > Best regards,
> > Jernej
> >=20
> > > regards,
> > >=20
> > > 	o.




