Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF22C9E45
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 14:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbfJCMWB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 08:22:01 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:39686 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfJCMWB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Oct 2019 08:22:01 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46kXF130gpz1rK4l;
        Thu,  3 Oct 2019 14:21:57 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46kXF12d6Jz1qqkK;
        Thu,  3 Oct 2019 14:21:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 7DM6tlF8VvmA; Thu,  3 Oct 2019 14:21:56 +0200 (CEST)
X-Auth-Info: HGpuP1xgAmL/Lm4vKngmy905fxc/nisakm+icAlyK7k=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu,  3 Oct 2019 14:21:56 +0200 (CEST)
Date:   Thu, 3 Oct 2019 14:21:50 +0200
From:   Lukasz Majewski <lukma@denx.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Add support for century bits to m41t62 (rv4162)
 RTC devices
Message-ID: <20191003142150.3d73a9d7@jawa>
In-Reply-To: <20191003114831.GR4106@piout.net>
References: <20190911154803.15969-1-lukma@denx.de>
        <20191003114831.GR4106@piout.net>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/SCWWP/Fd_4I9Z/zxduTGEc="; protocol="application/pgp-signature"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/SCWWP/Fd_4I9Z/zxduTGEc=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

> Hello,
>=20
> On 11/09/2019 17:48:03+0200, Lukasz Majewski wrote:
> > This change adds support for 'century bits' on 4162 family of RTC
> > devices (from ST or microcrystal), which allow storing time beyond
> > year 2099.
> >=20
> > For rv4162 century bits - CB1[7]:CB0[6] are stored in reg6 - 0x6
> > (MONTH): CB1  CB0
> >  0    0      (year 2000 - 2099)
> >  0    1      (year 2100 - 2199)
> >  1    0      (year 2200 - 2299)
> >  1    1      (year 2300 - 2399)
> >=20
> > The driver has been also adjusted to allow setting time up to year
> > 2399 if the M41T80_FEATURE_CB is set in its DTS/I2C data.
> >=20
> > There shall be no functional changes for devices not supporting this
> > feature. However, other devices - like m41t80 - have different
> > approaches to handle century information.
> >  =20
>=20
> This does not work because the RTC doesn't handle leap years on
> century properly. This means that if you do that, then there is no
> guarantee the date will be the correct after 2099. As far as the
> m41t62 and rv4162 are concerned, there is no way to make the century
> bits useful.

The code as is now doesn't allow to setup dates after year 2100.
In my application - I do some tests which depend on setting this time.

>=20
> See the datasheet:
>=20
> "During any year which is a multiple of 4, the RV-4162 RTC will
> automatically insert leap day, February 29.  Therefore, the
> application software must correct for this during the exception years
> (2100, 2200, etc.) as noted above."

I'm wondering what the phrase "application software" means here?

If it is the userland SW, then we shall at least be able to set 2099 in
this device and then count on software correction.

If the "application software" is the kernel driver - the date
correction shall be done there (maybe some lookup table?).

Personally, I do prefer the first option - this means that with this
patch we can set the time to e.g. 2234 year and then rely on userland
software (or libc) to do the correction.

>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/SCWWP/Fd_4I9Z/zxduTGEc=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2V594ACgkQAR8vZIA0
zr1pEAgAtNQUCZfjSRXaSLaq36lC3+P/p7WdbzPleZvqS/MKYh5wWzVkuSrotfCm
t71fXe4rWxmfkAOaeIPcd/+yZnFNR/H+BguUtqwA3R+BlFmDZdml+UDmYZOYrzkS
Dkm9VjubD/UhJktOjMQJg2wmxakfaRR9oQyBN2UkYAu77yJrYzHa/7CFOfn8LQbB
rQefkl8BJXty4BeLInXJD7IWkjI/vQjfcw74ZVDkutT7jRvuYpl9R2UHdHjSyHAx
w65EInLwD7dlNwqNG1Oa/+239XSXOX6lrMwRj7cSG1jSwzR1oslZkSNwHASuYh9j
0FBX/hKZiFVnSYMCh4QQkPQHXqOAZQ==
=NlrC
-----END PGP SIGNATURE-----

--Sig_/SCWWP/Fd_4I9Z/zxduTGEc=--
