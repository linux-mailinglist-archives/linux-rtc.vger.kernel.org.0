Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA9BDCA097
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 16:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbfJCOtR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 10:49:17 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:40511 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbfJCOtR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Oct 2019 10:49:17 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 46kbVy1gqNz1rLG6;
        Thu,  3 Oct 2019 16:49:14 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 46kbVy1GqLz1qqkM;
        Thu,  3 Oct 2019 16:49:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id bVuJONtXl7OR; Thu,  3 Oct 2019 16:49:12 +0200 (CEST)
X-Auth-Info: P1s/ox1Xkhv1qmwiCPHFbv5l8xjDq2ldsvkRpp7qGTM=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu,  3 Oct 2019 16:49:12 +0200 (CEST)
Date:   Thu, 3 Oct 2019 16:49:06 +0200
From:   Lukasz Majewski <lukma@denx.de>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Add support for century bits to m41t62 (rv4162)
 RTC devices
Message-ID: <20191003164906.2f4a1676@jawa>
In-Reply-To: <20191003142341.GD575@piout.net>
References: <20190911154803.15969-1-lukma@denx.de>
        <20191003114831.GR4106@piout.net>
        <20191003142150.3d73a9d7@jawa>
        <20191003123538.GS4106@piout.net>
        <20191003151434.49762715@jawa>
        <20191003134329.GB575@piout.net>
        <20191003161054.1eeae401@jawa>
        <20191003142341.GD575@piout.net>
Organization: denx.de
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/5rEXxMzAzgMgAL0.XHeDrkz"; protocol="application/pgp-signature"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

--Sig_/5rEXxMzAzgMgAL0.XHeDrkz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

> On 03/10/2019 16:10:53+0200, Lukasz Majewski wrote:
> > Sorry, but I do see some inconsistency here.
> >=20
> > The application note [1] says that the correction shall be done in
> > application SW.
> >=20
> > The rtc-range.c program [2] sets and reads the time via ioctl (e.g.
> > RTC_SET_TIME, RTC_RD_TIME).
> >=20
> > To pass your tests one needs to do the correction in linux kernel
> > driver for drivers/rtc/rtc-m41t80.c.=20
> >=20
> > Please correct me if I'm wrong, but IMHO it shall be enough to
> > adjust 2100, 2200, 2300, years in this driver (the submitted patch
> > shall be adjusted to support it - I can prepare proper v2).
> >  =20
>=20
> There is no way you will be able to know when to adjust the date
> because Linux may or may not be running when the boundary is crossed.
>=20

I'm rather thinking about following use cases:

I. Adjusting time:

1. I start with time < 01.01.2099

2. I issue ioctl to set the time to e.g. 2100

	- When driver receives such request I setup century bits

	- and also perform in kernel driver time correction (and store
	  corrected time in RTC)

3. Subsequent reads from rtc use century bits to provide the time
(after year 2100). Century bits are set, so the correction may be
performed if needed.


II. The system is started at year 2098 and is supposed to run for e.g. 3
years:

1. The time is read from the rtc - the "passing" of centuries need to
be detected.

=46rom the documentation [1] (point 4.5):

"The two century bits, CB1 and CB0, are bits 7 and 6, respectively, in
the Month / Century register at address 06h. Together, they comprise a
2 - bit counter which increments at the turn of each century. CB1 is
the most significant bit."

If those bits increment when we pass century boundaries, we can detect
this fact and correct time when ioctl is issued.

> The only useful range for an RTC is its fully contiguous range.=20

Does the automatic increment of century bits count to "contiguous
range" ?

> If it
> needs software to run to support an extended range, it can't be used
> in the context of Linux.
>=20


[1] -
https://www.microcrystal.com/fileadmin/Media/Products/RTC/App.Manual/RV-416=
2-C7_App-Manual.pdf

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/5rEXxMzAzgMgAL0.XHeDrkz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl2WCmIACgkQAR8vZIA0
zr2f3wf+NVE9Qtq8jPUko8YieoihbZToT+u1MPNK7UWIwY7ZaWHtEJqmQ/e8TFjU
Z7aOZoGgwXRdAso/QO/3ufe9wUGh4B6HoxynaUWzOh084OH6PaO771HkFBmFqXdW
jx28ysmeBvr8IO0WZ9CAJb8vYZAowZlS4yq5SCEWdjkEpMbO0mDWYNQUCyev49GR
G+xexqYKuiWYBydrS/dmHaIPdvyBslz1riWytxYbi8iQy3NE/Q3M7BdYbGUPtGXF
tClsz6kzsAXm1cR6ren/DAdOGQzRisN3zM7OBKPZniapWnSIUgj57E0CZwpEEABK
xZFCfXu13qCEXKillJyn5Z5NuxYF4w==
=eHpn
-----END PGP SIGNATURE-----

--Sig_/5rEXxMzAzgMgAL0.XHeDrkz--
