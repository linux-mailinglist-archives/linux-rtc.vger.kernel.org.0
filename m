Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF3549BDDB
	for <lists+linux-rtc@lfdr.de>; Sat, 24 Aug 2019 14:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbfHXM6X (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 24 Aug 2019 08:58:23 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43407 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727809AbfHXM6X (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 24 Aug 2019 08:58:23 -0400
Received: by mail-wr1-f68.google.com with SMTP id y8so11005121wrn.10;
        Sat, 24 Aug 2019 05:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G3ESOa9NJAsJUjWNrnPnjDwZTftOkLGFak1OQN0gsQY=;
        b=pS2MueYxkxOtPkyoyubWuGXipuqh1lUTQY8+f9ixzmA2IcpJ4t+vdZaU3md1a1hkcj
         15qq+3OxdR4ejdehk8ZdEKFoLJV/6s7ZuCoTJRBXp3RVeHu9G+2jpfPeyypn1/uynj5Q
         JQlN8yVLwswe8A7AlZ123AQFV78hQX+XpIrZ2C9u77NxUukNcXwPUy5hxCgsd4+w97NI
         htGZKxKbTKrb9epfwxraThNtwV3jLXkZ4mvwP+o+Qw9hJCgRK+mkwNe1ilj3Qd3ddLYa
         89XYy9ZNkm9vPfdTrdBJME2wr1pxAK2iwxbqY9hfFM65othgp32J1tCy5jGiLuASmDll
         8oLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G3ESOa9NJAsJUjWNrnPnjDwZTftOkLGFak1OQN0gsQY=;
        b=FaAeDWmxJuHoJXMt4ByaL9v7sMxgIT1HXrQ6eYgzzTx911EOA8hYwFIu8V2R0oCF1Z
         /bruHRENsb8CqMsPHgToTtFuXoE7Ofui0UlhWy7xnpiCXuN6LyeCcqsRhaJ/s1IBg7XD
         ncytZbh1PVn51eln5PsssK1e5BCb/ePRV/BXBotciGH456gqvuosGcFhp4krtxz5sBvm
         qA95DS5E47/SwUvjaCnf2oRBgn7ZWG4SmmPp7dfCOlck7Vq/yw+zc6MCm6o728ma/FuX
         p9N5KLhkVApzPX2rMmMnK9c8+iM7mryZPnvvBVZEd1gZ35W23W8r9SAjPP0v17GXn4La
         wqwg==
X-Gm-Message-State: APjAAAWKMQnhFuoYc3oEU47mluFDFTDdijPfiiI/Y+23jPHKUSg1YyZ2
        O3GJ7ubTObZiA9tJmvYRzOU=
X-Google-Smtp-Source: APXvYqy3Ct7oHiXUax0h3AwE0TyEtr9iN5AotacP/QNPLTugY4xowy0h9NzSGdA8CGU0p2Yk+53E1A==
X-Received: by 2002:adf:eec5:: with SMTP id a5mr10971378wrp.352.1566651500828;
        Sat, 24 Aug 2019 05:58:20 -0700 (PDT)
Received: from jernej-laptop.localnet (cpe-86-58-59-25.static.triera.net. [86.58.59.25])
        by smtp.gmail.com with ESMTPSA id o8sm11023525wma.1.2019.08.24.05.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2019 05:58:20 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     linux-sunxi@googlegroups.com, megous@megous.com
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH v2 0/3] Add basic support for RTC on Allwinner H6 SoC
Date:   Sat, 24 Aug 2019 14:58:18 +0200
Message-ID: <2660592.K6CN9dZ0QN@jernej-laptop>
In-Reply-To: <20190824125612.zq5qsay2wv62wykt@core.my.home>
References: <20190820151934.3860-1-megous@megous.com> <5421621.t8Lore9UF7@jernej-laptop> <20190824125612.zq5qsay2wv62wykt@core.my.home>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Dne sobota, 24. avgust 2019 ob 14:56:12 CEST je Ond=C5=99ej Jirman napisal(=
a):
> Hi,
>=20
> On Sat, Aug 24, 2019 at 10:06:14AM +0200, Jernej =C5=A0krabec wrote:
> > Dne sobota, 24. avgust 2019 ob 10:04:24 CEST je Jernej =C5=A0krabec nap=
isal(a):
> > > Hi!
> > >=20
> > > Dne torek, 20. avgust 2019 ob 17:19:31 CEST je megous@megous.com=20
napisal(a):
> > > > From: Ondrej Jirman <megous@megous.com>
> > > >=20
> > > > I went through the datasheets for H6 and H5, and compared the
> > > > differences.
> > > > RTCs are largely similar, but not entirely compatible.
> > > > Incompatibilities
> > > > are in details not yet implemented by the rtc driver though.
> > > >=20
> > > > I also corrected the clock tree in H6 DTSI.
> > > >=20
> > > > This patchset is necessary for implementing the WiFi/Bluetooth supp=
ort
> > > > on boards using H6 SoC.
> > > >=20
> > > > There was some discussion previously of describing HOSC, DCXO and XO
> > > > oscillators and clocks as part of RTC in DT, but I decided against =
it
> > > > because it's not necessary, becuse information that would be provid=
ed
> > > > as a part of DT can already be determined at runtime from RTC
> > > > registers,
> > > > so this woudn't add any value and would only introduce complications
> > > > to the driver. See: https://patchwork.kernel.org/cover/10898083/
> > > >=20
> > > > Please take a look.
> > > >=20
> > > >=20
> > > > Thank you and regards,
> > > >=20
> > > >   Ondrej Jirman
> > >=20
> > > Sorry for a bit late test, but with your patches on Tanix TX6 box I g=
et
> > > this in dmesg:
> > >=20
> > > [   17.431742] sun6i-rtc 7000000.rtc: Failed to set rtc time.
> > > [   20.439742] sun6i-rtc 7000000.rtc: rtc is still busy.
> > > [   21.435744] sun6i-rtc 7000000.rtc: rtc is still busy.
> > > [   24.055741] sun6i-rtc 7000000.rtc: rtc is still busy.
> > > [   24.439752] sun6i-rtc 7000000.rtc: rtc is still busy.
> > >=20
> > > Last line is repeated non-stop.
> > >=20
> > > Any idea what could be wrong?
> >=20
> > Additional info - this is on kernel 5.2.6 with your patches applied.
>=20
> Do you have schematics, or a FEX file for the board or any other info on =
how
> the RTC is set up on that board?
>=20
> Can you dump the RTC register range?

I have only Android DT, but as I already said in latest reply to patch 2,=20
changing switch bypass to bit 14 instead of 15 solved all issues.

Best regards,
Jernej

>=20
> regards,
> 	o.
>=20
> > Best regards,
> > Jernej
> >=20
> >=20
> >=20
> >=20
> >=20
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel




