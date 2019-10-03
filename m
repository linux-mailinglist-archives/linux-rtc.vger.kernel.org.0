Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEF4ACA018
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 16:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbfJCOLG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 10:11:06 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:54451 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728405AbfJCOLF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Oct 2019 10:11:05 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46kZft3hGJz1rLFn;
        Thu,  3 Oct 2019 16:11:02 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46kZft3G0yz1qqkM;
        Thu,  3 Oct 2019 16:11:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id 8_DMiCrKeOt7; Thu,  3 Oct 2019 16:11:01 +0200 (CEST)
X-Auth-Info: DWv8BxMh/iTf0m4AnKrtt6dC4KfTKDUDo8wYmzBiBN4=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu,  3 Oct 2019 16:11:01 +0200 (CEST)
Date:   Thu, 3 Oct 2019 16:10:53 +0200
From:   Lukasz Majewski <lukma@denx.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Add support for century bits to m41t62 (rv4162)
 RTC devices
Message-ID: <20191003161054.1eeae401@jawa>
In-Reply-To: <20191003134329.GB575@piout.net>
References: <20190911154803.15969-1-lukma@denx.de>
        <20191003114831.GR4106@piout.net>
        <20191003142150.3d73a9d7@jawa>
        <20191003123538.GS4106@piout.net>
        <20191003151434.49762715@jawa>
        <20191003134329.GB575@piout.net>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/hLnbrGCehw8PWPNow57OW+W"; protocol="application/pgp-signature"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/hLnbrGCehw8PWPNow57OW+W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

> On 03/10/2019 15:14:34+0200, Lukasz Majewski wrote:
> > Hi Alexandre,
> >  =20
> > > On 03/10/2019 14:21:50+0200, Lukasz Majewski wrote: =20
> > > > >=20
> > > > > See the datasheet:
> > > > >=20
> > > > > "During any year which is a multiple of 4, the RV-4162 RTC
> > > > > will automatically insert leap day, February 29.  Therefore,
> > > > > the application software must correct for this during the
> > > > > exception years (2100, 2200, etc.) as noted above."   =20
> > > >=20
> > > > I'm wondering what the phrase "application software" means here?
> > > >=20
> > > > If it is the userland SW, then we shall at least be able to set
> > > > 2099 in this device and then count on software correction.
> > > >=20
> > > > If the "application software" is the kernel driver - the date
> > > > correction shall be done there (maybe some lookup table?).
> > > >=20
> > > > Personally, I do prefer the first option - this means that with
> > > > this patch we can set the time to e.g. 2234 year and then rely
> > > > on userland software (or libc) to do the correction.
> > > >    =20
> > >=20
> > > It is not possible to ensure this correction is properly done in
> > > software, there is no point in letting the user set those bits.

Sorry, but I do see some inconsistency here.

The application note [1] says that the correction shall be done in
application SW.

The rtc-range.c program [2] sets and reads the time via ioctl (e.g.
RTC_SET_TIME, RTC_RD_TIME).

To pass your tests one needs to do the correction in linux kernel
driver for drivers/rtc/rtc-m41t80.c.=20

Please correct me if I'm wrong, but IMHO it shall be enough to adjust
2100, 2200, 2300, years in this driver (the submitted patch shall be
adjusted to support it - I can prepare proper v2).

> > >=20
> > >  =20
> >=20
> > I see your point.
> >=20
> > However, could you share your idea on testing setting RTC time to
> > year 2100 on this particular IC (by using hctosys and friends)?
> >  =20
>=20
> You can use rtc from
> https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/
>=20
> You can also use rtc-range with your patch to observe that it fails in
> 2100.

Thanks for sharing useful links.

>=20


Note:

[1] -
https://www.microcrystal.com/fileadmin/Media/Products/RTC/App.Manual/RV-416=
2-C7_App-Manual.pdf
(point 4.5 and 4.6).

[2] -
https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/rtc-tools.git/tree=
/rtc-range.c

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/hLnbrGCehw8PWPNow57OW+W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2WAW4ACgkQAR8vZIA0
zr08Kwf/YpzxMFrU14J1/zeQIdS2HX0KnJxnEjRfICLoEhuetfa4cjxXlSww7O3x
6ErhNA2wvBwZKwABeufpN8aSUdAsRiwCTQojyzd2RBvuCokZz38SbEP3KgKc8XhU
Z1sU/ASmBUd1KpSkH/A6FysimfnU7qxJN+HdxXJyX/SDEsQFAKq0WAcV72Oylr9q
b+SgFhoy1QxKspTZcblhw4th1hiDSiYvz358l+HuDu66mTyxEEDASID3Gmyd9TV4
8HYNwpvyaJPgyRiDwqqYbrZ7LVqSt8wBnPHoNaLEZXqVWXJBDRgVmMvlTZjYqOWS
bm2oxVT/vNcORJc0DF9T4Ds4BTKy9w==
=HmuE
-----END PGP SIGNATURE-----

--Sig_/hLnbrGCehw8PWPNow57OW+W--
